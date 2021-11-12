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
	AllChecks a1 = new AllChecks();
	List<Book> book = all.loadAll();
	List<Check> check = a1.loadAllChecks(user.getEmail());
	
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
	
	
		<div style="height:100px;overflow:auto;" class="container">
		<h2 class="header">Checked Out Books:</h2><br>
		<table class="test">
			
			<tr><th>Book Name</th><th>Author</th><th>Pages</th><th>Genre</th><th>Currently Checked Out</th></tr>
			<%
			Iterator<Check> itr = check.iterator();
			
			while(itr.hasNext())
			{
				
				Check c = itr.next();
				for(int i=0; i < book.size();i++)
				{
					if(book.get(i).getID() == c.getBookID())
					{
						%>
						<tr><td><%=book.get(i).getName() %></td>
							<td><%=book.get(i).getAuth() %></td>
							<td><%=book.get(i).getPages() %></td>
							<td><%=book.get(i).getGenre() %></td>
							
							<% 
								int chek = c.currently();
								if (chek == 0)
								{
									%>
									<td><%="No" %></td>
									<% 
								}
								else
								{
									%>
									<td><%="Yes" %></td>
									<% 
								}
							%> 
						
						</tr>
						<%
					}
				}
			}
			%>
		</table>
	</div>
	

	
	
	
</div>
<script src="style/layui/layui.js"></script>
</body>
</html>