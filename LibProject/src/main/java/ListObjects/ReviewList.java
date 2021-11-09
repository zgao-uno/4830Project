package ListObjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Review;
import util.DButil;

public class ReviewList {
	public List<Review> load()
	{
		List<Review> reviews = new ArrayList<Review>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Review review = null;
		
		try {
			con = DButil.getConn();
			String res = "select * from reviews";
			ps = con.prepareStatement(res);
			rs = ps.executeQuery(res);
			while(rs.next()) {
				review = new Review();
				review.setTitle(rs.getString("title"));
				review.setAuthor(rs.getString("author"));
				review.setSummary(rs.getString("summary"));
				review.setRate(rs.getString("rate"));
				reviews.add(review);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps, rs);
		}
		
		
		return reviews;
	}
	
	
}
