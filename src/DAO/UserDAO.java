package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import controller.MyConnection;
import model.User;

public class UserDAO {
	private User currentuser;
	public void getUser(String us, String ps) {
		
		
	}
	public void createUser(String us, String ps) {
		try {
			MyConnection mc = new MyConnection();
			Connection conn = mc.getConnection();
			String sql = "insert into MyUser (username,password,date) values (?,?,?);";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,us);
			pst.setString(2, ps);
			long currentTime = System.currentTimeMillis();
	        Timestamp createdAt = new Timestamp(currentTime);
			pst.setTimestamp(3, createdAt);
			pst.executeUpdate();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
}
