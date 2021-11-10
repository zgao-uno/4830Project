package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DButilNick;

public class CheckDao {
	public void addCheckOut(String email, int id, int cur) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DButilNick.getConn();
			String sql = "insert into checkout values (?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setInt(2, id);
			ps.setInt(3, 1);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButilNick.close(con, ps);
		}
	}
}
