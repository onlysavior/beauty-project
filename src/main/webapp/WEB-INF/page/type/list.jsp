<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>类型管理</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script>
    <script type="text/javascript">
         $(document).ready(function(){
        	 var type_name;
        	 var id;
        	 var oldTdHtml;
        	 
             $(".edit").click(function(){
            	 var td = $(this).parent();
            	 var tr = $(this).parent().parent();
            	 id = $(this).attr("data");
            	 type_name = tr.find(".type_name").html();
            	 oldTdHtml = td.html();
            	 td.html("<input type='button' class='btn btn-success sure_edit' value='修改'/><input type='button' class='btn btn-info cancel_type'  value='取消'/>")
            	 tr.find(".type_name").html("<input type='text' class='edit_type_name' value='"+type_name+"'/> ");
            
             });
             
             $(".cancel_type").live("click", function(){
            	 window.location.reload();
             });
             
             $(".sure_edit").live("click", function(){
            	 var thisTd = $(this).parent();
            	 var thisTr = $(this).parent().parent();
            	 var typeName= thisTr.find(".edit_type_name").val();
            	 
            	 $.ajax({
            		 type: "POST",
            		 data :{name : typeName, parentType:1, id: id },
            		 url : "${website}backend/admin/type/editType",
            		 success:function(){
            			 alert("修改成功！");
            			 window.location.reload();
            		 }
            	 });
             });
             
             $(".del").click(function(){
            	 var ids = $(this).attr("data"); 
            	 $.ajax({
            		 type:"delete",
            		 url : "${website}backend/type/"+ids,
            		 success : function(){
            			 alert("删除成功！");
            			 window.location.reload();
            		 }
            	 })
             })
         });
    </script>
</head>
<body>
     <jsp:include page="../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span1 bs-docs-sidebar" >  
 		
 	</div>
 	<div class="span10">
		<form action="${website}backend/type/addType" class="form-search" id="form" method="post">
		    产品类型名称：<input type="text" name="name" /><input name="parentType" value="1" type="hidden"/> 
		    <input type="submit"  class="btn btn-info" value="添加" >
		</form>
       <table class="table table-hover"> 
		   	<thead>
		   		<tr>
		   			<th>序号</th>
		   			<th>产品类型名称</th>
		   			<th>操作</th>
		   		</tr>
		   	</thead>
		<c:choose>
		    <c:when test="${fn:length(typeList) != 0}">
		            <c:forEach items="${typeList}" var="i" varStatus="c">
		                <tr>
		                    <td>${c.count }</td>
		                    <td class="type_name">
		                    	${i.name}
		                    </td>
		                    <td class="op_td">
		                        <input type="button" value="修改" data="${i.id }" class="edit btn btn-success" />
		                        <input type="button" value="删除" class="del btn btn-danger" data="${i.id}"/>
		                    </td>
		                </tr>
		            </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<td colspan="2">暂无产品类型</td>
		        </tr>
		    </c:otherwise>
		</c:choose>
       </table>
		<c:set scope="request" var="navUrl" value="${website}backend/projectList" />
		<c:set scope="request" var="navUrlEnd" value="${query}"/>
		<c:set scope="request" var="currentPage" value="pageNo"/>
		<%@ include file="../common/page.jsp" %>
	</div>
	<div class="span1 " >  
 		
 	</div>
	</div>
</div>	
</body>
</html>