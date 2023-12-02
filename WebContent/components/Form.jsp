
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// Lưu mã HTML vào biến String

String formContent = (String) request.getAttribute("formContent");

String formAction = (String) request.getAttribute("formAction");
String valid = (String) request.getParameter("valid");


// Lấy HTML của tài liệu
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
<link rel="stylesheet" href="styles/mystyle.css">
<link rel="stylesheet" href="styles/root.css">
</head>

<body>

	<form enctype="multipart/form-data" class="form" method="post"
		action="${formAction }">
		<%
		if (valid != null) {
			if (valid.equals("false")) {
				String ErrorMessage = (String) request.getParameter("code");
				if (ErrorMessage.equals("usunvalid")) {
		%>
		<div class="errormessage">Tên đăng nhập phải có ít nhất 6 ký tự và không quá 32 ký
			tự. Tên đăng nhập chỉ có thể chứa các ký tự chữ cái, số và dấu gạch
			dưới.</div>

		<%
		}
		if (ErrorMessage.equals("psunvalid")) {
		%>

		<div class="errormessage">Mật khẩu phải có ít nhất 8 ký tự và không quá 64 ký tự. Mật
			khẩu phải chứa ít nhất một ký tự chữ hoa, một ký tự chữ thường, một
			số và một ký tự đặc biệt.</div>
		<%
		}
		if (ErrorMessage.equals("rpsunvalid")) {
		%>
		<div class="errormessage">Mật khẩu không khớp</div>
		<%
		}
		if(ErrorMessage.equals("usexisted")){
			%>
			<div class="errormessage">Tài khoảng đã tồn tại</div>
			<%
		}
		if(ErrorMessage.equals("usnotfound")){
			%>
				<div class="errormessage">Tài khoảng không tồn tại</div>
			<%
		}
		if(ErrorMessage.equals("pswrong")){
			%>
				<div class="errormessage">Sai mật khẩu. Vui lòng nhập lại mật khẩui</div>
			<%
		}
		}
		}
		%>
		<%=formContent%>
	</form>

</body>


</html>



<style>
.form {
	display: block;
	width: min(100%, 400px);
	bbox-shadow: -1px 4px 33px -8px rgba(0, 0, 0, 0.75);
	-webkit-box-shadow: -1px 4px 33px -8px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: -1px 4px 33px -8px rgba(0, 0, 0, 0.75);
	padding: 2rem;
	box-sizing: border-box;
	background-color: var(--ct_white);
	border-radius: 20px;
	margin: 0 auto;
	font-size: 1.4rem;
	opacity: 0.8;
	-webkit-box-shadow: -1px 4px 33px -8px rgba(0, 0, 0, 0.75);
	-moz-box-shadow: -1px 4px 33px -8px rgba(0, 0, 0, 0.75);
}

.form>div {
	border-bottom: 1px solid gray;
	margin: 10px 0;
}

.form label, .form input {
	display: block;
}

.form label {
	color: var(--ct_black);
	font-size: clamp(15px, 1.5vw, 1.8rem);
}

.form input {
	width: 100%;
	outline: none;
	border: none;
	padding: 0.5rem;
	font-size: 1.4rem;
	box-sizing: border-box;
	caret-color: var(--primary);
}

.form button {
	padding: 1rem 2rem;
	border: none;
	background-color: #9ca3af;
	color: var(--ct_white);
	margin: 10px auto;
	display: block;
	cursor: pointer;
	font-size: clamp(15px, 1.5vw, 1.8rem);
}

.form p a {
	color: var(--ct_red);
	text-decoration: underline;
	font-size: clamp(15px, 2.12vw, 1.8rem);
}

.form p a:hover {
	color: red;
}
.errormessage{
	background-color: red;
	color:white;
	box-sizing: border-box;
	padding: 10px;
}
</style>
