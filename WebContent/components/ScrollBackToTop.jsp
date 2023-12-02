<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<div class="backtotop">
	<i class="fa-solid fa-arrow-up"></i>

</div>
<style>
body{
	  scroll-behavior: smooth;
}
.backtotop {
	padding: 1.5rem;
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: red;
	color: white;
	cursor: pointer;
	display:none;
	animation:fadein 0.2s linear;

}
@keyframes fadein {
  from {
  	  transform: translateY(40px);
  	
  }
  to { transform: translateY(0);}
}
.backtotop:hover {
	opacity: 0.9;
}

.backtotop>i {
	font-size: 2rem;
	text-align: center;
}
.show{
	display:block;
}
</style>
<script>
 const backToTopButton = document.querySelector('.backtotop');

//Add a scroll event listener to the window
window.addEventListener('scroll', () => {
// If the user has scrolled more than 300 pixels from the top of the page, show the back to top button
if (window.scrollY > 300) {
  backToTopButton.classList.add('show');
} else {
  backToTopButton.classList.remove('show');
}
});

//Add a click event listener to the back to top button
backToTopButton.addEventListener('click', () => {
// Scroll to the top of the page
window.scrollTo({
	
	top:0,
	right:0,
	behavior: "smooth",
});

});
 
 
 
 </script>