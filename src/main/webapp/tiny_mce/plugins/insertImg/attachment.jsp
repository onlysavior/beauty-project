<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/attach.css" />
<script type="text/javascript" src="../../tiny_mce_popup.js"></script>
    <script type="text/javascript" src="<c:url value='/tiny_mce/plugins/insertAttachment/js/dialog222.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/tiny_mce/plugins/insertAttachment/js/common.js'/>"></script>
</head>
<body>
<form  id="attForm" name="attForm"   target="dd" action="/upload" method="post" enctype="multipart/form-data"  >
	<div id="errorInfo">
	  	<p>对不起，您上传的文件格式不正确,请从新上传。</p>
	    <p>上传文件失败，请从新上传。</p>
	    <p>未选择上传文件</p>
	    <p>请输入附件名称</p>
   </div>
  <input type="file" name="img" id="img"/>
   <div class="mceActionPanel">
	<input type="button" id="insert" name="insert" value="{#insert}" onclick="attachmentDialog.submits();" />
	<input type="button" id="cancel" name="cancel" value="{#cancel}" onclick="tinyMCEPopup.close();" />
	</div>
</form>
<div id="ajaxLoading">
	<p>附件上传中，请稍后。。。</p>
	<img src="img/ajax-loader.gif" />
</div>
<iframe style="display:none;" src="" id="dd" name="dd">
</iframe>
</body>
</html>