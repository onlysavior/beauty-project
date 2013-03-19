<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
	<title>插入图片</title>
</head>

<body style="display: " role="application" aria-labelledby="app_title">
<span style="display:none;" id="app_title">插入图片</span>
<div align="center">
	<div class="title">{#imgInsert_dlg.title}:<br /><br /></div>
<?php
	// This is the folder where file are uploaded
	$uploadDirectory = "js/ajax/upload";
	require_once("js/ajax/AjaxFileUploader.inc.php");
	$ajaxFileUploader = new AjaxFileuploader($uploadDirectory);	
	echo $ajaxFileUploader->showFileUploader('id1');
?>
</div>
</body>
<script type="text/javascript" src="../../tiny_mce_popup.js"></script>
<script type="text/javascript" src="js/imgInsert.js"></script>
<script type="text/javascript" src="js/ajax/uploader.js" ></script>
<script type="text/javascript" src="js/imgVal.js"></script>
<script type="text/javascript" src="js/imgValOptions.js"></script>
<script type="text/javascript">
imgValidateCons.store.init();
var store = imgValidateCons.store;
</script>
</html>
