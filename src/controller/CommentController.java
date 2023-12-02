package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(urlPatterns = { "/comment" })
public class CommentController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String text = req.getParameter("text");
		String movieId = req.getParameter("movieid");
	
		System.out.println(movieId);
		MyConnection mc = new MyConnection();
		Connection conn = mc.getConnection();

		HttpSession session = req.getSession();
		User u = (User) session.getAttribute("user");
		System.out.println("nguoi dung");
		if (u == null) {
			
			 resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
		} else {
			try {
				String sql1 = "  insert into Comment(text,userId,date,movieId) values (?,?,?,?);";
				PreparedStatement pst = conn.prepareStatement(sql1);
				pst.setString(1, text);
				pst.setInt(2, u.getId());
				long currentTime = System.currentTimeMillis();
				Timestamp createdAt = new Timestamp(currentTime);
				pst.setTimestamp(3, createdAt);
				
				pst.setString(4, movieId);
				
				pst.executeUpdate();
				
				
				
				
				
				resp.setContentType("text/html");
		        PrintWriter out = resp.getWriter();
		        out.println("<div class=\"comment\"><p class=\"comment--name\">"+u.getUsername()+"</p><p class=\"comment--text\">"+text+"</p></div>");
		        
				
			
			} catch (Exception e) {
				System.out.println(e);
				// TODO: handle exception
			}
		
		

		}

	}
}
