<%@page import="model.Comment"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="model.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/mystyle.css">
<link rel="stylesheet" href="styles/bodystyle.css">
<link rel="stylesheet" href="styles/root.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />




<div class="bodycontent">
	<%
	Movie myMovie = (Movie) request.getAttribute("movie");
	TreeMap<Integer, String> myUrls = (TreeMap) request.getAttribute("urlWatchs");
	ArrayList<String> myGenre = (ArrayList) request.getAttribute("genre");
	ArrayList<Comment> myCmt = (ArrayList) request.getAttribute("comments");
	%>
	<div class="movie-infor">
		<div class="movie-name"><%=myMovie.getTen()%></div>
		<div class="movie-infor_block1">
			<div class="movie-infor_thump">
				<img alt="thump" src="<%=myMovie.getThump()%>">
			</div>
			<div class="movie-infor_details">

				<%
				if (myMovie.getOthername() == null) {

				} else {
				%>
				<div class="movie-catetory">
					<div>Tên khác</div>
					<div><%=myMovie.getOthername()%></div>
				</div>
				<%
				}
				%>


				<div class="movie-catetory">
					<div>Thể loại</div>
					<div>

						<%
						for (int i = 0; i < myGenre.size(); i++) {
						%>
						<span><%=myGenre.get(i)%></span>
						<%
						}
						%>


					</div>
				</div>
				<div class="movie-catetory">
					<div>Điểm</div>
					<div><%=myMovie.getDanhgia()%></div>
				</div>
				<div class="movie-catetory">
					<div>Phát hành</div>
					<div><%=myMovie.getYear()%></div>
				</div>
				<div class="movie-catetory">
					<div>Thời lượng</div>
					<%
					if (myMovie.getTheloai_thoiluong() == 0) {
					%>
					<div><%=myMovie.getThoiluong()%>
						phút
					</div>
					<%
					} else {
					%>
					<div>

						<%=myMovie.getSotapphim()%>
						Tập

					</div>



					<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="movie-infor_block2">
			<h4>
				<i class="fa-regular fa-sun"></i> Nội dung
			</h4>
			<p><%=myMovie.getDescription()%></p>
			<h4>
				<i class="fa-regular fa-sun"></i> Tập phim
			</h4>

			<div class="movie-episodes">
				<%
				for (Map.Entry<Integer, String> entry : myUrls.entrySet()) {
				%>
				<a href="<%=entry.getValue()%>" target="_blank"><%=entry.getKey()%></a>
				<%
				}
				%>


			</div>
			<h4>
				<i class="fa-regular fa-sun"></i> Bình luận
			</h4>
			<div class="comment_input">
				<input type="text" placeholder="Nhập bình luận của bạn" /> <span>Gửi</span>
			</div>
			<div class="comment_display">
				<%
				if (myCmt.size() < 1) {
				%>
				<div class="comment--empty">Chưa có bình luận</div>
				<%
				}
				for (Comment cmt : myCmt) {
				%>
				<div class="comment">
					<p class="comment--name"><%=cmt.getUsername()%>:
					</p>
					<p class="comment--text"><%=cmt.getText()%></p>
				</div>

				<%
				}
				%>


			</div>
		</div>
	</div>


</div>

<style>
.comment--empty {
	text-align: center;
	font-size: 2rem;
}

.comment_input input {
	border: none;
	outline: none;
	font-size: 1.4rem;
	width: min(70%, 100%);
	padding: 5px;
	margin-bottom: 2rem;
}

.comment_input span {
	font-size: 1.4rem;
	cursor: pointer;
	margin-left: 5px;
	padding: 1rem;
	background-color: var(--secondary);
}

.comment_display {
	box-sizing: border-box;
	background-color: var(--secondary);
	background-color: var(--secondary);
	padding: 2rem;
}

.comment {
	display: flex;
	align-items: center;
}

.comment:not(:last-child) {
	margin-bottom: 20px;
}

.comment--name {
	font-size: clamp(1rem, 2vw, 1.4rem);
	margin-right: 5px;
}

.comment--text {
	font-size: clamp(1rem, 2vw, 1.4rem);
	color: white;
	background-color: #404040;
	padding: 0.2rem 1rem;
	box-sizing: border-box;
	border-radius: 10px;
}

.movie-infor {
	color: var(--ct_1);
	padding: 2rem;
	background-color: var(--primary);
	border-radius: 5px;
}

.movie-name {
	color: white;
}

.movie-infor_block1 {
	display: flex;
	align-items: start;
}

.movie-infor_block2 {
	margin: 2rem 0;
	color: white;
}

.movie-infor_block2 h4 {
	font-size: 2.2rem;
	margin: 1rem 0;
	vertical-align: middle;
}

.movie-infor_block2>p {
	font-size: clamp(12px, 1.3vw, 40px);
	color: var(--ct_1);
}

.movie-infor_details {
	flex-grow: 1;
	padding: 0 1rem;
}

.movie-catetory {
	padding: 1rem 2rem;
	font-size: 1.6rem;
	display: flex;
}

.movie-catetory div:first-child {
	flex: 0.2;
}

.movie-catetory:not(:last-child) {
	border-bottom: 0.4px solid black;
}

.movie-catetory div:nth-child(2) {
	flex: 0.8;
	text-align: center;
}

.movie-catetory span {
	display: inline-block;
	padding: 0.6rem 1rem;
	border-radius: 5px;
	background-color: var(--secondary);
	color: white;
	font-size: clamp(10px, 1.5vw, 30px);
	margin-bottom: 5px;
}

.movie-infor_thump {
	width: 20%;
	padding: 0.4rem;
	background-color: var(--secondary);
}

.movie-infor_thump img {
	width: 100%;
}

.movie-name {
	font-size: clamp(20px, 2vw, 60px);
	text-align: center;
	margin-bottom: 2rem;
}

.movie-episodes a {
	text-decoration: none;
	display: inline-block;
	padding: 1rem 1.4rem;
	color: white;
	font-size: 1.3rem;
	background-color: #404040;
	display: inline-block;
}

.movie-episodes a:hover {
	opacity: 0.7;
}

@media only screen and (max-width:800px) {
	.movie-infor_block1 {
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.movie-infor_thump {
		width: 80%;
	}
	.movie-catetory {
		flex-direction: column;
		align-items: center;
	}
}
</style>

<script type="text/javascript">
	//Create a new XMLHttpRequest object
	var inputcmt = document.querySelector(".comment_input input");
	var cmtBtn = document.querySelector(".comment_input span");
	var cmtDisplay = document.querySelector(".comment_display")
	function handleComment( text){
		
		var xhr = new XMLHttpRequest();

		// Khởi tạo request với phương thức POST
		xhr.open("POST", "/MyAnime/comment", true);

		// Thiết lập header của request
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		const queryString = window.location.search;
		console.log(queryString);
		const urlParams = new URLSearchParams(queryString);
		const id = urlParams.get('id')
		
		// Đặt dữ liệu vào request body
		var data = "text="+text+"&movieid="+id;
		xhr.send(data);

		// Wait for the response from the server
		xhr.onload = function() {
			// Check if the request was successful
			if (xhr.status === 200) {
				// Get the response data
				var data = xhr.responseText;
				cmtDisplay.innerHTML=data+cmtDisplay.innerHTML;
				// Do something with the data
				// ...
			}else if(xhr.status === 401){
				location.href = "http://localhost:8080/MyAnime/login";
			}
			else {
				// Handle the error
				console.error('Request failed: ' + xhr.statusText);
			}
		};
	}
	cmtBtn.addEventListener("click",()=>{
		handleComment(inputcmt.value);
		inputcmt.value = "";
		inputcmt.focus();
	})
	inputcmt.addEventListener("keyup",(e)=>{
		if(e.key == "Enter"){
			handleComment(e.target.value);
			inputcmt.value = "";
			inputcmt.focus();
		}
		
	})
	
</script>
