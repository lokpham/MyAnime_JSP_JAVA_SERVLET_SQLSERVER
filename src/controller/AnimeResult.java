package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAO.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Movie;

@WebServlet(urlPatterns = { "/search" })
public class AnimeResult extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("posting");

		try {
			String value = req.getParameter("value");
			if (value.length() < 3) {
				req.setAttribute("myMovies", null);
				req.setAttribute("movie_quantity", 0);
			} else {
				MyConnection mc = new MyConnection();
				MovieDAO md = new MovieDAO();
				ArrayList<Movie> mvs = md.getMoviesFromDB_search(mc.getConnection(), value);
				System.out.println(mvs.size());
				if (mvs.size() == 0) {
					req.setAttribute("myMovies", null);
					req.setAttribute("movie_quantity", 0);
				} else {

					req.setAttribute("myMovies", mvs);
					req.setAttribute("movie_quantity", mvs.size());
				}

			}
			RequestDispatcher d = req.getRequestDispatcher("pages/AnimeResult.jsp");
			d.forward(req, resp);

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String value = req.getParameter("anime_name");
			
			
			resp.sendRedirect("/MyAnime/search?value="+value+"");
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
