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
        	 var type_parent_name;
        	 var id;
        	 var oldTdHtml;
        	 
             $(".edit").click(function(){
            	 var td = $(this).parent();
            	 var tr = $(this).parent().parent();
            	 id = $(this).attr("data");
            	 var type_parent = tr.find(".type_parent").attr("data");
            	 type_name = tr.find(".type_name").html();
            	 type_parent_name = tr.find(".type_parent").html();
            	 oldTdHtml = td.html();
            	 
            	 td.html("<input type='button' class='btn btn-success sure_edit' value='修改'/><input type='button' class='btn btn-info cancel_type'  value='取消'/>")
            	 tr.find(".type_name").html("<input type='text' class='edit_type_name' value='"+type_name+"'/> ");
            	 $.ajax({
            		 type:"get",
            		 url : "${website}backend/type/parents",
            		 success: function(data){
            			 var data = eval("("+data+")");
            			 console.log(typeof(data));
            			 var newhtml = "<select class='select_type'>"
            			 for(var key in data){
            				 if(key-0 == type_parent-0){
            					newhtml = newhtml + "<option value ='"+key+"' selected='selected'>"+data[key]+"</option> "; 
            				 }else{
            					 newhtml = newhtml + "<option value ='"+key+"' >"+data[key]+"</option> "; 
            				 }
            			 }
            			newhtml = newhtml +"</select>"
            			 tr.find(".type_parent").html(newhtml);
            		 }
            	 })
             });
             
             $(".cancel_type").live("click", function(){
            	 window.location.reload();
             });
             
             $(".sure_edit").live("click", function(){
            	 var thisTd = $(this).parent();
            	 var thisTr = $(this).parent().parent();
            	 var typeName= thisTr.find(".edit_type_name").val();
            	 var parentID = thisTr.find(".select_type").val(); 
            	 
            	 $.ajax({
            		 type: "POST",
            		 data :{name : typeName, parentType:parentID, id: id },
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
		    类型名称：<input type="text" name="name" />
		  类型所属模块:
		   <select name="parentType">
		   		<c:forEach items="${typeEnums}" var="i" >
		   			<option value="${i.key }">${i.value }</option>
		   		</c:forEach>
		  	</select> 
		    <input type="submit"  class="btn btn-info" value="添加" >
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
		                    <td class="type_name">
		                    	${i.name}
		                    </td>
		                    <td>
			                     <span class="type_parent" data="${i.parentType }">
			                    <c:forEach var="t" items="${typeEnums}">
									<c:if test="${t.key == i.parentType}">
										${t.value }
									</c:if>
								</c:forEach>
			                    </span>
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
	<div class="span1 " >  
 		
 	</div>
	</div>
</div>	
</body>
</html>