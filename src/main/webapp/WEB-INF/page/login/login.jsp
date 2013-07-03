<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            /* $(".captcha").click(function(){
                var date = new Date();
                $(this).attr("src","/captcha.html?ver="+date.getMilliseconds());
            }); */

        });
    </script>
</head>
<body>

	<form style="margin:20px" method="post" action="${website }/backend/login">
		<p style="color:red">${error}</p>
		Login Name:<input type="text" name="name"/>
		<p>Password ： <input type="password" name="pwd"/></p>
		<input type = "submit" value="submit"/>
	</form>
</body>
</html>