
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/bodystyle.css">
<div class="bodycontent">
	<div class="movie-container">

		<jsp:include page="./MovieList.jsp"></jsp:include>
		<jsp:include page="./Pagination.jsp"></jsp:include>

	</div>
</div>





<style>

.voidClick{
	pointer-events: none;
	opacity: 0.7;
}
.active{

	border:2px solid red;
}



.movie-container {
	background-color: var(--primary);
	color: var(--ct_white);
	padding: 2rem;
}

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top:20px;
	gap:10px;
}

.page-btns{
	display:flex;
	gap:10px;
	align-items:center;
	justify-content: center;
}
.page-btn {
	width: 25px;
	height: 25px;
	background-color: gray;
	border-radius: 4px;
	
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--ct_white);
	font-size: 1.2rem;
	display: flex;
	cursor: pointer;
}
.page-btn_prev{
	
}




</style>