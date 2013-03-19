tinyMCEPopup.requireLangPack();

var attachmentDialog = {
	init : function() {
	},
	
	submits :	function(){
		if (!validate(1)) {
			alert('validate false');
			return false;
		}
		$("#attForm").hide();
		document.forms[0].submit();
		$("#ajaxLoading").show();
	},
	
	uploadFail : function ( infoNum ){
		$("#ajaxLoading").hide();
		$("#attForm").show();
		infoDisplay(infoNum);
	},
	
	insert : function(url) {
		var name = document.attForm.AttachName.value || "附件";
		// Insert the contents from the input into the document
		var ss = "<span><a href='' class='file'>"+ name +"</a><input class = 'info' type='hidden' value='"+url+"'></span>";
		alert(ss);
		tinyMCEPopup.editor.execCommand('mceInsertContent', false, ss);
		tinyMCEPopup.close();
	}
};

tinyMCEPopup.onInit.add(attachmentDialog.init, attachmentDialog);

//validate if the file can be upload
var validate = function (b, suffix){
	
	var file = document.attForm.img.value;
	var name = document.attForm.fileNameUseByUser.value;
	
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
		$("#errorInfo"	).show();
		$("#errorInfo p").eq(which).show();
};