package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;
@MultipartConfig
@WebServlet(urlPatterns = {"/login"})
public class Login extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
		
	  
		req.getRequestDispatcher("pages/Login.jsp").forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		try {
			Part username = req.getPart("username");

			String usernameValue = new String(username.getInputStream().readAllBytes());
			
			Part password = req.getPart("password");

			String passwordValue = new String(password.getInputStream().readAllBytes());
			
			MyConnection mc = new MyConnection();
			Connection conn = mc.getConnection();
			//find username
			String sqlus = "select * from MyUser where username = ?;";
			String sqlps = "select * from MyUser where username = ? and password = ?;";
			PreparedStatement pst1 = conn.prepareStatement(sqlus);
			PreparedStatement pst2 = conn.prepareStatement(sqlps);
			pst1.setString(1, usernameValue);
			ResultSet rs = pst1.executeQuery();
			if(rs.next()) {
				//check passowrd;
				pst2.setString(1, usernameValue);
				pst2.setString(2, passwordValue);
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()) {
					//login success
					User u = new User();
					u.setId(rs2.getInt("id"));
					u.setUsername(rs2.getString("username"));
				
					HttpSession session = req.getSession();

					session.setAttribute("user", u);
					resp.sendRedirect("/MyAnime/home");
					
					
				}else {
					//wrong password
					resp.sendRedirect("/MyAnime/login?valid=false&code=pswrong");
					return;
				}
				
				
			}else {
				//username not found
				
				resp.sendRedirect("/MyAnime/login?valid=false&code=usnotfound");
				return;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
