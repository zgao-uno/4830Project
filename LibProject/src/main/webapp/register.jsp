<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/register.css">
</head>
<body>
<form class="layui-form" action="Register" method="post">
	<div class="container">
		<div class="layui-form-item">
			<h2 class="header">User Register</h2>
		</div><br>
		<div class="layui-form-item">
			<label class="layui-form-label">Email&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="layui-input-block">
          		<input type="text" name="email" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
        	<label class="layui-form-label">Password</label>
            <div class="layui-input-inline">
            	<input type="password" name="password" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
			<label class="layui-form-label">First Name</label>
            <div class="layui-input-block">
          		<input type="text" name="firstName" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
			<label class="layui-form-label">Last Name</label>
            <div class="layui-input-block">
          		<input type="text" name="lastName" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
			<label class="layui-form-label">Phone&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="layui-input-block">
          		<input type="text" name="phone" required autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
			<label class="layui-form-label">Address&nbsp;&nbsp;&nbsp;</label>
            <div class="layui-input-block">
          		<input type="text" name="address" required autocomplete="off" class="layui-input">
            </div>
        </div><br><br>
        <div class="layui-form-item">
        	<div class="layui-input-block">
        		<button type="submit" class="layui-btn">Register</button>         
        	</div>
        </div>
	</div>
</form>
</body>
</html>