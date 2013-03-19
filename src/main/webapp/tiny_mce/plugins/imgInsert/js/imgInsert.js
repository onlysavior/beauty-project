tinyMCEPopup.requireLangPack();

var ImgInsertDialog = {
	init : function(ed) {
		tinyMCEPopup.resizeToInnerSize();
	},

	insert : function(file, title) {
		var ed = tinyMCEPopup.editor, dom = ed.dom;
		tinyMCEPopup.execCommand('mceInsertContent', false, dom.createHTML('img', {
			src : tinyMCEPopup.getWindowArg('plugin_url') + '/js/ajax/upload/' + file,
			border : 0
		}));

		tinyMCEPopup.close();
	},
	
	resets : function(){
		window.location = "imageInsert.php";	
	}
};

tinyMCEPopup.onInit.add(ImgInsertDialog.init, ImgInsertDialog);
