package controller;

import java.io.FileOutputStream;
import java.io.IOException;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;

import DAO.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet(urlPatterns = { "/register" })
public class Register extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			req.getRequestDispatcher("pages/Register.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post");
		try {

			Part username = req.getPart("username");

			String usernameValue = new String(username.getInputStream().readAllBytes());

			Part password = req.getPart("password");

			String passwordValue = new String(password.getInputStream().readAllBytes());

			Part repassword = req.getPart("repassword");

			String repasswordValue = new String(repassword.getInputStream().readAllBytes());
			
			
			Pattern patternUs = Pattern.compile("^[a-zA-Z0-9_]{6,32}$");
			Matcher matcherUs = patternUs.matcher(usernameValue);
			if (!matcherUs.matches()) {
				// Tên đăng nhập không hợp lệ	
				resp.sendRedirect("/MyAnime/register?valid=false&code=usunvalid");
				return;
			}
			
			if(passwordValue.equals(repasswordValue)) {
				Pattern patternPs = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+=])[a-zA-Z0-9@#$%^&+=]{8,64}$");
				Matcher matcherPs = patternPs.matcher(passwordValue);
				if (!matcherPs.matches()) {
					// Tên đăng nhập không hợp lệ	
					resp.sendRedirect("/MyAnime/register?valid=false&code=psunvalid");
					return;
				}
			}else {
				resp.sendRedirect("/MyAnime/register?valid=false&code=rpsunvalid");
				return;
			}
			
			MyConnection mc = new MyConnection();
			Connection conn = mc.getConnection();
			
			
			String sql1 = "select * from MyUser where username = ?;";
			PreparedStatement pst = conn.prepareStatement(sql1);
			pst.setString(1,usernameValue);
			ResultSet rs =  pst.executeQuery();
			if(rs.next()) {
				resp.sendRedirect("/MyAnime/register?valid=false&code=usexisted");
				return;
			}else {
				UserDAO ud = new UserDAO();
				ud.createUser(usernameValue, passwordValue);
				resp.sendRedirect("/MyAnime/login");
			}
			
			conn.close();
			pst.close();
			rs.close();
//			System.out.println(usernameValue + " " + passwordValue + " " + repasswordValue);
		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
		}
	}
}
