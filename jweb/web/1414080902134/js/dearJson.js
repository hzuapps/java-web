var OP = [
          	"insert",	//all
          	"delete",	//id
          	"getall",	//x
          	"update"	//all(id)
          ];
var body_ = null;
var defaultUrl = "../notesOP?OP=";
var note = {};
var total_note = 1;
var second_element = null;
var hidden_input_attr = {
		"hidden":"",
		"type":"text"
};
//used to store the information which will be dear
var dearList = {
		"remove" : [],
		"update" : [],
		"insert" : []
};
var dearJson = function(){
	
}

/**
 * op_index
 * obj : html element
 */
var sendAjax = function(op_index,obj){
	$.ajax({
		url : "../notesOP?OP=" + OP[op_index],
		complete : function(data) {
		    console.log(data);
		}
	});
}

var addnote = function(note){
	if (!body_) {
		body_ = document.getElementsByClassName("main-panel")[0];
	}
	if (!body_) {
		console.log("[important] execute fail , something wrong .");
		return;
	}
	{
		body_.appendChild(addNoteHelp(note));
	}
}
function addNoteHelp(note){
	var copy_attr = hidden_input_attr;
	total_note++;
	var maindiv_ = createEle("div","panel panel-info odd-label","note_" + total_note);
	
	//add input 
	copy_attr["value"] = note.id;
	maindiv_.appendChild(createEle("input","note_id",null,null,copy_attr));
	var headdiv_ = 
		createEle(	
					"div",
					"panel-heading cohead_");
	headdiv_.appendChild(
			createEle(
					"span",
					"glyphicon glyphicon-leaf title_",
					null,
					safeCharToChar(note.title)
					)
			);
	maindiv_.appendChild(headdiv_);
	var button_1 = createEle("button","actionButton");
	headdiv_.appendChild(button_1);
	button_1.appendChild(createEle("span","glyphicon glyphicon-remove icon_padding"));
	button_1.op = {
			"op" : "remove",
			"id" : "note_" + total_note
	};
	button_1.onclick = removeNote;
	var button_3 = createEle("button","actionButton");
	headdiv_.appendChild(button_3);
	button_3.appendChild(createEle("span","glyphicon glyphicon-floppy-saved"));
	button_3.op = {
			"op" : "update",
			"id" : "note_" + total_note
	};
	button_3.style.display = "none";
	button_3.onclick = saveUpdate;
	var button_2 = createEle("button","actionButton");
	headdiv_.appendChild(button_2);
	button_2.appendChild(createEle("span","glyphicon glyphicon-pencil icon_padding"));
	button_2.op = {
			"op" : "edit",
			"id" : "note_" + total_note
	};
	button_2.onclick = rewriteNote;
	
	var contentdiv_ = createEle(
			"div",
			"panel-body mybody content_",
			null,
			safeCharToChar(note.content)
		);
	maindiv_.appendChild(contentdiv_);
	
	var footerdiv_ = createEle("div","panel-footer");
	maindiv_.appendChild(footerdiv_);
	var qCodeDiv_ = createEle("div","qCode",null,"QCode : " + note.QCode);
	footerdiv_.appendChild(qCodeDiv_);
	copy_attr["value"] = note.QCode;
	qCodeDiv_.appendChild(createEle("input","qCode_",null,null,copy_attr));
	var timeDiv_ = createEle("div","time",null,note.time.split(' ')[0]);
	footerdiv_.appendChild(timeDiv_);
	copy_attr["value"] = note.time.split(' ')[0];
	timeDiv_.appendChild(createEle("input","time_",null,null,copy_attr));
	return maindiv_;
}

/**
 * attr is obj
 */
