<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Submit Review</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/submitreview.css">
</head>
<body>
<% 
User user=(User)session.getAttribute("user");
	if(user == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	%>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo layui-hide-xs layui-bg-black">Library</div>
		<ul class="layui-nav layui-layout-left">
			 <li class="layui-nav-item layui-hide-xs"><a href="main.jsp">Main Page</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="bookSearch.jsp">Book Search</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="DisplayBook.jsp">See All Books</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="">Checkout History</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="SubmitReview.jsp">Submit A Review</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="reviewboard.jsp">Review Board</a></li>
		</ul>>
		<ul class="layui-nav layui-layout-right">
      		<li class="layui-nav-item layui-hide layui-show-md-inline-block">
        		<a href="javascript:;">
          			<i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;&nbsp;<%=user.getFirstName() %>
        		</a>
        		<dl class="layui-nav-child">
         			<dd><a href="updateInfo.jsp">Your Profile</a></dd>
         			<dd><a href="feedback.jsp">Giving Feedback</a></dd>
          			<dd><a href="Logout">Sign out</a></dd>
        		</dl>
      		</li>
    	</ul>
	</div>
	</div>
<form class="layui-form" action="SubmitReview" method="post">
	<div class="container">
		<div class="layui-form-item">
			<h2 class="header">Submit A Review</h2>
		</div><br>
		<div class="layui-form-item">
			<label class="layui-form-label">Title&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="layui-input-block">
          		<input type="text" name="title" required autocomplete="off" placeholder="EX: Harry Potter" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
        	<label class="layui-form-label">Author</label>
            <div class="layui-input-inline">
            	<input type="text" name="author" required autocomplete="off" placeholder="EX: J.K. Rowlings" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
        	<label class="layui-form-label">Rate(1-5)</label>
            <div class="layui-input-inline">
            	<input type="text" name="rate" required autocomplete="off" placeholder="EX: 4" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
			<label class="layui-form-label">Summary</label>
            <div class="layui-input-block">
            	<textarea rows="5" cols="40" name="summary" required autocomplete="off" placeholder="EX: This is an excellent book! Very well written and fun to read!"></textarea>
            </div>
        </div><br><br>
        <div class="layui-form-item">
        	<div class="layui-input-block">
        		<button type="submit" class="layui-btn">Submit</button>         
        	</div>
        </div>
	</div>
</form>
</body>
</html>