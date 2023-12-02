<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User u = new User();
u = (User) session.getAttribute("user");
%>
<div class="header">
	<a href="/MyAnime/home" class="header_logo">MyAnime</a>
	<form class="header_search mobileHidden" method="post"
		action="/MyAnime/search">
		<input name="anime_name" class="header_searchbar" type="text"
			placeholder="Nhập tên phim"> <input class="btn_search"
			type="submit" value="Tìm kiếm">
	</form>
	<%
	if (u == null) {
	%>

	<div class="header_user">
		<a href="/MyAnime/login"> <i class="fa-solid fa-user"></i>

		</a>
	</div>
	<%
	} else {
	%>
	<div class="header_user logged"><%=u.getUsername()%>
		<span class="logout"> Thoát </span>

	</div>
	<%
	}
	%>

	<div class="header_menu">
		<i class="menuicon fa-solid fa-bars"></i>

	</div>
	<div class="menu_mobile notactive">



		<div>
			<i class="closebtn fa-solid fa-xmark "></i>

			<%
			if (u == null) {
			%>

			<div class="header_user mobie">
				<a href="/MyAnime/login"> <i class="fa-solid fa-user"></i>

				</a>
			</div>
			<%
			} else {
			%>
			<div class="header_user logged mobie"><%=u.getUsername()%>
				<span class="logout logoutmobile"> Thoát </span>

			</div>
			<%
			}
			%>



		</div>

		<form class="header_search " method="post" action="/MyAnime/search">
			<input name="anime_name" class="header_searchbar" type="text"
				placeholder="Nhập tên phim"> <input class="btn_search"
				type="submit" value="Tìm kiếm">
		</form>
	</div>
</div>
<style>
.header {
	padding: 1.5rem clamp(4rem, 10vw, 15rem);
	display: flex;
	justify-content: space-between;
	background-color: var(--primary);
	color: var(--ct_white);
	font-size: 2rem;
	align-items: center;
}

.header_logo {
	text-decoration: none;
	color: var(--ct_white);
}

.logout {
	color: red;
	cursor: pointer;
}

.logout:hover {
	text-decoration: underline;
}

.header_search {
	flex-basis: 40%;
	display: flex;
	border-radius: 5px;
}

.header_user {
	cursor: pointer;
	color: var(--ct_white);
}

.header_user.logged {
	font-size: 1.2rem;
	vertical-align: middle;
	cursor: default;
}

.header_user a {
	color: var(--ct_white);
}

.header_searchbar {
	display: block;
	outline: none;
	border: none;
	outline: none;
	flex-grow: 1;
	padding: 1rem 1rem;
}

.btn_search {
	dissplay: block;
	outline: none;
	border: none;
	padding: 0 10px;
	cursor: pointer;
}

.btn_search:hover {
	opacity: 0.8;
}

.header_menu {
	display: none;
}

.menu_mobile.notactive {
	display: none;
}

.menu_mobile {
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: var(--primary);
	opacity: 0.9;
	padding: 2rem;
	box-sizing: border-box;
	z-index: 2;
	position: fixed;
}

.menu_mobile i {
	font-size: 2rem;
	color: var(--ct_white);
	cursor: pointer;
}

.menu_mobile div:first-child {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

@media only screen and (max-width:600px) {
	.header_search.mobileHidden {
		display: none;
	}
	.header_menu {
		display: block;
	}
	.header_user {
		display: none;
	}
	.header_user.mobie{
		display:block;
	}
}
</style>

<script>
	const menubtn = document.querySelector(".menuicon");
	const menu = document.querySelector(".menu_mobile");
	menubtn.addEventListener("click",()=>{
		menu.classList.remove("notactive");
	});
	
	const closebtn = document.querySelector(".closebtn");
	
	closebtn.addEventListener("click",()=>{
		menu.classList.add("notactive");
	})
	
    // Create a button
    const myButton = document.querySelector(".logout");
	const myButtonMobie = document.querySelector(".logoutmobile")
    // Add a click event listener to the button
     myButtonMobie.addEventListener("click", function() {
		console.log("aa")
      // Create an XMLHttpRequest object
      var xhr = new XMLHttpRequest();

      // Open a connection to the servlet
      xhr.open("post", "/MyAnime/logout");

      // Send the HTTP request
      xhr.send();
      xhr.onload = function() {
    	  if (xhr.status === 200) {
    	    // Success!
    	    document.location.reload(true);
    	  } else {
    	    // Error!
    	    console.log(xhr.statusText);
    	  }
    	};
    });
    myButton.addEventListener("click", function() {
		console.log("aa")
      // Create an XMLHttpRequest object
      var xhr = new XMLHttpRequest();

      // Open a connection to the servlet
      xhr.open("post", "/MyAnime/logout");

      // Send the HTTP request
      xhr.send();
      xhr.onload = function() {
    	  if (xhr.status === 200) {
    	    // Success!
    	    document.location.reload(true);
    	  } else {
    	    // Error!
    	    console.log(xhr.statusText);
    	  }
    	};
    });
  
</script>

