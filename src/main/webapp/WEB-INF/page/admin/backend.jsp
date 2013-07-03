<%--
  Created by IntelliJ IDEA.
  com.aaa.bbb.User: Administrator
  Date: 13-3-13
  Time: 下午10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel='stylesheet' href="${website}resources/css/index.css"/>
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
 	
 	<div class="span1"> &nbsp; </div>
   	<div class="backend_index span10" style="height:700px"></div>
   	<div class="span1"> &nbsp; </div>
 	</div>
 	</div>
 	</div>
 	
</body>
</html>