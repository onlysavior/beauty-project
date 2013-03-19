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
	
	tinymce.PluginManager.requireLangPack('insertAttachment');
	
	tinymce.create('tinymce.plugins.insertAttachmentPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('insertAttachmentControl', function() {
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
			ed.addButton('insertAttachment', {title : 'insertAttachment.title', cmd : 'insertAttachmentControl', image : url + '/img/cv.png'});
		},

		getInfo : function() {
			return {
				longname : 'attachment',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions'
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('insertAttachment', tinymce.plugins.insertAttachmentPlugin);
})(tinymce);