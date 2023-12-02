package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Movie;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import DAO.MovieDAO;

@WebServlet(urlPatterns = { "/home" })
public class Home extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		MyConnection mc = new MyConnection();
		Connection conn = mc.getConnection();
		MovieDAO md = new MovieDAO();
		md.getMoviesFromDB(conn, 0);
		
		RequestDispatcher rd = req.getRequestDispatcher("pages/Home.jsp");
		req.setAttribute("myMovies", md.getMymovies());
		req.setAttribute("movie_quantity", md.getMovieQuantity(conn));
		rd.forward(req, resp);
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
