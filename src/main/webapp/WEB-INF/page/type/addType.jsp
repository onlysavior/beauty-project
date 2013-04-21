<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
    <title>Add Type</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
         $(document).ready(function(){
             $(".addDiv").hide();
             $(".editDiv").hide();
             $(".mainSelect").change(function() {
                 $(".addBtn").attr("data",$(this).val());
                 $.ajax({
                     url:"/backend/type/getSub",
                     type:"post",
                     data:{id:$(this).val()},
                     success:function(json) {
                         $(".subSelect").remove(".subOption");
                         for(var i = 0; i< json.length; i++) {
                             var option = "<option class='subOption' value='"+json[i].id+"'>"
                                     + json[i].name+"</option>";
                             $(".subSelect").append(option);
                         }
                     }
                 });
             });

             $(".subSelect").change(function() {
                 $(".deleteBtn").attr("data",$(this).val());
                 $.ajax({
                     url:"/backend/type/getType",
                     type:"post",
                     data:{id:$(this).val()},
                     success:function(type) {
                         $(".editDiv").show();
                         alert(type.id);
                         alert(type.name);
                         $(".typeId").val(type.id);
                         $(".typeParentId").val(type.parentType);
                         $(".typeType").val(type.type);
                         $(".typeName").val(type.name);


                     }
                 });
             });

             $(".addBtn").click(function() {
                 $(".addTypeId").val($(this).attr("data"));
                 $(".addDiv").show();
             });

             $(".deleteBtn").click(function(){
                 $.ajax({
                     url:"/backend/type/delType",
                     type:"post",
                     data:{id:$(this).attr("data")},
                     success:function(ret){
                         $(".editDiv").hide();
                         window.location.reload();
                     }
                 });
             });
         });
    </script>
</head>
<body>
      <div>
          <div>
              <select class="mainSelect" title="mainSelect">
                  <c:forEach items="${mainTypeList}" var="m">
                      <option value="${m.id}">${m.name}</option>
                  </c:forEach>
              </select>
              <input type="button" class="addBtn" value="add type under type" data="">
          </div>

          <div>
              <select class="subSelect" title="subSelect">

              </select>

          </div>

          <div class="addDiv">
              <form class="addform" action="/backend/type/addType" method="post">
                  <input type="hidden" name="parentType" class="addTypeId">
                  <input type="text" name="name" />
                  <input type="submit" value="add" />
              </form>
          </div>

          <div class="editDiv">
              <form class="editform" action="/backend/type/editType" method="post">
                  <input type="hidden" name="type.id" class="typeId">
                  <input type="hidden" name="type.parentType" class="typeParentId">
                  <input type="hidden" name="type.type" class="typeType">
                  <input type="text" name="type.name" class="typeName">
                  <input type="submit" value="save">
              </form>
              <input type="button" value="delete" class="deleteBtn" data="">
          </div>
      </div>
</body>
</html>