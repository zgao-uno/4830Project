package model;


/**
 * Create table books
 * (
 * id INT NOT NULL AUTO_INCREMENT,
 * name VARCHAR(30) NOT NULL,
 * author VARCHAR(30) NOT NULL,
 * pages INT NOT NULL,
 * genre VARCHAR(30) NOT NULL,
 * PRIMARY KEY(id));
 * @author nickh
 *
 */
public class Book 
{
	private int id;
	private String name;
	private String author;
	private int pages;
	private String genre;
	
	public int getID()
	{
		return this.id;
	}
	
	public void setID(int id)
	{
		this.id = id;
	}
	
	public String getName()
	{
		return this.name;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getAuth()
	{
		return this.author;
	}
	
	public void setAuth(String auth)
	{
		this.author = auth;
	}
	
	public int getPages()
	{
		return this.pages;
	}
	
	public void setPages(int pages)
	{
		this.pages = pages;
	}
	
	public String getGenre()
	{
		return this.genre;
	}
	
	public void setGenre(String genre)
	{
		this.genre = genre;
	}
	
	public String toString()
	{
		return "Book Title: " + this.name + ", Book Author: " + this.author + ", Number of Pages: " + this.pages + ", Genre: " + this.genre +".\n";
	}
}
