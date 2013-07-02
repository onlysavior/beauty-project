<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>静态文件列表 </title>
   <script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
    <script type="text/javascript" src="<c:url value='/My97DatePicker/WdatePicker.js'/>"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"${website}backend/delConstant",
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
            	window.location.href="/backend/editConstant/"+$(this).attr("data");
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
	      <li class="active"><a href="${website }backend/constantList"><i class="icon-chevron-right"></i> 静态文件列表</a></li>
	      <li><a href="${website }backend/toAddConstant"><i class="icon-chevron-right"></i>添加静态文件</a></li>
		</ul>
 	</div>
 	<div class="span9">


	 <table class="table table-hover">
	 	<thead>
	 		<tr>
	 			<th>id</th>
	 			<th>标题</th>
	 			<th>操作</th>
	 		</tr>
	 	</thead>
		<c:choose>
		    <c:when test="${fn:length(constantList) != 0}">
		            <c:forEach items="${constantList}" var="i">
		                <tr>
		                    <td>${i.id}</td>
		                    <td>
		                        <a href="/backend/constant/showOne/${i.id}">
		                                ${i.title}
		                        </a>
		                    </td>
		                    <td>
		                       <%--  <a href="${website}backend/editConstant/${i.id}"> --%>
		                        	<input type="button" data="${i.id}" value="修改" class="edit btn btn-success" />
		                       <!--  </a> -->
		                        <input type="button" value="删除" class="del btn btn-danger" data="${i.id}"/>
		                    </td>
		                </tr>
		            </c:forEach>
		    </c:when>
		    <c:otherwise>
				<tr><td colspan="3">暂无静态文件</td></tr>	        
		    </c:otherwise>
		</c:choose>
	</table>
	</div>
	</div>
</div>
</body>
</html>