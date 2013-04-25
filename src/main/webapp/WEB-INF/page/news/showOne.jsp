<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${news.title}</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li ><a href="${website }backend/newsList"><i class="icon-chevron-right"></i> 新闻列表</a></li>
	      <li><a href="${website}backend/addNews"><i class="icon-chevron-right"></i>添加新闻 </a></li>
		</ul>
 	</div>
 	<div class="span9">
    <form id="form" action="${website}backend/addNews" method="post" class="form-horizontal">
    	<div class="control-group">    
		    <label class="control-label" >
				标题：
			</label>    
			<div class="controls">      
		    	${news.title}
		    </div>
	    </div>
	    <div class="control-group">    
		    <label class="control-label" >
		    发布时间：
			</label>    
			<div class="controls">      
		    	<fmt:formatDate value="${news.updatetime}" pattern="yyyy-MM-dd" />
		    </div>
	    </div>
	    <div class="control-group">    
		    <label class="control-label" >
				新闻类型：
			</label>    
			<div class="controls">      
                <c:if test="${news.type != null}">
                    ${news.type.name}
                </c:if>
		    </div>
	    </div>
	    <div class="control-group">    
		    <label class="control-label" >
				内容：
			</label>    
			<div class="controls">      
		    	 ${news.content}
		    </div>
	    </div>
	    
	    
        
    </form>
    </div>
   </div>
 </div>

</body>
</html>