var createEle = function(type_,class_,id_,innerText_,attr){
	if (!type_) {
		console.log("[important] type_ is not exit when execute createEle");
		return null;
	}
	var ele = document.createElement(type_);
	if (class_) {
		if (class_ instanceof Array) {
		} else {
			class_ = class_.split(' ');
		}
		class_.forEach(function(i){
			ele.classList.add(i);
		});
	}
	if (id_) {
		ele.id = id_;
	}
	if (innerText_) {
		ele.innerText = innerText_;
	}
	if (attr) {
		for (var i in attr) {
			ele.setAttribute(i,attr[i]);
		}
	}
	return ele;
}

var operator = function(url_,op){
	//"../notesOP?OP=getall"
	if (!url_) {
		return;
	}
	if (!op) {
		return ;
	}
	$.ajax({
		url : url_,
		complete : function(data) {
//			JSON.parse(data.responseText)
//				.note
//					.forEach(function(i){
//						addnote(i);
//					});
			dearwith(JSON.parse(data.responseText));
		}
	});
}

var clear_newnote = function(id_){
	var tar = document.getElementById(id_);
	tar.getElementsByClassName("title_")[0].value = "";
	tar.getElementsByClassName("content_")[0].value = "";
}

var create_newnote = function(id_){
	var tar = document.getElementById(id_);
	var str = fillParam(tar,"0");
	//console.log("str =" + str);
	operator("../notesOP?OP=" + OP[0] + str,OP[0]);
}

var fillParam = function(obj,id){
	var str = "&id=";
	if (id) {
		str += id.toString();
	} else {
		str += obj.getElementsByClassName("note_id")[0].value;
	}
	if (obj.getElementsByClassName("ttitle_")[0]) {
		str += "&title=" + toSafeChar(obj.getElementsByClassName("ttitle_")[0].value);
	} else {
		str += "&title=" + toSafeChar(obj.getElementsByClassName("title_")[0].value);
	}
	if (obj.getElementsByClassName("tcontent_")[0]) {
		str += "&content=" + toSafeChar(obj.getElementsByClassName("tcontent_")[0].value);
	} else {
		str += "&content=" + toSafeChar(obj.getElementsByClassName("content_")[0].value);
	}
	str += "&quickCode=" + obj.getElementsByClassName("qCode_")[0].value;
	str += "&lastTime=" + obj.getElementsByClassName("time_")[0].value;
	return str;
}

var removeNote = function() {
	var removeId = document.getElementById(this.op.id)
						.getElementsByClassName("note_id")[0].value;
	operator(defaultUrl + OP[1] + "&id=" + 
				removeId + 
				"&title=&content=",OP[1]
	)
	dearList["remove"].push({
		"noteid" : this.op.id,
		"note_db_id" : removeId
	});
}

var rewriteNote = function() {
	//change to edit view
	//store the current information
	var node_ = {};
	var ele = document.getElementById(this.op.id);
	node_["title"] = ele.getElementsByClassName("title_")[0].innerText;
	node_["content"] = ele.getElementsByClassName("content_")[0].innerText;
	node_["QCode"] = ele.getElementsByClassName("qCode_")[0].innerText;
	node_["time"] = ele.getElementsByClassName("time_")[0].innerText;
	node_["id"] = ele.getElementsByClassName("note_id")[0].innerText;
	node_["ele"] = this.op.id;
	dearList["update"].push(node_);
	ele.getElementsByClassName("glyphicon glyphicon-floppy-saved")[0]
		.parentNode
		.style.display = "block";
	ele.getElementsByClassName("glyphicon glyphicon-remove icon_padding")[0]
		.parentNode
		.onclick = recoverNote;
	ele.getElementsByClassName("glyphicon glyphicon-remove icon_padding")[0]
		.style.color = "#ef6db5";
	ele.getElementsByClassName("title_")[0].style.display = "none";
	ele.getElementsByClassName("panel-heading")[0]
		.appendChild(tTitle(node_["title"]));
	ele.getElementsByClassName("content_")[0].innerText = "";
	ele.getElementsByClassName("content_")[0]
		.appendChild(tContent(node_["content"]));
	this.style.display = "none";
}

