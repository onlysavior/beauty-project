<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<html>
<head>
	<link rel='stylesheet' href="${website}resources/css/pagination.css">
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	  	<link rel='stylesheet' href="<c:url value='/webjars/bootstrap/2.3.1/css/bootstrap.css'/>">
  	<script src="<c:url value='/webjars/bootstrap/2.3.1/js/bootstrap.js'/>"></script> 
  	<script  type="text/javascript" src="${website}resources/js/jquery.pagination.js"></script> 
    <title></title>
    
    <script  type="text/javascript">
  	$(function(){
  		var name;
  		$(".mod").click(function(){
  			var id = $(this).attr("data"),
  				tr = $(this).parent().parent();
  			name = tr.find(".t_name").html();
  			var midHtml = "<input type='text' value='"+name+"' data='"+id+"' class='new_name'/>"+
  							"<input type='button' value='确定' class='t_sure btn btn-info'/>"+
  							"<input type='button' value='cancel' class='t_cancel btn btn-info'/>";
  			tr.find(".t_name").html(midHtml);
  		});
  		
  		$(".t_sure").live("click", function(){
  			var thisObj = $(this),
  				newName = thisObj.parent().find(".new_name").val(),
  				id = thisObj.parent().find(".new_name").attr("data");
  			$.ajax({
  				type : "PUT",
				url : "${website}product/type/"+id+"?name="+newName,
				success:function(flag){
					if(flag){
						thisObj.parent().html(newName);
						alert("修改成功！");
					}else{
						thisObj.parent().html(name);
						alert("修改失败！");
					}
				}
  			})
  		});
  		
  		$(".t_cancel").live("click", function(){
  			$(this).parent().html(name);
  		});
  		
  		
  		$(".del").click(function(){
  			var id = $(this).attr("data");
  			$.ajax({
  				type : "delete",
  				url : "product/type/"+id,
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
  		
  		$("#type_add").click(function(){
  			var name = $(".type_name").val();
  			$.ajax({
  				type : "POST",
  				data : {name: name},
  				url : "product/type",
  				success : function(){
  					alert("添加成功！");
  					window.location.reload();
  				}
  			})
  		})
  		
	});	
</script> 

</head>
<body>
	<div id="legend" class="">
        <legend class="">产品类型</legend>
      </div>
    <table class="table table-hover">
    	<thead>
    		<tr>
    			<td>序号</td>
    			<td>类别名称</td>
    			<td>操作</td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${types}" var="t" varStatus="s">
	    		<tr>
	    			<td>${s.count }</td>
	    			<td class="t_name">${s.name }</td>
	    			<td><a href="javascripts:;" class="mod" data="${s.id }">修改</a>||<a href="javascripts:;" class="del" data="${s.id }">删除</a></td>
	    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    <div>
    	 <div class="control-group">
          	<!-- Text input-->
	          <label class="control-label" for="input01">类型名</label>
	          <div class="controls">
	            <input type="text" placeholder="" class="input-xlarge type_name" >
	            <p class="help-block"></p>
	          </div>
	          <!-- Button -->
	          <div class="controls">
	            <button class="btn btn-success" id="type_add">添加</button>
	          </div>
        </div>
    </div>
    
</body>
</html>