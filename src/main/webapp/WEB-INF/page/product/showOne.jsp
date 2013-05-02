<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <title>${product.name}</title>
</head>
<body>
<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li ><a href="${website }backend/productList"><i class="icon-chevron-right"></i> 产品列表</a></li>
	      <li><a href="${website}backend/toAddProduct"><i class="icon-chevron-right"></i>添加产品 </a></li>
		</ul>
 	</div>
 	<div class="span9">
 		 <div class="control-group">    
		    <label class="control-label" >
			</label>    
			<div class="controls">      
		    	<img src="${product.picUrl}">
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
		    产品名称：
			</label>    
			<div class="controls">      
		    	${product.name}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
		    产品功能
			</label>    
			<div class="controls">      
		    	${product.function}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
		产品容量：
			</label>    
			<div class="controls">      
		    	${product.volume}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
		产品成分：
			</label>    
			<div class="controls">      
		    	${product.include}
		    </div>
	    </div>
	     <div class="control-group">    
		    <label class="control-label" >
		产品价格：
			</label>    
			<div class="controls">      
		    	  ${product.price}
		    </div>
	    </div>
 	
 	</div>
 </div>
 </div>
</body>
</html>