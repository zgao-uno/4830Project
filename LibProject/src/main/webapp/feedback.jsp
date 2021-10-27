<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giving Feedback</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/feedback.css">
</head>
<body>
<%
	User user=(User)session.getAttribute("user");
	if(user == null)
	{
		response.sendRedirect("Login.jsp");
		return;
	}
%>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo layui-hide-xs layui-bg-black">Library</div>
		<ul class="layui-nav layui-layout-left">
			 <li class="layui-nav-item layui-hide-xs"><a href="main.jsp">Main Page</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="">Book Search</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="">Checkout History</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="feedback.jsp">Giving Feedback</a></li>
		</ul>>
		<ul class="layui-nav layui-layout-right">
      		<li class="layui-nav-item layui-hide layui-show-md-inline-block">
        		<a href="javascript:;">
          			<i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;&nbsp;<%=user.getFirstName() %>
        		</a>
        		<dl class="layui-nav-child">
         			<dd><a href="updateInfo.jsp">Your Profile</a></dd>
          			<dd><a href="Logout">Sign out</a></dd>
        		</dl>
      		</li>
    	</ul>
	</div>
	
	<form class="layui-form" action="Feedback" method="post">
		<div class="container">
			<div class="layui-form-item layui-form-text">
    			<h2 class="header">Please Enter Your Feedback</h2><br>
    			<textarea class="layui-textarea" name="feedback"></textarea><br>
  			</div>
			<div class="layui-form-item">
        		<div class="layui-input-block">
        			<button type="submit" class="layui-btn">Submit</button>         
        		</div>
        	</div>
		</div>
	</form>
</div>
<script src="style/layui/layui.js"></script>
</body>
</html>