package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import model.Review;

import util.DButil;

public class ReviewDao {
	
	
	public void submit(Review review) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DButil.getConn();
			String sql = "insert into reviews (title, author, summary, rate) values (?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,review.getTitle());
			ps.setString(2, review.getAuthor());
			ps.setString(3, review.getSummary());
			ps.setString(4, review.getRate());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps);
		}
		
	}
	
	
	
}

