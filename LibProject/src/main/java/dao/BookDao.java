package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ListObjects.AllBooks;
import util.DButilNick;
import model.Book;

public class BookDao {
	public Book getBook(String name)
	{
		AllBooks all = new AllBooks();
		
		List<Book> l = all.loadAll();
	
		
		for(int i = 0; i < l.size(); i++)
		{
			if(l.get(i).getName().compareTo(name) == 0)
			{
				return l.get(i);
			}
		}
		
		return null;
		
		
	}
}
