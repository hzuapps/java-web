/**
 * Created by Administrator on 2016/8/26.
 */

/**
 * 访问路径开始
 */
var selectAllOrgTreeUrl_ = "/infoManager/organization/doSelectAllOrgTree.do";
var selectOneOrgTreeUrl_ = "/infoManager/organization/doSelectOneOrgTree.do";
var deleteOneOrgUrl_ = "/infoManager/organization/doDelete.do";
var updateOrgTreeUrl_ = "/infoManager/organization/doUpdateOrgTree.do";
var updateOrgUrl_ = "/infoManager/organization/doUpdateOrg.do";
var addOrgUrl_ = "/infoManager/organization/doAddOrg.do";

/**
 * 参数集合，切勿删除
 */
var params_json = null;

/**
 * ztree设置
 */
var setting = {
    async: {
        enable: true,
        url: selectAllOrgTreeUrl_,
        otherParam:params_json,
    },
    view: {
        addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom,
        selectedMulti: false
    },
    edit: {
        enable: true,
        editNameSelectAll: true,
        showRemoveBtn: true,
        showRenameBtn: true,

        drag:{
            autoExpandTrigger: true,
            prev: dropPrev,
            inner: dropInner,
            next: dropNext
        }
    },

    callback: {
        beforeAsync: zTreeBeforeAsync,
        onAsyncSuccess: zTreeOnAsyncSuccess,

        beforeDrag: beforeDrag,
        beforeDrop: beforeDrop,
        beforeDragOpen: beforeDragOpen,

        onDrag: onDrag,
        onDrop: onDrop,
        onExpand: onExpand,

        beforeEditName: beforeEditName,
        beforeRemove: beforeRemove,
        beforeRename: beforeRename,

        onClick:showOrgInfo
    }
};

var zNodes = [];



//工具js模块
var appCommon = $.C_getCommon("appCommon");
var commonUtils = $.C_getCommon("commonUtils");
var commonValidation = $.C_getCommon("commonValidation");

//zTree相关方法所需变量
var curDragNodes,autoExpandNode;


$(function() {
    //遮罩
    initPage();
    setting.async.otherParam = params_json;
    $.fn.zTree.init($("#orgTree"), setting);
    $("#resetBtn").bind("click", selectAll);
    $("#searchBtn").bind("click",selectOne);
});

/**
 * 初始化页面元素
 */
function initPage() {
}


function showOrgInfo(event, treeId, treeNode){
    $("#show_org_name").val(treeNode.name);
    $("#show_org_des").val(treeNode.description);
    openShowWin();
}


//zTree相关方法所需变量
var className = "dark";
function beforeDrag(treeId, treeNodes) {
    return false;
}

/**
 * zTree异步加载事件发生之前
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function zTreeBeforeAsync(treeId, treeNode) {
    return true;
};

/**
 * zTree异步加载完成时的回调函数
 * 根据父页面的tmpOrgCode组织码选择节点
 */
function zTreeOnAsyncSuccess(){
}

/**
 * 通过点击ztree附带的修改名字按钮获取组织信息，并打开更新窗口
 * @param treeId
 * @param treeNode
 * @returns {boolean}
 */
function beforeEditName(treeId, treeNode) {
    className = (className === "dark" ? "":"dark");
    var zTree = $.fn.zTree.getZTreeObj("orgTree");
    var parentNode = treeNode.getParentNode();
    var pcode = parentNode===null?"-1":parentNode.code;
    zTree.selectNode(treeNode);
    $("#update_org_id").val(treeNode.id);
    $("#update_org_name").val(treeNode.name);
    $("#update_org_des").val(treeNode.description);
    openUpdateWin();
    return false;
}

//开启更新窗口
function openUpdateWin() {
    $("#update-modal").modal('show');
}

//关闭更新窗口
function closeUpdateWin() {
    $("#update-modal").modal('hide');
}

//开启新增窗口
function openAddWin() {
    $("#add-modal").modal('show');
}

//关闭新增窗口
function closeAddWin() {
    $("#add-modal").modal('hide');
}

//开启展示窗口
function openShowWin() {
    $("#show-modal").modal('show');
}

//关闭新增窗口
function closeShowWin() {
    $("#show-modal").modal('hide');
}

/**
 * 新增组织
 */
function addOrg(){
    var data = appCommon.getHtmlFormJsons('add_orgInfo');
    var params = $.extend(data, {
    });
    appCommon.ajaxFunction(
        addOrgUrl_,
        params,
        false,
        function(result){
            console.log(result);
            if (result.success) {
                alert("新增成功");
                var pcode = data.pcode;
            }else{
                alert("system error");
            }
            closeAddWin();
        }
    );
}

/**
 * 根据id更新组织
 */
function updateOrg(){
    var data = appCommon.getHtmlFormJsons('update_orgInfo');
    params = $.extend(data, {
    });
    appCommon.ajaxFunction(
        updateOrgUrl_,
        params,
        false,
        function(result) {
            if (result.success) {
                closeUpdateWin();
                alert("更新成功");
                return true;
            }else{
                closeUpdateWin();
                alert("system error");
                return false;
            }
        });
}

//根据id删除节点，根据code,关联删除子节点
function beforeRemove(treeId, treeNode) {
    className = (className === "dark" ? "":"dark");
    var zTree = $.fn.zTree.getZTreeObj("orgTree");
    zTree.selectNode(treeNode);
    if(confirm("确认删除 组织 -- " + treeNode.name + " 吗？")){
        var id = treeNode.id;
        appCommon.ajaxFunction(
            deleteOneOrgUrl_,
            params,
            false,
            function(result) {
                if (result.success) {
                    alert("删除成功");
                    return true;
                }else{
                    alert("system error");
                    return false;
                }
            });
    }
}

