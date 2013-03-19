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
	tinymce.create('tinymce.plugins.imgInsertPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('imgInsertControl', function() {
				ed.windowManager.open({
					file : url + '/imageInsert.php',
					width : 350,
					height : 200,
					inline : 1
				}, {
					plugin_url : url
				});
			});

			// Register buttons
			ed.addButton('imgInsert', {title : 'imgInsert.title', cmd : 'imgInsertControl', image : url + '/img/document_picture.png'});
		},

		getInfo : function() {
			return {
				longname : 'Emotions',
				author : 'Moxiecode Systems AB',
				authorurl : 'http://tinymce.moxiecode.com',
				infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/emotions',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('imgInsert', tinymce.plugins.imgInsertPlugin);
})(tinymce);