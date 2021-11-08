<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>

<%@ page import="ListObjects.AllBooks" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Search Results</title>
<link rel="stylesheet" href="style/layui/css/layui.css">
<link rel="stylesheet" href="style/css/displaybooks.css">
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
			 <li class="layui-nav-item layui-hide-xs"><a href="DisplayBook.jsp">See All Books</a></li>
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
	

	<div style="height:100px;overflow:auto;" class="container">
		<table class="test">
			
			<tr><th>Book Name</th><th>Author</th><th>Pages</th><th>Genre</th></tr>
			<%
			Iterator<Book> itr = book.iterator();
			
			while(itr.hasNext())
			{
				
				Book b = itr.next();
				%>
				<tr><td><%=b.getName() %></td>
					<td><%=b.getAuth() %></td>
					<td><%=b.getPages() %></td>
					<td><%=b.getGenre() %></td>
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