<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isELIgnored="false"%>
<html>
<head>
	<link rel='stylesheet' href="${website}resources/css/pagination.css">
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	  	<link rel='stylesheet' href="<c:url value='/webjars/bootstrap/2.3.1/css/bootstrap.css'/>">
  	  	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
  	<script src="<c:url value='/webjars/bootstrap/2.3.1/js/bootstrap.js'/>"></script> 
  	<script  type="text/javascript" src="${website}resources/js/jquery.pagination.js"></script> 
    <title></title>
    
    <script  type="text/javascript">
  	$(function(){
  		
  		
	});	
</script> 

</head>
<body>
    <form class="form-horizontal">
    <fieldset>
      <div id="legend" class="">
        <legend class="">产品</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">名称</label>
          <div class="controls">
            <input type="text" placeholder=""  name="name" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">价格</label>
          <div class="controls">
            <input type="text" placeholder=""  name="price" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">容量</label>
          <div class="controls">
            <input type="text" placeholder="" name="volume" class="input-xlarge">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">

          <!-- Textarea -->
          <label class="control-label">所含成分</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" rows="4" class="" cols="20" name="include"> </textarea>
            </div>
          </div>
        </div><div class="control-group">

          <!-- Textarea -->
          <label class="control-label">功效</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" rows="4" class="" cols="20" name="function"> </textarea>
            </div>
          </div>
        </div><div class="control-group">

          <!-- Select Basic -->
          <label class="control-label">类别</label>
          <div class="controls">
            <select class="input-xlarge" name="typeId">
		      <option value="">美白</option>
		      <option>防晒</option>
		      <option>抗皱</option>
		      <option>保湿</option>
		     </select>
          </div>

        </div><div class="control-group">
          <label class="control-label">图片</label>

          <!-- File Upload -->
          <div class="controls">
            <input class="input-file" id="fileInput" type="file">
          </div>
        </div>

    <div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success">提交</button>
          </div>
        </div>

    </fieldset>
  </form>
</body>
</html>