package dao;

import model.User;
import util.DButil;
import java.sql.*;

public class UserDao {
	public User login(String email, String password) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
        User user = null;
        try {
			con = DButil.getConn();
			String sql = "select * from user where email=? and password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()){
                user = new User();
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setPassword(rs.getString("password"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps, rs);
		}
        return user;
	}
	
	public void register(User user) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DButil.getConn();
			String sql = "insert into user (firstname, lastname, password, phone, email, address) values (?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,user.getFirstName());
			ps.setString(2,user.getLastName());
			ps.setString(3,user.getPassword());
			ps.setString(4,user.getPhone());
			ps.setString(5,user.getEmail());
			ps.setString(6,user.getAddress());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps);
		}
		
	}
	
	
	public void updateInfo(User user) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DButil.getConn();
			String sql = "update user set firstname=?, lastname=?, password=?, phone=?, address=? where email=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,user.getFirstName());
			ps.setString(2,user.getLastName());
			ps.setString(3,user.getPassword());
			ps.setString(4,user.getPhone());
			ps.setString(5,user.getAddress());
			ps.setString(6,user.getEmail());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DButil.close(con, ps);
		}
	}
}
