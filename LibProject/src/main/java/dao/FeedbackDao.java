package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DButil;

public class FeedbackDao {
	public void add(String feedback) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DButil.getConn();
			String sql = "insert into feedback (feedback) values (?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,feedback);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps);
		}
	}
}
