<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/login.css">
<script>
	var errori ='<%=request.getParameter("error")%>';
	if(errori=='yes'){
		alert("Login Failed, Please check your email or password!");
	}
</script>
</head>
<body>
<form class="layui-form" action="Login" method="post">
	<div class="container">
		<div class="layui-form-item">
			<h2 class="header">User Login</h2>
		</div><br>
		<div class="layui-form-item">
			<label class="layui-form-label">Email&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="layui-input-block">
          		<input type="text" name="email" required placeholder="Please enter email" autocomplete="off" class="layui-input">
            </div>
        </div><br>
        <div class="layui-form-item">
        	<label class="layui-form-label">Password</label>
            <div class="layui-input-inline">
            	<input type="password" name="password" required placeholder="Please enter password" autocomplete="off" class="layui-input">
            </div>
        </div><br><br>
        <div class="layui-form-item">
        	<div class="layui-input-block">
        		<button type="submit" class="layui-btn">Login</button>         
        	</div>
        </div>
        <a href="register.jsp" class="font-set">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No account? Register</a>
	</div>
</form>
</body>
</html>