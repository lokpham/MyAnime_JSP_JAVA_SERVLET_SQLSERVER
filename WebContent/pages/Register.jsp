<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" href="styles/mystyle.css">
<link rel="stylesheet" href="styles/root.css">
</head>
<%
StringBuffer html = new StringBuffer();

//Thêm mã HTML vào chuỗi
html.append("<div>");
html.append("<label>Tên đăng nhập</label> <input  name=\"username\" type=\"text\">");
html.append("</div>");
html.append("<div>");
html.append("<label>Mật khẩu</label> <input  name=\"password\" type=\"password\">");
html.append("</div>");
html.append("<div>");
html.append("<label>Nhập lại mật khẩu</label> <input  name=\"repassword\" type=\"password\">");
html.append("</div>");

html.append("<button type=\"submit\">Đăng ký</button>");
html.append("<p>Đã có tài khoảng? <a href=\"/MyAnime/login\">Đăng nhập</a></p>");

//Lưu mã HTML vào biến String
String registerForm = html.toString();
request.setAttribute("formContent", registerForm);
request.setAttribute("formAction", "/MyAnime/register");

%>
<body>
	<div class="register_container">

		<jsp:include page="../components/Form.jsp"></jsp:include>
		<iframe width="0" height="0"
			src="https://www.youtube.com/embed/gNn9NxZH2Vo?autoplay=1&loop=1&playlist=gNn9NxZH2Vo"
			title="Ya Boy Kongming! OP / Opening「UHD 60FPS」" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			allowfullscreen></iframe>
		
	</div>

</body>
<style>
.register_container {
	height: 100vh;
	widht: 100vw;
	display: flex;
	justify-content: center;
	align-items: center;
	display: flex;
	background-color: var(--secondary);
	background-image: url("https://images2.alphacoders.com/127/1274557.jpg");
	background-size: cover;
}
</style>
</html>