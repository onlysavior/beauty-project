<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>证书列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"${website}/backend/delCertificate",
                        type:"post",
                        data:{
                            id:$(this).attribute("data")
                        },
                        success:function(){
                            $(this).parent().parent().remove();
                        }
                    });
                }
            });
            
            $(".edit").click(function(){
            	window.location.href="${website}backend/editCertificate/"+$(this).attr("data");	
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
	      <li class="active"><a href="${website }backend/certificateList"><i class="icon-chevron-right"></i> 证书列表</a></li>
	      <li><a href="${website }backend/toAddCertificate"><i class="icon-chevron-right"></i>添加新证书信息 </a></li>
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
		   			<th>证书id</th>
		   			<th>操作</th>
		   		</tr>
		   	</thead>
		<c:choose>
		    <c:when test="${fn:length(productList) != 0}">
		            <c:forEach items="${productList}" var="i">
		                <tr>
		                    <td><a href="${website }backend/showCertificate/${i.id}"> ${i.id}</a></td>
		                    <td>
		                        <%-- <a href="${website }backend/editCertificate/${i.id}"> --%>
		                        	<input type="button" value="修改" class="edit btn btn-success" data="${i.id}" />
		                        <!-- </a> -->
		                        <input type="button" value="删除" class="del btn btn-danger" data="${i.id}"/>
		                    </td>
		                </tr>
		            </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<td colspan="2">暂无证书信息</td>
				</tr>
		    </c:otherwise>
		</c:choose>
        </table>
		<c:set scope="request" var="navUrl" value="${website}/backend/certificateList" />
		<c:set scope="request" var="navUrlEnd" value="${query}"/>
		<c:set scope="request" var="currentPage" value="pageNo"/>
		<%@ include file="../common/page.jsp" %>
		</div>
	</div>
</div>
</body>
</html>