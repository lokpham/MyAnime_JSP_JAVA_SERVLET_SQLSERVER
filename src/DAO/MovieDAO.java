package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.TreeMap;

import controller.MyConnection;
import model.Comment;
import model.Movie;

public class MovieDAO {
	private ArrayList<Movie> mymovies = new ArrayList<Movie>();;
	private int MovieQuantity = 0;

	public int getMovieQuantity() {
		return MovieQuantity;
	}

	public void setMovieQuantity(int movieQuantity) {
		MovieQuantity = movieQuantity;
	}

	public ArrayList<Movie> getMymovies() {
		return mymovies;
	}

	public MovieDAO() {

	}

	public void setMymovies(ArrayList<Movie> mymovies) {
		this.mymovies = mymovies;
	}

	public MovieDAO(ArrayList<Movie> mymovies) {
		super();
		this.mymovies = mymovies;
	}

	public void ShowMoviesInfor() {
		for (Movie movie : mymovies) {
			System.out.println(movie.toString());

		}
	}

	public static ArrayList<String> getGenre(Connection conn, String id) {
		String mySql = "select * from Genre,GenreList where movie_id = ? and genre_id = id";
		PreparedStatement pst;
		ArrayList<String> myGenre = new ArrayList<String>();
		try {
			pst = conn.prepareStatement(mySql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				myGenre.add(rs.getString("genre_name"));
			}
			return myGenre;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;

	}

	public static TreeMap<Integer, String> getUrlWatch(Connection conn, String id) {
		String mySql = "select * from UrlWatch where movie_id =? ";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(mySql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			TreeMap<Integer, String> myUrls = new TreeMap<Integer, String>();
			while (rs.next()) {
				myUrls.put(rs.getInt("movie_espisode"), rs.getString("movie_url"));
			}
			pst.close();
			rs.close();
			return myUrls;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static ArrayList<Comment> getComments(Connection conn,String id){
		String mySql = " select text,movieId,username from Comment c, MyUser mu where c.movieId = ? and  c.userId = mu.id";
		try {
			ArrayList<Comment> mycmt = new ArrayList<Comment>();
			PreparedStatement pst = conn.prepareStatement(mySql);
			
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Comment cmt = new Comment(rs.getString("username"), rs.getString("text"), rs.getString("movieId"));
				mycmt.add(cmt);
				
			}
			return mycmt;
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	public static Movie getMovie(Connection conn, String id) throws SQLException {
		String mySql = "select * from Movie where id= ?";
		int count = 0;
		PreparedStatement pst = conn.prepareStatement(mySql);
		pst.setString(1, id);
		Movie myMovie = null;
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			// Lấy giá trị của cột created_at
			if (rs.getString("other_name") == null) {
				System.out.println("khong co ten khac");
			}
			// int sotapphim, String ten, int theloai, int thoiluong,float danhgia,String
			// id,String thump,String year
			myMovie = new Movie(rs.getInt("episodes"), rs.getString("movieName"), rs.getInt("duration_type"),
					rs.getInt("duration"), rs.getFloat("rating"), rs.getString("id"), rs.getString("thump"),
					rs.getString("year_published"), rs.getString("description"), rs.getString("other_name"));
			// In ra dữ liệu
			count++;

		}

		pst.close();
		rs.close();
		return myMovie;

	}

	public int getMovieQuantity(Connection conn) {

		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select COUNT(*) as movie_count from Movie");
			int total = 0;
			while (rs.next()) {

				total = rs.getInt("movie_count");
			}
			stmt.close();
			rs.close();
			return total;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}

	}

	public static ArrayList<Movie> getMoviesFromDB_search(Connection conn, String moviename) {
		ArrayList<Movie> mvs = new ArrayList<Movie>();
		String sql = "select * from Movie where movieName like ?";
		PreparedStatement pst;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + moviename + "%");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("movieName");
				String thump = rs.getString("thump");
				int stp = rs.getInt("episodes");
				int tl = rs.getInt("duration");
				int loai_tl = rs.getInt("duration_type");
				String year = rs.getString("year_published");
				float dg = rs.getFloat("rating");
				// int sotapphim, String ten, int theloai_thoiluong, int thoiluong, float
				// danhgia, String id,
				// String thump, String year
				Movie m = new Movie(stp, name, loai_tl, tl, dg, id, thump, year);
				System.out.println(m.getTen());
				mvs.add(m);
			}
			return mvs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public void getMoviesFromDB(Connection conn, int current) {
		try {

			String query = "select * from Movie order by id offset ? rows fetch next ? rows only;";
			PreparedStatement pstatement = conn.prepareStatement(query);
			// Execute the SELECT query
			pstatement.setInt(1, current);
			pstatement.setInt(2, 8);
			ResultSet rs = pstatement.executeQuery();

			// Iterate over the results
			ArrayList<Movie> newMovies = new ArrayList<Movie>();
			int i = 0;
			while (rs.next()) {
//	        	System.out.println(rs.getString("movieName"));
				String id = rs.getString("id");
				String name = rs.getString("movieName");
				String thump = rs.getString("thump");
				int stp = rs.getInt("episodes");
				int tl = rs.getInt("duration");
				int loai_tl = rs.getInt("duration_type");
				String year = rs.getString("year_published");
				float dg = rs.getFloat("rating");
				// int sotapphim, String ten, int theloai_thoiluong, int thoiluong, float
				// danhgia, String id,
				// String thump, String year
				Movie m = new Movie(stp, name, loai_tl, tl, dg, id, thump, year);
				newMovies.add(m);

			}

			setMymovies(newMovies);
			rs.close();
			pstatement.close();

		} catch (Exception e) {
			// TODO: handle exception
		}

	}
}