function beforeRename(treeId, treeNode, newName, isCancel) {
    className = (className === "dark" ? "":"dark");
    if (newName.length == 0) {
        alert("节点名称不能为空.");
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        setTimeout(function(){zTree.editName(treeNode)}, 10);
        return false;
    }
    return true;
}


var newCount = 1;
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='add node' onfocus='this.blur();'></span>";
    sObj.after(addStr);
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
        var zTree = $.fn.zTree.getZTreeObj("orgTree");
        zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
        $("#add_org_pcode").val(treeNode.code);
        openAddWin();
        return false;
    });
};


function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
};
function selectAll() {
    setting.async.otherParam = params_json;
    setting.async.url = selectAllOrgTreeUrl_;
    $.fn.zTree.init($("#orgTree"), setting);
}

function selectOne(){
    var orgName = $("#search_orgName").val();
    if(orgName==null || orgName==""){
        alert("请输入组织名称");
        return false;
    }
    var params = {};

    setting.async.otherParam = params;
    setting.async.url = selectOneOrgTreeUrl_;
    $.fn.zTree.init($("#orgTree"), setting);
}




function beforeDrag(treeId, treeNodes){
    className = (className === "dark" ? "":"dark");
    for(var i= 0,len=treeNodes.length; i<len;i++){
        if(treeNodes[i].drag === false){
            curDragNodes = null;
            return false;
        }else if(treeNodes[i].parentTId && treeNodes[i].getParentNode().childDrag === false){
            curDragNodes = null;
            return false;
        }
    }
    curDragNodes = treeNodes;
    return true;
}

function beforeDragOpen(treeId,treeNode){
    autoExpandNode = treeNode;
    return true;
}

function beforeDrop(treeId, treeNodes, targetNode, moveType, isCopy){
    className = (className === "dark" ? "":"dark");
    return true;
}

function onDrag(event,treeId,treeNodes){
    className = (className === "dark" ? "":"dark");
}

//根据拖动后的结果改变原组织树的排序设定
function onDrop(event, treeId, treeNodes, targetNode, moveType, isCopy){

    //console.log(treeNodes[0].getParentNode());
    className = (className === "dark"?"":"dark");
    var treeObj = $.fn.zTree.getZTreeObj("orgTree");
    var ids = "";
    var midIds = "";
    var minSort = 0;
    var parentNode = treeNodes[0].getParentNode()
    var pcode = null;
    if(parentNode!=null){
        pcode = parentNode.code;
    }
    var code = pcode ===null?"-1":pcode;
    var nodes = treeObj.getSelectedNodes();
    var first = true;
    if(nodes.length > 0){
        var lastNode = nodes[0].getPreNode();
        if(lastNode!=null){
            minSort = lastNode.getIndex() + 1;
        }else{
            minSort = 0;
        }
        var len = nodes.length;
        //拼接被选择节点的集合的id
        for(var i=0;i<len;i++){
            var tmpNode = nodes[i];
            if(tmpNode!=null){
                if(first){
                    midIds = midIds + tmpNode.id;
                    first = false;
                }else{
                    midIds = midIds + "," + tmpNode.id;
                }
            }
        }

        //拼接所选节点后的集合的id
        var tnode = nodes[nodes.length-1];
        var nextNode = tnode.getNextNode();
        ids = midIds;
        while(nextNode){
            ids = ids + "," + nextNode.id;
            nextNode = nextNode.getNextNode();
        }
        var params = {
            "midIds":midIds,
            "pcode": code,
            "ids": ids,
            "minSort": minSort
        };

        //更新ids中所有节点的顺序关系，更新midIds中所有节点的父节点
        appCommon.ajaxFunction(
            updateOrgTreeUrl_,
            params,
            false,
            function(result) {
                if (result.success) {
                    alert("组织顺序更新成功");
                    return true;
                }else{
                    alert("system error");
                    return false;
                }
            });
    }
}

function onExpand(event,treeId,treeNode){
    if(treeNode === autoExpandNode){
        className = (className === "dark"? "" :"dark");
    }
}


function dropPrev(treeId,nodes,targetNode){
    var pNode = targetNode.getParentNode();
    if(pNode && pNode.dropInner === false){
        return false;
    }else{
        for(var i= 0,len=curDragNodes.length; i<len;i++){
            var curPNode = curDragNodes[i].getParentNode();
            if(curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false){
                return false;
            }
        }
    }
    return true;
}

function dropInner(treeId,nodes,targetNode){
    if(targetNode && targetNode.dropInner === false){
        return false;
    }else{
        for(var i= 0,len=curDragNodes.length; i<len;i++){
            if(!targetNode && curDragNodes[i].dropRoot === false){
                return false;
            }else if(curDragNodes[i].parentTId && curDragNodes[i].getParentNode()!== targetNode&&
                curDragNodes[i].getParentNode().childOuter === false){
                return false;
            }
        }
    }
    return true;
}

function dropNext(treeId,nodes,targetNode){
    var pNode = targetNode.getParentNode();
    if(pNode && pNode.dropInner === false){
        return false;
    }else{
        for(var i= 0,len=curDragNodes.length; i<len;i++){
            var curPNode = curDragNodes[i].getParentNode();
            if(curPNode && curPNode !== targetNode.getParentNode() && curPNode.childOuter === false){
                return false;
            }
        }
    }
    return true;
}

