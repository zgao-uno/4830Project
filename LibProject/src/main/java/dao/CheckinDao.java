package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DButilNick;

public class CheckinDao {
	public void checkin(String email, int id)
	{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DButilNick.getConn();
		
			String sql = "update checkout set currently = 0 where id = ? ";
			
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			
			ps.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButilNick.close(con, ps);
		}
	}
	
	
}
/*
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
*/