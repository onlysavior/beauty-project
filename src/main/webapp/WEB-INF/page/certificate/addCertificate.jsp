<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>Add Certificate</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8"  src="<c:url value='/tiny_mce/tiny_mce.js'/>"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            tinyMCE.init({
                // General options
                mode : "textareas",
                theme : "advanced",
                skin : "o2k7",
                plugins : "insertImg, insertAttachment, example,imgInsert,autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,inlinepopups,autosave",

                // Theme options
                theme_advanced_buttons1 : "insertAttachment, example,imgInsert,save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                theme_advanced_buttons2 : "insertImg, cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft",
                theme_advanced_toolbar_location : "top",
                theme_advanced_toolbar_align : "left",
                theme_advanced_statusbar_location : "bottom",
                theme_advanced_resizing : true,

                // Example word content CSS (should be your site CSS) this one removes paragraph margins
                content_css : "css/word.css",

                // Drop lists for link/image/media/template dialogs
                template_external_list_url : "lists/template_list.js",
                external_link_list_url : "lists/link_list.js",
                external_image_list_url : "lists/image_list.js",
                media_external_list_url : "lists/media_list.js",

                // Replace values for the template plugin
                template_replace_values : {
                    username : "Some User",
                    staffid : "991234"
                }
            });
        });
    </script>
</head>
<body>
<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li><a href="${website }backend/certificateList"><i class="icon-chevron-right"></i> 证书列表</a></li>
	      <li class="active"><a href="${website }backend/toAddCertificate"><i class="icon-chevron-right"></i>添加新证书信息 </a></li>
		</ul>
 	</div>
 	<div class="span9">

		<form action="${website }backend/addCertificate" method="post" enctype="multipart/form-data"  class="form-horizontal">
		    <div class="control-group">    
			    <label class="control-label" >
					上传图片
				</label>    
				<div class="controls">      
			    	<input type="file" name="file" id="file">
			    </div>
		    </div>
		     <div class="control-group">    
			    <label class="control-label" >
					描述
				</label>    
				<div class="controls">      
			    	<textarea name="description" rows="25"></textarea>
			    </div>
		    </div>
		    
		    
		     <div class="control-group">    
			    <label class="control-label" >
				</label>    
				<div class="controls">      
			    	<input type="submit" value="提交" class="btn btn-success">
		        	<input type="reset" value="重置" class="btn btn-primary">
			    </div>
		    </div>
		   
		</form>
	</div>
	</div>
</div>
</body>
</html>