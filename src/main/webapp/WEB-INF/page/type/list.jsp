<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Add Type</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
         $(document).ready(function(){
             
         });
    </script>
</head>
<body>
     <jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li class="active"><a href="${website}backend/projectList"><i class="icon-chevron-right"></i> 项目列表</a></li>
	      <li><a href="${website}backend/toAddProject"><i class="icon-chevron-right"></i>添加项目</a></li>
		</ul>
 	</div>
 	<div class="span9">
		<form class="form-search" id="form" method="post">
		    <input type="text" class="input-medium search-query" style="30px" name="keyWord" id="title">
		    <input type="submit"  class="btn" value="搜索" id="go">
		</form>
       <table class="table table-hover"> 
		   	<thead>
		   		<tr>
		   			<th>序号</th>
		   			<th>类型名称</th>
		   			<th>父类别</th>
		   			<th>操作</th>
		   		</tr>
		   	</thead>
		<c:choose>
		    <c:when test="${fn:length(typeList) != 0}">
		            <c:forEach items="${typeList}" var="i" varStatus="c">
		                <tr>
		                    <td>${c.count }</td>
		                    <td>
		                    	${i.name}
		                    </td>
		                    <td>
		                    	${typeEnums.i.value}
		                    </td>
		                    <td>
		                      <a href="${website }backend/editProject/${i.id}"> 
		                        <input type="button" value="修改" data="${i.id }" class="edit btn btn-success" />
		                       </a> 
		                        <input type="button" value="删除" class="del btn btn-danger" data="${i.id}"/>
		                    </td>
		                </tr>
		            </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<td colspan="2">暂无产品</td>
		        </tr>
		    </c:otherwise>
		</c:choose>
       </table>
		<c:set scope="request" var="navUrl" value="${website}backend/projectList" />
		<c:set scope="request" var="navUrlEnd" value="${query}"/>
		<c:set scope="request" var="currentPage" value="pageNo"/>
		<%@ include file="../common/page.jsp" %>
	</div>
	</div>
</div>	
</body>
</html>