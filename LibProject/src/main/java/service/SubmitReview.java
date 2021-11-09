package service;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;


/**
 * Servlet implementation class SubmitReview
 */
@WebServlet("/SubmitReview")
public class SubmitReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Review review = new Review();
		review.setTitle(request.getParameter("title"));
		review.setAuthor(request.getParameter("author"));
		review.setRate(request.getParameter("rate"));
		review.setSummary(request.getParameter("summary"));		
		
		
		ReviewDao reviews = new ReviewDao();
		reviews.submit(review);
		request.getRequestDispatcher("reviewboard.jsp").forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
