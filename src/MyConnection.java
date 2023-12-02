import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import DAO.MovieDAO;
import jakarta.servlet.RequestDispatcher;

public class MyConnection {
	private String dburl ="jdbc:sqlserver://localhost:1433;databaseName=MyAnime;";
	private String username = "sa";
	private String password = "sa";
	
	public  Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			String dbURL = dburl;
			String user = username;
			String pass = password;
			conn = DriverManager.getConnection(dbURL, user, pass);
			if (conn != null) {
				DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();
				System.out.println("Tên Driver: " + dm.getDriverName());
				System.out.println("Phiên bản Driver: " + dm.getDriverVersion());
				System.out.println("Tên Cơ sở dữ liệu: " + dm.getDatabaseProductName());
				System.out.println("Phiên bản Cơ sở dữ liệu: " + dm.getDatabaseProductVersion());
				
				
			}

		} catch (SQLException ex) {
			
			ex.printStackTrace();
		} 
		
		
		return conn;
	}
}
