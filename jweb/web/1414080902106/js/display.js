window.onload = function() {
  home.setAttribute("class", home.getAttribute("class") + " btn btn-sm btn-success glyphicon glyphicon-circle-arrow-left");
};
function gotoHome() {
  location.href = "./home.jsp";
}
function gotoReply1() {
  reply.focus();
}
//往position里加载2级回复内容
function loadReply2(position, rid, aid) {
  //清空原来的内容
  var current = position.firstChild; 
  while (current != null) {
    position.removeChild(current);
    current = position.firstChild;
  }
  //获取2级回复内容
  createXHR();
  sendXHR("getReply2", "rid=" + rid, "get", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var reply2 = JSON.parse(XHR.responseText);
      //加载各个2级回复块
      for (var i = 0; i < reply2.length; i++) {
        var item = model.cloneNode(true);
        item.removeAttribute("id");
        //插入回复者昵称
        var author = item.firstChild.nextSibling;
        var name = author.firstChild.nextSibling;
        name.appendChild(document.createTextNode(reply2[i].name));
        name.setAttribute("href", "./account.jsp?id=" + reply2[i].aid);
        //插入回复内容
        var content = author.nextSibling.nextSibling;
        var text = content.firstChild.nextSibling;
        text.appendChild(document.createTextNode(reply2[i].text));
        //插入回复时间
        var datetime = text.nextSibling.nextSibling;
        datetime.appendChild(document.createTextNode(reply2[i].createDateTime));
        //根据当前账户插入操作按钮
        if (aid == reply2[i].aid) {
          var operation = datetime.nextSibling.nextSibling;
          var button = document.createElement("button");
          button.setAttribute("class", "delete");
          //设置删除函数
          //因为js动态设置响应事件方法有不好的特性——不能识别局部数组，以局部变量为参数传参会以该变量的最后结果为准，所以只能出此下策
          button.setAttribute("r2id", reply2[i].id);
          button.onclick = function() {removeReply2(this, position, rid, aid);};
          button.appendChild(document.createTextNode("删除"));
          operation.appendChild(button);
        }
        position.appendChild(item);
      }
    }
  });
}
//显示2级回复模块
function openReply2(btn) {
  //显示.reply2-box
  //因为第一个nextSibling是文本（#text）所以得取两次nextSibling才行
  btn.parentNode.nextSibling.nextSibling.style.display = "block";
  //把“查看回复”改成“收起回复”
  btn.innerHTML = "收起回复";
  //标记
  btn.setAttribute("openReply2", "yes");
}
//隐藏2级回复模块
function closeReply2(btn) {
  //隐藏.reply2-box
  btn.parentNode.nextSibling.nextSibling.style.display = "";
  //把“收起回复”改成“查看回复”
  btn.innerHTML = "查看回复";
  //标记
  btn.setAttribute("openReply2", "no");
}
//单击reply-btn
function onReply2Btn(btn, rid, aid) {
  var open = btn.getAttribute("openReply2");
  var load = btn.getAttribute("loadReply2");
  if (open == "no")
    openReply2(btn);
  else if (open == "yes")
    closeReply2(btn);
  if (load == "no") {
    //因为第一个子元素是文本（#text）所以得再取一次nextSibling
    loadReply2(btn.parentNode.nextSibling.nextSibling.firstChild.nextSibling, rid, aid);
    btn.setAttribute("loadReply2", "yes");
  }
}
//发表1级回复
function reply1(pid) {
  location.href = "./reply1?pid=" + pid + "&text=" + reply.value;
}
//发表2级回复
function reply2(btn, rid, aid) {
  var text = btn.previousSibling.previousSibling.value;
  createXHR();
  sendXHR("reply2", "text=" + text + "&rid=" + rid, "post", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success") {
        //刷新相应2级回复
        loadReply2(btn.parentNode.parentNode.firstChild.nextSibling, rid, aid);
        //清空刚刚输入的内容
        btn.previousSibling.previousSibling.value = "";
      }
    }
  });
}

//删除帖子
function removePosts(id) {
  createXHR();
  sendXHR("removePosts", "id=" + id, "post", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success") {
        location.href = "./home.jsp";
      } else
        alert(info);
    }
  });
}
//删除1级回复
function removeReply1(id) {
  createXHR();
  sendXHR("removeReply1", "id=" + id, "post", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success") {
        location.reload(true);
      } else
        alert(info);
    }
  });
}
//删除2级回复
function removeReply2(obj, position, rid, aid) {
  //获取要删除的2级回复的ID
  var id = obj.getAttribute("r2id");
  console.dir(id);
  createXHR();
  sendXHR("removeReply2", "id=" + id, "post", function() {
    if (XHR.readyState == 4 && XHR.status == 200) {
      var info = XHR.responseText;
      if (info == "success") {
        loadReply2(position, rid, aid);
      } else
        alert(info);
    }
  });
}
