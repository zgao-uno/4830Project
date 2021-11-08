package ListObjects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Book;
import util.DButilNick;


public class AllBooks 
{
	
	public List<Book> loadAll()
	{
		List<Book> allbooks = new ArrayList<Book> ();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
	
	
		try {
			con = DButilNick.getConn();
			String sql = "select * from books";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
               book = new Book();
               book.setID(rs.getInt("id"));
               book.setAuth(rs.getString("author"));
               book.setName(rs.getString("name"));
               book.setGenre(rs.getString("genre"));
               book.setPages(rs.getInt("pages"));
               allbooks.add(book);
            }
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButilNick.close(con, ps, rs);
		}
		
		
		return allbooks;
			
	}
	
	
	
	
	
	
	
}



