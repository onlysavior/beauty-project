<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
           $("#btn").click(function(){
               var pwd = $("#btn").val();
               var repwd = $("#repwd").val();

               if(pwd == repwd){
                   return true;
               }
               alert("password not equal");
               return false;
           });
            $("#check").blur(function(){
                $.ajax({
                    url:"/backend/check",
                    type:"post",
                    data:{name:$(this).val()},
                    success:function(d){
                        if(d == 0){
                            alert("user already have");
                        }
                    }
                });
            });

        });
    </script>
</head>
<body>
   <form action="/register" method="post">
       <p>username:<input type="text" name="username" id="check"></p>
       <p>password:<input type="password" name="password" id="pwd"></p>
       <p>repeat:<input type="password" name="repeat" id="repwd"></p>
       <p>
           <input type="submit" value="submit" id="btn">
           <input type="reset" value="reset">
       </p>
   </form>
</body>
</html>