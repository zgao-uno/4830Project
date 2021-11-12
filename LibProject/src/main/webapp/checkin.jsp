<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="ListObjects.AllBooks" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@page import="dao.BookDao" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Check" %>
<%@ page import="ListObjects.AllChecks" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check In</title>
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
	
	AllBooks book = new AllBooks();
	AllChecks checks = new AllChecks();
	List<Check> check = checks.loadAllChecks(user.getEmail());
	List<Book> books = book.loadAll();
	
%>
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo layui-hide-xs layui-bg-black">Library</div>
		<ul class="layui-nav layui-layout-left">
			 <li class="layui-nav-item layui-hide-xs"><a href="main.jsp">Main Page</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="bookSearch.jsp">Book Search</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="Checkout.jsp">Checkout History</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="reviewboard.jsp">Review Board</a></li>
			 <li class="layui-nav-item layui-hide-xs"><a href="checkin.jsp">Check-in</a></li>
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
	
	<form class="layui-form" action="Checkin" method="post">	
	<div style="height:100px;overflow:auto;" class="container">
	<h2 class="header">Check In:</h2><br>
	<%
	Iterator<Check> itr = check.iterator();
	while(itr.hasNext())
	{
		Check c = itr.next();
		
		if(c.currently() != 0)
		{
			for (int i = 0; i < books.size();i++)
			{
				if(books.get(i).getID() == c.getBookID())
				{
					%>
					
					<div class="layui-form-item">
	        				<div class="layui-input-block">
	        					
	        					<input type="hidden" name="email" value=<%=user.getEmail() %>>
	        					<input type="hidden" name="id" value=<%=c.getBookID() %>>
	        					<label for="book"><%=books.get(i).getName()%></label>
	        					<button type="submit" class="layui-btn1">Check-in</button>           
	        				</div>
	        			</div>
	        			
					<% 
				}
			}
		}
	}
	%>
	
		
			
	
	</div>
</form>
</div>
<script src="style/layui/layui.js"></script>
</body>
</html>



