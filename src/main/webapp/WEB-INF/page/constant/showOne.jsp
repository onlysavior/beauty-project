<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>静态文件</title>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li ><a href="${website}backend/constantList"><i class="icon-chevron-right"></i> 静态文件列表</a></li>
	      <li><a href="${website}backend/toAddConstant"><i class="icon-chevron-right"></i>添加静态文件 </a></li>
		</ul>
 	</div>
 	<div class="span9">
		<form id="form" action="${website }backend/addConstant" method="post" enctype="multipart/form-data">
		 <div class="control-group">    
		    <label class="control-label" >
				标题：
			</label>    
			<div class="controls">   
				${constant.title}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
				图片：
			</label>    
			<div class="controls">   
				 ${constant.picUrl}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
				内容：
			</label>    
			<div class="controls">   
				 ${constant.content}
		    </div>
	    </div>

	</form>
	</div>
	</div>
</div>



<p></p>
    <p>
       
    </p>
     <span>
         
     </span>
</body>
</html>