<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String username = (String) request.getAttribute("username");
%>
</head>
<body>
	<form>
		<input value="${username}" type="text" >
	</form>
</body>
</html>