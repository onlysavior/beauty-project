tinyMCEPopup.requireLangPack();

var attachmentDialog = {
	init : function() {
	},
	
	submits :	function(){
		$("#attForm").hide();
		document.forms[0].submit();
		$("#ajaxLoading").show();
	},
	
	uploadFail : function ( infoNum ){
		$("#ajaxLoading").hide();
		$("#attForm").show();
		infoDisplay(infoNum);
	},
	
	insertPre : function (url) {
		var s1 = '<div class="mceActionPanel"><input type="button" id="insert" name="insert" value="上传图片" onclick="attachmentDialog.insert(\''+url+'\');" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
		var s2 = '<input type="button" id="cancel" name="cancel" value="取消" onclick="tinyMCEPopup.close();" /></div>';
		$("#ajaxLoading").html(s1 + s2);
	},
	
	insert : function(url) {
		// Insert the contents from the input into the document
		var ss = "<span><img src='"+ url +"' class='imgTiny'>"  + "</img></span>";
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, ss);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(attachmentDialog.init, attachmentDialog);

//validate if the file can be upload
var validate = function (b, suffix){
	
	var file = document.attForm.file.value;
	
	//b is the boolean weather the name of attachment is empty
	var isEmpty = b;
	
	//
	if (isEmpty && !suffix) 
	{
		if(file === "") 
		{
			infoDisplay(2);
			return false;
		}
		else
		{
			return true;
		}
	}
	else if(!isEmpty && !suffix)
	{
		if(name == "")
		{
			infoDisplay(3);
			return false;
		}	
		else if(file === "")
		{
			infoDisplay(2);
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		return true;
	}
};

var infoDisplay = function ( which ){
		$("#errorInfo p").hide();	
		$("#errorInfo").show();
		$("#errorInfo p").eq(which).show();
};