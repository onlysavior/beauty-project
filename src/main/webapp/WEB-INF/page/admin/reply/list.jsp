<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/pagination.css"/>
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/jquery.pagination.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script> 
	<%-- <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/2.3.1/css/bootstrap.css'/>"/> --%>
  	<%-- <script  type="text/javascript"  src="<c:url value='/webjars/jquery/1.9.1/jquery.js'/>"></script>
  	<script  type="text/javascript"  src="<c:url value='/webjars/bootstrap/2.3.1/js/bootstrap.js'/>"></script> --%>
    <title>回复管理</title>
    <script  type="text/javascript">
  	$(function(){
  		
  		var count = $("#count").val(),  pageSize= $("#size").val();
  		 
  		//这是一个非常简单的demo实例，让列表元素分页显示
  		//回调函数的作用是显示对应分页的列表项内容
  		//回调函数在用户每次点击分页链接的时候执行
  		//参数page_index{int整型}表示当前的索引页
  		var initPagination = function() {
  			var num_entries = count-0/pageSize;
  			// 创建分页
  			$("#Pagination").pagination(num_entries, {
  				num_edge_entries: 2, //边缘页数
  				num_display_entries: 4, //主体页数
  				items_per_page:20, //每页显示1项
  				callback: pageselectCallback
  			});
  		 }();

  		function pageselectCallback(page_index, jq){
  			var newHtml=" ";
  			$.ajax({ //这里使用到Jquery的ajax方法，具体使用在这里不详细叙述 
				type: "get", 
				async: false,
				url: '${website}backend/reply/page', //请求的处理数据 
				data: {p:page_index},
				//传入的参数，第一个参数就是分页的页数，第二个参数为排序的依据 
				//下面的操作就是成功返回数据以后，进行数据的绑定 
				success: function(data) { 
					data = eval("("+data+")");
					if(data.size>0&& data.content!= null && data.content.length > 0){
						for(var i= 0 ;i < data.size; i++){
							if(data.content[i].flag == 1){
								newHtml = newHtml+"<tr><td>"+(pageSize*page_index+i+1)+"</td>"+
										"<td><span style='color:red'>管理员说：</span><span class='title'>"+data.content[i].title+"</span></td>"+
										"<td>"+data.content[i].updatetime+"</td><td><a href='javascript:;' class='delete' data='"+data.content[i].id+"'>删除</a>"+
										" || <a href='javascript:;' class='modify' data='"+data.content[i].id+"'>修改</a></td></tr>"
							}else{
								newHtml = newHtml+"<tr><td>"+(pageSize*page_index+i+1)+"</td><td class='title'>"+data.content[i].title+"</td>"+
								"<td>"+data.content[i].updatetime+"</td><td><a href='javascript:;' class='delete' data='"+data.content[i].id+"'>删除</a>"+
								" || <a href='javascript:;' class='modify' data='"+data.content[i].id+"'>修改</a></td></tr>"
								
							}
						}
					}
					$("#reply_container").html(newHtml);
				} 
		  	});
  		}
  		
  		
  		$("table").delegate(".delete", "click", function(){
  			var id = $(this).attr("data");
  			$.ajax({
  				type :"delete",
  				url:"${website}backend/reply/admin/"+id,
  				success:function(flag){
  					if(flag){
  						alert("删除成功！");
  						window.location.reload();
  					}else{
  						alert("删除失败！");
  					}
  				}
  			})
  		});
  		
  		
  		$("table").delegate(".modify", "click", function(){
  			var id = $(this).attr("data"),
  				title = $(this).parent().parent().find(".title").html();
  			$("textarea[name='title']").val(title);
  			$("input[name='id']").val(id);
  			
  		})
  		
  		$("#submit").click(function(){
  			var content = $("#content").val(), id = $("#id").val();
  			if(content == null || content == ""){
  				alert("请输入评论内容");
  				return false;
  			}
  			$.ajax({
  				type:"POST",
  				data:{title:content,id:id},
  				url:"${website}backend/reply/admin",
  				success:function(){
  					$("#content").val("");
  					
  					window.location.reload();
  				}
  				
  			})
  			
  		});

	});	
  	
  	
	
</script> 

</head>
<body>
<jsp:include page="../../admin/common/adminHeader.jsp" flush="true" /> 

<div class="container-fluid ">

 <div class="row-fluid ">
 	<div class="span3 bs-docs-sidebar" >  
 	</div>
 	<div class="span9">
 		<table class="table table-hover"> 
		   	<thead>
		   		<tr>
		   			<th>序号</th>
		   			<th>回复内容</th>
		   			<th>发表时间</th>
		   			<th>操作</th>
		   		</tr>
		   	</thead>
		   	<tbody  id="reply_container">
				
		   	</tbody>
		 </table>
		   
		<div id="Pagination" class="pagination" style="text-align:center"></div> 
		   
	   <div>
	   	<form> 
	   	回复：
	   		<textarea rows="4" cols="50"  name="title" id="content" style="width: 726px; height: 76px;">
	   		</textarea>
	   		<input type="hidden"  id ="id" name="id"/>
	   		<div style="text-align:center"><input type="button" class="btn btn-success" id="submit" value="添加或修改"/></div>
	   	</form>
	   </div>
	   
	   <input type="hidden" value="${count}" id="count"/>
	   <input type="hidden" value="${size}" id="size"/>
	</div>
 </div>
</div>
   
</body>
</html>