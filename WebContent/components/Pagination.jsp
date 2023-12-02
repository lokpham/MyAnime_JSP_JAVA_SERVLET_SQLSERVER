<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int movie_quantity = (int) request.getAttribute("movie_quantity");
%>
<%
if (movie_quantity > 8) {
%>
<div _movie_quantity="<%=movie_quantity%>" class="pagination">
	<div class="page-btn page-btn_prev">
		<i class="fa-solid fa-arrow-left"></i>
	</div>
	<div class="page-btns"></div>
	<div class="page-btn page-btn_next">
		<i class="fa-solid fa-arrow-right"></i>
	</div>
</div>

<%
}
%>

<script>


var current_page = 1;
const queryParams = location.search.split("&");

const page = parseInt(queryParams[0].split("=")[1]); // page

if(!page){
	
	current_page = 1;
}else{
	
	current_page = page;
	
}



var btnNext = document.querySelector(".page-btn_next");
var btnPrev = document.querySelector(".page-btn_prev");


function pagination(c, m) {
    var current = c,
        last = m,
        delta = 2,
        left = current - delta,
        right = current + delta + 1,
        range = [],
        rangeWithDots = [],
        l;

    for (let i = 1; i <= last; i++) {
        if (i == 1 || i == last || i >= left && i < right) {
            range.push(i);
        }
    }

    for (let i of range) {
        if (l) {
            if (i - l === 2) {
                rangeWithDots.push(l + 1);
            } else if (i - l !== 1) {
                rangeWithDots.push('...');
            }
        }
        rangeWithDots.push(i);
        l = i;
    }

    return rangeWithDots;
}

const btns = document.querySelector(".page-btns");
const movie_quantity = document.querySelector(".pagination").getAttribute("_movie_quantity");

if(document.querySelector(".pagination")){
	
	
	
	
}

const pages =Math.floor(movie_quantity/8);

var currentPagination = pagination(current_page,pages);


currentPagination.forEach(render);

function render(item) {
	var btn = document.createElement("div");
	
	btn.classList.add("page-btn");
	btn.innerHTML = item;
	btn.addEventListener("click",()=>{
		current_page = item;
		handleSelect(item);
	})
	
	if(item == "..."){
		
		btn.classList.add("voidClick");
	}
	if(item == current_page && item != "..."){
		
		btn.classList.add("active");
	}
	
	btns.appendChild(btn);
	
 	
}

btnNext.addEventListener("click",()=>{
	if(current_page == pages){
		
	}else{
		current_page++;
		
	}
	
	handleSelect(current_page);
})
btnPrev.addEventListener("click",()=>{
	if(current_page == 1){
		
	}else{
		current_page--;
		
	}
	handleSelect(current_page);
	
})



function handleSelect(page){
	
	btns.innerHTML = "";
	var newCurrentPagination = pagination(page,pages);
	newCurrentPagination.forEach(render);
	window.location.href = "/MyAnime/changepage?page="+page;
}


//for (let i = 1, l = 20; i <= l; i++)
  //  console.log(`Selected page \${i}:`, pagination(i, l));

// Tạo các liên kết trang


</script>