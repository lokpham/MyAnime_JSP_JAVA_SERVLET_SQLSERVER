package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import DAO.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/changepage" })
public class AnimePagination extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("vo day");
		// TODO Auto-generated method stub
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=MyAnime;";
			String user = "sa";
			String pass = "1";
			conn = DriverManager.getConnection(dbURL, user, pass);
			if (conn != null) {
				DatabaseMetaData dm = (DatabaseMetaData) conn.getMetaData();

				String data = req.getParameter("page");
				System.out.println(data);
				int newcurrent = (Integer.parseInt(data)-1) * 8;
				MovieDAO md = new MovieDAO();
				md.getMoviesFromDB(conn,newcurrent);
				RequestDispatcher rd = req.getRequestDispatcher("pages/PageHome.jsp");
				req.setAttribute("myMovies", md.getMymovies());	
				req.setAttribute("movie_quantity", md.getMovieQuantity(conn));
				rd.forward(req, resp);
				
			}

		} catch (SQLException ex) {

			ex.printStackTrace();
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();

			}

		}

	}
}
