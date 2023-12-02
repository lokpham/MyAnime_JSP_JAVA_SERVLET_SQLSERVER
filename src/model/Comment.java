package model;

public class Comment {
	private String username;
	private String text;
	private String movieId;
	public Comment(String username, String text,String movieId) {
		super();
		this.username = username;
		this.text = text;
		this.movieId = movieId;
	}
	
	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
