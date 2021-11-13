<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="ListObjects.AllBooks" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@page import="dao.BookDao" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Search</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/booksearch.css">
</head>
<body>
<%
	User user=(User)session.getAttribute("user");
	if(user == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	AllBooks all = new AllBooks();
	List<Book> book = all.loadAll();
	
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
         			<dd><a href="feedback.jsp">Feedback</a></dd>
          			<dd><a href="Logout">Sign out</a></dd>
        		</dl>
      		</li>
    	</ul>
	</div>
	
	<form class="layui-form" action="BookSearch" method="post">
		<div class="container">
			<div class="layui-form-item layui-form-text">
    			<h2 class="header">Enter Book Name:</h2><br>
    			<input type="search" class="layui-textarea" name="booksearch"></input><br>
  			</div>
			<div class="layui-form-item">
        		<div class="layui-input-block">
        			<button type="submit" class="layui-btn">Submit</button>         
        		</div>
        	</div>
		</div>
		</form>
	<form class="layui-form" action="Checkout" method="post">	
		<div style="height:100px;overflow:auto;" class="container">
		<h2 class="header">All Books:</h2><br>
		<table class="test">
			
			<tr><th>Book Name</th><th>Author</th><th>Pages</th><th>Genre</th><th>Checkout</th></tr>
			<%
			Iterator<Book> itr = book.iterator();
			
			while(itr.hasNext())
			{
				
				Book b = itr.next();
				int i =0;
				 i++;
				%>
			
				<tr><td><%=b.getName() %></td>
					<td><%=b.getAuth() %></td>
					<td><%=b.getPages() %></td>
					<td><%=b.getGenre() %></td>
					<td><%=b.getID() %></td>
					
					<td>
					<form class="layui-form" action="Checkout" method="post">
						<div class="layui-form-item">
	        				<div class="layui-input-block">
	        					<input type="hidden" name="email" value=<%=user.getEmail() %>>
	        					<input type="hidden" name="id3" value=<%=b.getID() %>>
	        					<button type="submit" class="layui-btn1">Submit</button>         
	        				</div>
	        			</div>
	        		</form>
					</td>
					
				</tr>
				<%
			}
			%>
		</table>
	</div>
	

	
	
	
</div>
<script src="style/layui/layui.js"></script>
</body>
</html>