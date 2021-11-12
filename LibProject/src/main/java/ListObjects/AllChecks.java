package ListObjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




import model.Check;
import util.DButilNick;


public class AllChecks 
{
	
	public List<Check> loadAllChecks(String email)
	{
		List<Check> allchecks = new ArrayList<Check> ();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Check check = null;
	
	
		try {
			con = DButilNick.getConn();
			String sql = "select * from checkout where email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			
			rs = ps.executeQuery();
			while(rs.next()){
               check = new Check();
               check.setEmail(rs.getString("email")); 
               check.setBookID(rs.getInt("id"));
              
               check.setCurrently(rs.getInt("currently"));
               allchecks.add(check);
            }
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButilNick.close(con, ps, rs);
		}
		
		
		return allchecks;
			
	}
	
	
	
	
	
	
	
}