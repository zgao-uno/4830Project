package model;

/**
 * Create table checkout
 * (
 * email VARCHAR(255) NOT NULL,
 * id int NOT NULL,
 * currently INT NOT NULL(if int is 0, not checked out. Otherwise is checked out)
 * );
 * @author nickh
 *
 */
public class Check {
	private String email;
	private int id;
	private int currently;
	
	public String getEmail()
	{
		return this.email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public int getBookID()
	{
		return this.id;
	}
	
	public void setBookID(int id)
	{
		this.id = id; 
	}
	
	public int currently()
	{
		return this.currently;
	}
	
	public void setCurrently(int current)
	{
		this.currently = current;
	}
}
