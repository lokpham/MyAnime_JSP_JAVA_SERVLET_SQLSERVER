package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;

import DAO.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Comment;
import model.Movie;


@WebServlet(urlPatterns = {"/movie-information"})
public class MovieInformation extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
	
		MyConnection mc = new MyConnection();
		Connection conn = mc.getConnection();
		MovieDAO mdao = new MovieDAO();
		try {
			Movie myMovie = mdao.getMovie(conn, id);
			System.out.println(myMovie.getTen());
			System.out.println(myMovie.getId());
			
			TreeMap<Integer, String> myUrls = mdao.getUrlWatch(conn, id);
			ArrayList<String> myGenre = mdao.getGenre(conn, id);
			ArrayList<Comment> myCmt = mdao.getComments(conn, id);
			
			
			req.setAttribute("genre", myGenre);
			req.setAttribute("urlWatchs", myUrls);
			req.setAttribute("movie", myMovie);
			req.setAttribute("comments", myCmt);
			RequestDispatcher r = req.getRequestDispatcher("pages/MovieInformation.jsp");
			r.forward(req, resp);
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
