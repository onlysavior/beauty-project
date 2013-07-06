<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>产品列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    
      <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
            	var id = $(this).attr("data");
            	var thisObj = $(this);
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"${website}/backend/delProduct",
                        type:"post",
                        data:{
                            id:id
                        },
                        success:function(){
                            thisObj.parent().parent().remove();
                        }
                    });
                }
            });
            
            $(".edit").click(function(){
            	window.location.href="${website}backend/editProduct/"+$(this).attr("data");	
            })
        });
    </script>
</head>
<body>

<jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 		<ul class="nav nav-list bs-docs-sidenav">
	      <li class="active"><a href="${website }backend/productList"><i class="icon-chevron-right"></i> 产品列表</a></li>
	      <li><a href="${website}backend/toAddProduct"><i class="icon-chevron-right"></i>添加产品 </a></li>
		</ul>
 	</div>
 	<div class="span9">
 	    <form class="form-search" id="form" method="post">
		    <input type="text" class="input-medium search-query" name="keyWord" id="title">
		    <input type="submit"  class="btn" value="搜索" id="go">
		</form>
 	
 	
       <table class="table table-hover">
       	<thead>
       		<tr>
       			<th>产品id</th>
       			<th>产品名称</th>
       			<th>产品价格</th>
       			<th>操作</th>
       		</tr>
       	</thead>
		<c:choose>
		    <c:when test="${fn:length(productList) != 0}">
		            <c:forEach items="${productList}" var="i">
		                <tr>
		                    <td>${i.id}</td>
		                    <td>
		                        <a href="${website}backend/showProduct/${i.id}">
		                            ${i.name}
		                        </a>
		                    </td>
		                    <td>
		                        ${i.price}
		                    </td>
		                    <td>
		                       <%--  <a href="${website}backend/editProduct/${i.id}"> --%>
		                        <input type="button" value="修改" class="edit btn btn-success" data="${i.id}" />
		                       <!--  </a> -->
		                        <input type="button" value="删除" class="del btn btn-danger"  data="${i.id}"/>
		                    </td>
		                </tr>
		            </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<td colspan="4">暂无产品</td>
		        </tr>
		    </c:otherwise>
		</c:choose>
        </table>
		<c:set scope="request" var="navUrl" value="${website }/backend/productList" />
		<c:set scope="request" var="navUrlEnd" value="${query}"/>
		<c:set scope="request" var="currentPage" value="pageNo"/>
		<%@ include file="../common/page.jsp" %>
	</div>
	</div>
</div>
</body>
</html>