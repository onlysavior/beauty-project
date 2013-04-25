<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<html>
<head>
	<link rel='stylesheet' href="${website}resources/css/pagination.css">
  	<script src="<c:url value='/webjars/jquery/1.9.1/jquery.js'/>"></script>
  	<script  type="text/javascript" src="${website}resources/js/jquery.pagination.js"></script> 
    <title></title>
    
    <script  type="text/javascript">
  	$(function(){
  		
  		var count = $("count").val(),  pageSize= $("#size").val();
  		 
  		//这是一个非常简单的demo实例，让列表元素分页显示
  		//回调函数的作用是显示对应分页的列表项内容
  		//回调函数在用户每次点击分页链接的时候执行
  		//参数page_index{int整型}表示当前的索引页
  		var initPagination = function() {
  			var num_entries = count/pageSize;
  			alert("num_entries="+num_entries);
  			// 创建分页
  			$("#Pagination").pagination(num_entries, {
  				num_edge_entries: 2, //边缘页数
  				num_display_entries: 4, //主体页数
  				callback: pageselectCallback,
  				items_per_page:1 //每页显示1项
  			});
  		 }();

  		function pageselectCallback(page_index, jq){
  			var newHtml="";
  			$.ajax({ //这里使用到Jquery的ajax方法，具体使用在这里不详细叙述 
				type: "get", 
				async: false,
				url: '${website}reply/page', //请求的处理数据 
				data: {p:page_index},
				//传入的参数，第一个参数就是分页的页数，第二个参数为排序的依据 
				//下面的操作就是成功返回数据以后，进行数据的绑定 
				success: function(data) { 
					data = eval("("+data+")");
					if(data != null && data != ""){
						for(var i= 0 ;i < data.length; i++){
							if(data[i].flag == 1){
								newHtml = newHtml+"<tr><td>"+pageSize*page_index+i+1-0+"</td>"+
										"<td><span style='color:red'>管理员说：</span>"+data[i].title+"</td>"+
										"<td>"+data[i].updatetime+"</td></tr>"
							}else{
								newHtml = newHtml+"<tr><td>"+pageSize*page_index+i+1-0+"</td><td>"+data[i].title+"</td><td>"+data[i].updatetime+"</td></tr>"
								
							}
					
						}
					}
					$("#reply_container").html(newHtml);
				} 
		  	});
  		}

	});	
  	
  	
	
</script> 

</head>
<body>
   <table>
   	<tbody  id="reply_container">
		
   	</tbody>
   </table>
   
   <div id="Pagination" class="pagination" style="text-align:center"></div> 
   
   <div>
   	<form action="${website}backend/reply" method="POST">
   		<p>标题：<input type="text" name="title" size="15"/></p>
   		<textarea rows="4" cols="50" name="content">
   		</textarea>
   		<input type="submit" value="提交"/>
   	</form>
   </div>
   
   <input type="hidden" value="${count}" id="count"/>
   <input type="hidden" value="${size}" id="size"/>
</body>
</html>