<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel='stylesheet' href="${website}resources/css/pagination.css"/>
	<link rel='stylesheet' href="${website}resources/css/bootstrap.css"/>
	<link rel='stylesheet' href="${website}resources/css/ie6.css"/>
	<link rel='stylesheet' href="${website}resources/css/adminLeftMenu.css"/>
	
  	<script  type="text/javascript" src="${website}resources/js/jquery.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/jquery.pagination.js"></script> 
  	<script  type="text/javascript" src="${website}resources/js/bootstrap.js"></script> 
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
</head>
<body>

	<div class="container">

      <form class="form-signin" method="post" action="${website }/backend/login">
        <h2 class="form-signin-heading">请登录</h2>
        <input type="text" name="name" class="input-block-level" placeholder="用户名">
        <input type="password" name="pwd" class="input-block-level" placeholder="密码">
        <button class="btn btn-large btn-primary" type="submit">登陆</button>
      </form>

    </div> <!-- /container -->



	
</body>
</html>