var tTitle = function(title){
	var input = createEle("input","head_input ttitle_");
	input.setAttribute("placeholder",title);
	input.value = title;
	return input;
}

var tContent = function(content_){
	var content = createEle("textarea","body_textarea tcontent_");
	content.value = content_;
	return content;
}

var saveUpdate = function(){
	var str = fillParam(document.getElementById(this.op.id));
	operator(defaultUrl + OP[3] + str,OP[3]);
}

var recoverNote = function(){
	for (var i = 0;i < dearList["update"].length;i++) {
		if (this.op.id == dearList["update"][i].ele) {
			recoverNoteHelp(
						dearList["update"][i],
						document.getElementById(dearList["update"][i].ele)
					);
			dearList["update"].splice(i,0);
			break;
		}
	}
}

var recoverNoteHelp = function(obj,ele){
	var btn;
	btn = ele
			.getElementsByClassName("glyphicon glyphicon-remove icon_padding")[0]
			.parentNode;
	ele.getElementsByClassName("title_")[0].value = obj["title"];
	ele.getElementsByClassName("content_")[0].value = obj["content"];
	ele.getElementsByClassName("glyphicon glyphicon-floppy-saved")[0]
			.parentNode
			.style.display = "none";
	ele.getElementsByClassName("glyphicon glyphicon-pencil icon_padding")[0]
			.parentNode
			.style.display = "block";
	btn.childNodes[0].style.color = "#31708f";
	btn.onclick = removeNote;
	btn.parentNode.removeChild(ele.getElementsByClassName("ttitle_")[0]);
	ele.getElementsByClassName("title_")[0].style.display = "block";
	ele.getElementsByClassName("title_")[0].innerText = obj.title;
	ele.getElementsByClassName("content_")[0].innerText 
			= obj.content;
}

var overUpload = function(){
	var d = dearList["update"].shift();
	var ele = document.getElementById(d.ele);
	d.title = ele.getElementsByClassName("ttitle_")[0].value;
	d.content = ele.getElementsByClassName("tcontent_")[0].value;
	recoverNoteHelp(d,ele);
}

var removeOneNote = function(id){
	if (!body_) {
		body_ = document.getElementsByClassName("main-panel")[0];
	}
	if (body_) {
		if (typeof id == "string") {
			id = document.getElementById(id);
		}
		if (id == second_element) {
			second_element = second_element.nextElementSibling;
		}
		body_.removeChild(id);
	}
}

var dearwith = function(obj) {
	switch (obj.op) {
		case "getall" :
			obj.note
				.forEach(function(i){
				addnote(i);
			});
			second_element = document.getElementById("note_2");
			break;
		case "remove":
			dearList["remove"].forEach(function(i,j){
				if (obj.cout == i["note_db_id"]) {
					dearList["remove"].splice(j,1);
					removeOneNote(i["noteid"]);
				}
			});
			break;
		case "insert" :
			var newNote = addNoteHelp(obj.note[0]);
			if (second_element) {
				body_.insertBefore(newNote,second_element);
				second_element = newNote;
			} else {
				body_.appendChild(newNote);
			}
			clear_newnote("note_1");
			break;
		case "update" :
			overUpload();
			break;
		default :
			break;
	}
	//console.log(obj);
}

var toSafeChar = function(str) {
	var newStr = "";
	for (var i = 0;i < str.length;i++) {
		if (str[i] == '\n') {
			newStr += String.fromCharCode(9999);
		} else if (str[i] == '&') {
			newStr += String.fromCharCode(9999);
		} else {
			newStr += str[i];
		}
	}
	return newStr;
}

var safeCharToChar = function(str){
	while (str.indexOf("&#9999;") + 1) {
		str = str.replace("&#9999;","\n")
	}
	while (str.indexOf("&#9998;") + 1) {
		str = str.replace("&#9998;","&")
	}
	return str;
}


