package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDao;
import model.Book;


@WebServlet("/BookSearch")
public class BookSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String booksearch = request.getParameter("booksearch");
		BookDao book = new BookDao();
		Book b = book.getBook(booksearch);
		if(b != null)
		{
			
		
		String name = b.getName();
		String auth = b.getAuth();
		int pages = b.getPages();
		String genre = b.getGenre();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>\r\n"
				+ "<html>\r\n"
				+ "<head>\r\n"
				+ "<meta charset=\"ISO-8859-1\">\r\n"
				+ "<title>Book Search</title>\r\n"
				+ "<link rel=\"stylesheet\" href=\"style/layui/css/layui.css\">\r\n"
				+ "<link rel=\"stylesheet\" href=\"style/css/booksearch.css\">\r\n"
				+ "</head>\r\n"
				+ "<body>\r\n"
				+ "<div class=\"layui-layout layui-layout-admin\">\r\n"
				+ "	<div class=\"layui-header\">\r\n"
				+ "		<div class=\"layui-logo layui-hide-xs layui-bg-black\">Library</div>\r\n"
				+ "		<ul class=\"layui-nav layui-layout-left\">\r\n"
				+ "			 <li class=\"layui-nav-item layui-hide-xs\"><a href=\"main.jsp\">Main Page</a></li>\r\n"
				+ "			 <li class=\"layui-nav-item layui-hide-xs\"><a href=\"bookSearch.jsp\">Book Search</a></li>\r\n"
				+ "			 <li class=\"layui-nav-item layui-hide-xs\"><a href=\"DisplayBook.jsp\">See All Books</a></li>\r\n"
				+ "			 <li class=\"layui-nav-item layui-hide-xs\"><a href=\"\">Checkout History</a></li>\r\n"
				+ "			 <li class=\"layui-nav-item layui-hide-xs\"><a href=\"feedback.jsp\">Giving Feedback</a></li>\r\n"
				+ "		</ul>>\r\n"
				+ "		<ul class=\"layui-nav layui-layout-right\">\r\n"
				+ "      		<li class=\"layui-nav-item layui-hide layui-show-md-inline-block\">\r\n"
				+ "        		<a href=\"javascript:;\">\r\n"
				+ "          			<i class=\"layui-icon layui-icon-user\"></i>&nbsp;&nbsp;&nbsp;\r\n"
				+ "        		</a>\r\n"
				+ "        		<dl class=\"layui-nav-child\">\r\n"
				+ "         			<dd><a href=\"updateInfo.jsp\">Your Profile</a></dd>\r\n"
				+ "          			<dd><a href=\"Logout\">Sign out</a></dd>\r\n"
				+ "        		</dl>\r\n"
				+ "      		</li>\r\n"
				+ "    	</ul>\r\n"
				+ "	</div>\r\n"
				+ "	\r\n"
				+ "	<form class=\"layui-form\" action=\"BookSearch\" method=\"post\">\r\n"
				+ "		<div class=\"container\">\r\n"
				+ "			<div class=\"layui-form-item layui-form-text\">\r\n"
				+ "    			<h2 class=\"header\">Enter Book Name:</h2><br>\r\n"
				+ "    			<textarea class=\"layui-textarea\" name=\"booksearch\"></textarea><br>\r\n"
				+ "  			</div>\r\n"
				+ "			<div class=\"layui-form-item\">\r\n"
				+ "        		<div class=\"layui-input-block\">\r\n"
				+ "        			<button type=\"submit\" class=\"layui-btn\">Submit</button>         \r\n"
				+ "        		</div>\r\n"
				+ "        	</div>\r\n"
				+ "		</div>\r\n"
				+ "	</form>\r\n"
				+ "	\r\n"
				+ "	\r\n"
				+ "</div>\r\n"
				+ "<script src=\"style/layui/layui.js\"></script>\r\n"
				+ "</body>\r\n"
				+ "</html>"
				+"<div style=\"height:100px;overflow:auto;\" class=\"container\">\r\n"
				+ "		<table class=\"test\">\r\n"
				+ "			\r\n"
				+ "			<tr><th>Book Name</th><th>Author</th><th>Pages</th><th>Genre</th></tr>\r\n"
				+ "				<tr><td>"+ name+ "</td>\r\n"
				+ "					<td>"+ auth+"</td>\r\n"
				+ "					<td>"+pages+"</td>\r\n"
				+ "					<td>"+genre+"</td>\r\n"
				+ "				</tr>\r\n"
				+ "		</table>\r\n"
				+ "	</div>");
		}
		else
		{
			response.sendRedirect("bookSearch.jsp");
		}
		
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
