<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


//Thêm mã HTML vào chuỗi

StringBuffer html = new StringBuffer();

html.append("<div>");
html.append("<label>Tên đăng nhập</label> <input  name=\"username\" type=\"text\">");
html.append("</div>");
html.append("<div>");
html.append("<label>Mật khẩu</label> <input  name=\"password\" type=\"password\">");
html.append("</div>");

html.append("<button type=\"submit\">Đăng nhập</button>");
html.append("<p>Chưa có tài khoảng? <a href=\"/MyAnime/register\">Đăng ký</a></p>");

// Lưu mã HTML vào biến String
String savedHtml = html.toString();

request.setAttribute("formContent", savedHtml);
request.setAttribute("formAction", "/MyAnime/login");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="styles/mystyle.css">
<link rel="stylesheet" href="styles/root.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<div class="login-container">
		<jsp:include page="../components/Form.jsp"></jsp:include>
		<iframe  width="0" height="0"
		src="https://www.youtube.com/embed/sRS8Otwbo7g?&autoplay=1&loop=1&playlist=sRS8Otwbo7g"
		title="あかせあかり / 恋ノ行方  (My Dress-Up Darling / Official Music Video)"
		frameborder="0" allow=" autoplay;" allowfullscreen></iframe>
	</div>
	
</body>

<style>


.login-container {
	height: 100vh;
	widht: 100vw;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	background-color: var(--secondary);
	background-image: url("https://images3.alphacoders.com/133/1334920.png");
	background-size: cover;
}
</style>
</html>
