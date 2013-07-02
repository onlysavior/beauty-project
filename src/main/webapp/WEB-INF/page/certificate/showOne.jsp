<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>证书管理</title>   <!--TODO simple description show-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li><a href="${website }backend/certificateList"><i class="icon-chevron-right"></i> 证书列表</a></li>
	      <li ><a href="${website }backend/toAddCertificate"><i class="icon-chevron-right"></i>添加新证书信息 </a></li>
		</ul>
 	</div>
 	<div class="span9">

		<form action="${website }backend/addCertificate" method="post" enctype="multipart/form-data"  class="form-horizontal">
		    <div class="control-group">    
			    <label class="control-label" >
					图片：
				</label>    
				<div class="controls">      
			    	<img src="${project.picUrl}">
			    </div>
		    </div>
		     <div class="control-group">    
			    <label class="control-label" >
					描述
				</label>    
				<div class="controls">      
			    	 ${project.instruction}
			    </div>
		    </div>
		     
		   
		</form>
	</div>
	</div>
</div>
</body>
</html>