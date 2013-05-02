<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>gzm</title>   <!--TODO simple description show-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
</head>
<body>

<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li ><a href="${website}backend/projectList"><i class="icon-chevron-right"></i> 项目列表</a></li>
	      <li><a href="${website}backend/toAddProject"><i class="icon-chevron-right"></i>添加项目</a></li>
		</ul>
 	</div>
 	<div class="span9">

	<form action="${website}backend/addProject" method="post" enctype="multipart/form-data" class="form-horizontal">
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
				项目类型：
			</label>    
			<div class="controls">      
               <c:forEach items="${typeList}" var="i">
              		<c:if test="${i.id == project.type.id }">
                  	 ${i.name}
                   </c:if>
               </c:forEach>
		    </div>
	    </div>
		    
	    <div class="control-group">    
		    <label class="control-label" >
				项目描述：
			</label>    
			<div class="controls">   
				${project.description}
		    </div>
	    </div>
		    
	</form>
	</div>
  </div>
</div>


    <p>
        
    </p>
    <p>
        
    </p>
</body>
</html>