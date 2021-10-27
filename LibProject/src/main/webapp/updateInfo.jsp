<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Your Information</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/register.css">
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
		<div class="layui-logo layui-hide-xs layui-bg-black"><a href="main.jsp">Library</a></div>
		<ul class="layui-nav layui-layout-left">
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
	<form class="layui-form" action="UpdateUserInfo" method="post">
		<div class="container"><br><br>
			<div class="layui-form-item">
				<h2 class="header">Update Your Information</h2>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">Email:&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<label class="layui-form-label"><%=user.getEmail() %></label>
        	</div>
        	<div class="layui-form-item">
        		<label class="layui-form-label">Password:&nbsp;&nbsp;&nbsp;&nbsp;</label>
            	<label class="layui-form-label"><%=user.getPassword() %></label>
        	</div>
        	<div class="layui-form-item">
				<label class="layui-form-label">First Name</label>
            	<div class="layui-input-block">
          			<input type="text" name="firstName" required value="<%=user.getFirstName() %>" autocomplete="off" class="layui-input">
            	</div>
        	</div>
        	<div class="layui-form-item">
				<label class="layui-form-label">Last Name</label>
        	    <div class="layui-input-block">
        	  		<input type="text" name="lastName" required value="<%=user.getLastName() %>" autocomplete="off" class="layui-input">
        	    </div>
       		</div>
       	 	<div class="layui-form-item">
				<label class="layui-form-label">Phone&nbsp;&nbsp;&nbsp;&nbsp;</label>
            	<div class="layui-input-block">
          			<input type="text" name="phone" required value="<%=user.getPhone() %>" autocomplete="off" class="layui-input">
            	</div>
        	</div>
        	<div class="layui-form-item">
				<label class="layui-form-label">Address&nbsp;&nbsp;&nbsp;</label>
            	<div class="layui-input-block">
          			<input type="text" name="address" required value="<%=user.getAddress() %>" autocomplete="off" class="layui-input">
            	</div>
        	</div><br><br>
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