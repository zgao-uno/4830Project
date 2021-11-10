<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Review" %>
<%@ page import="java.util.List" %>

<%@ page import="ListObjects.ReviewList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review Board</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/reviewboard.css">
</head>
<body>
<%
	User user=(User)session.getAttribute("user");
	if(user == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	ReviewList list = new ReviewList();
	List<Review> review = list.load();
	
%>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo layui-hide-xs layui-bg-black">Library</div>
		<ul class="layui-nav layui-layout-left">
			 <li class="layui-nav-item layui-hide-xs"><a href="main.jsp">Main Page</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="bookSearch.jsp">Book Search</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="DisplayBook.jsp">See All Books</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="">Checkout History</a></li>
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
	

	<div style="height:100px;overflow:auto;" class="container">
		<table class="test">
			
			<%
			Iterator<Review> itr = review.iterator();
			
			while(itr.hasNext())
			{
				%>
				<tr><th>Book Name</th><th>Author</th><th>Rate</th><th>Summary</th></tr>
				<% 
				Review r = itr.next();
				%>
				<tr><td><%=r.getTitle() %></td>
					<td><%=r.getAuthor() %></td>
					<td><%=r.getRate() %></td>
					<td><%=r.getSummary() %></td>
				</tr>
				<%
				
			}
			%>
		</table>
		<form method="get" action="SubmitReview.jsp">
			<div class="layui-form-item">
        		<div class="layui-input-block">
        			<button type="submit" class="layui-btn">Write a Review!</button>         
        		</div>
        	</div>
        </form>
	</div>
	
	
	
</div>

<script src="style/layui/layui.js"></script>
</body>
</html>