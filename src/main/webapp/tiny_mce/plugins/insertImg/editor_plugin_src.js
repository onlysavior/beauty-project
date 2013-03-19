/**
 * editor_plugin_src.js
 *
 * Copyright 2009, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */

(function(tinymce) {
	
	tinymce.PluginManager.requireLangPack('insertImg');
	
	tinymce.create('tinymce.plugins.insertImgPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('insertImgControl', function() {
				ed.windowManager.open({
					file : url + '/attachment.jsp',
					width : 350,
					height : 200,
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('insertImg', {title : 'insertImg.title', cmd : 'insertImgControl', image : url + '/img/document_picture.png'});
		},

		getInfo : function() {
			return {
				longname : 'insertImg',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions'
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('insertImg', tinymce.plugins.insertImgPlugin);
})(tinymce);