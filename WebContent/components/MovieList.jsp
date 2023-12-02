<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="movie-list">

	<%
	ArrayList<Movie> myMovies = new ArrayList();
	myMovies = (ArrayList) request.getAttribute("myMovies");
	
	
	
	if (myMovies != null) {

		for (int i = 0; i < myMovies.size(); i++) {
			String href = "/MyAnime/movie-information?id=" + myMovies.get(i).getId();
	%>
	<a href="<%=href%>" class="movie">
		<div class="movie_thump">

			<img class="" alt="${myMovies.get(i).getTen()}"
				src="<%=myMovies.get(i).getThump() %>">
			<div class="movie_episode"><%=myMovies.get(i).getSotapphim()%>/
				<%
			String thoiluong = myMovies.get(i).getThoiluong() < 0 ? "??" : "" + myMovies.get(i).getThoiluong();

			out.println(thoiluong);
			%>

			</div>
			<div class="movie_rating"><%=myMovies.get(i).getDanhgia()%></div>
		</div>
		<div class="movie_name">
			<%=myMovies.get(i).getTen()%>
		</div>

	</a>



	<%
			}
	}else{
		
		%>
			<div class="notfound">KHÔNG TÌM THẤY</div>
		
		<%
	}
	%>
</div>

<style>
.notfound{
	width:100%;
	background-color:red;
	font-size:clamp(10px,4vw,40px);
	color:white;
	text-align: center;
}

.movie-list {
	display: flex;
	flex-wrap: wrap;
	gap: 1rem;
}

.movie {
	background-color: #000;
	border-radius: 5px;
	cursor: pointer;
	width: calc(100%/ 4 - 1rem);
	box-sizing: border-box;
	padding: 0.5rem;
	text-decoration: none;
	color: white;
	display:flex;
	flex-direction: column;
	
}

.movie:hover {
	opacity: 0.8;
}

.movie_thump {
	flex-grow:1;
	position: relative;
}

.movie_thump>img {
	width: 100%;
	
	height:100%;
}

.movie_name {
	padding: 1rem 2rem;
	text-align: center;
	font-size: 1.5rem;
	text-align: center;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	box-sizing: border-box;
}

.movie_episode {
	position: absolute;
	left: 10px;
	top: 10px;
	background-color: #000;
	font-size: 1.5rem;
	padding: 0.4rem;
	border-radius: 5px;
	border: 2px solid red;
}

.movie_rating {
	position: absolute;
	right: 10px;
	bottom: 10px;
	background-color: #903a3a;
	font-size: 1.5rem;
	padding: 0.4rem;
	border-radius: 5px;
	color: white;
}
@media only screen and (max-width: 768px) {
  /* Định kiểu cho màn hình nhỏ */
  .movie{
  	width: calc(100%/ 2 - 1rem);
  }
}
</style>

