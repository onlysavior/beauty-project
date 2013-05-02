<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>News List</title>
    <script type="text/javascript" src="<c:url value='/My97DatePicker/WdatePicker.js'/>"></script>
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".del").click(function(){
                if(confirm("Detele it ?")){
                    $.ajax({
                        url:"/backend/delNews",
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
            	window.location.href="${website}backend/editNews/"+$(this).attr("data");
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
	      <li class="active"><a href="${website }backend/newsList"><i class="icon-chevron-right"></i> 新闻列表</a></li>
	      <li><a href="${website }/backend/addNews"><i class="icon-chevron-right"></i>添加新闻 </a></li>
		</ul>
 	</div>
 	<div class="span9">

<form class="form-search" id="form" method="post">
     <p>
     	标题:<input type="text" class="input-medium search-query" name="keyWord" id="title"/>
     	新闻类型:<select id="type" name="type">
         <c:forEach items="${typeList}" var="i">
             <option value="${i.id}">${i.name}</option>
         </c:forEach>
    	 </select>
     </p>
  <p>   
  	开始时间:<input name="startTime" type="text" onClick="WdatePicker()" id="start"  />
           结束时间:<input name="endTime" type="text" onClick="WdatePicker()" id="end" />
  	
   	  <input type="submit" class="btn" value="搜索" id="go">
   </p>
    
</form>
    <table class="table table-hover"> 
	   	<thead>
	   		<tr>
	   			<th>新闻id</th>
	   			<th>新闻标题</th>
	   			<th>发表时间</th>
	   			<th>操作</th>
	   		</tr>
	   	</thead>
		<c:choose>
		 <c:when test="${fn:length(newList) != 0}">
	         <c:forEach items="${newList}" var="i">
	             <tr>
	                 <td>${i.id}</td>
	                 <td>
	                     <a href="${website }backend/news/${i.id}">
	                         ${i.title}
	                     </a>
	                 </td>
	                 <td>
	                     <fmt:formatDate value="${i.updatetime}" pattern="yyyy-MM-dd" />
	                 </td>
	                 <td>
	                      <%-- <a href="${website }backend/editNews/${i.id}"> --%>
	                      <input type="button" value="修改" data="${i.id }" class="edit btn btn-success" />
	                     <!--  </a> -->
	                      <input type="button" value="删除" class="del btn btn-danger" data="${i.id}"/>
	                 </td>
	             </tr>
	         </c:forEach>
		 </c:when>
		<c:otherwise>
		    <tr>
		    	<td colspan="4">暂未新闻信息</td>
		    </tr>
		</c:otherwise>
		</c:choose>
   </table>
   <c:set scope="request" var="navUrl" value="${website }/backend/newsList" />
   <c:set scope="request" var="navUrlEnd" value="${query}"/>
   <c:set scope="request" var="currentPage" value="pageNo"/>
   <%@ include file="../common/page.jsp" %>
   </div>
</div>
</div>
   
</body>
</html>