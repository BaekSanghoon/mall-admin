<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<title>noticeAdd</title>
</head>
<body>
	<div class="container">

		<h1>공지사항 작성</h1>
		<form method="post" action="<%=request.getContextPath()%>/notice/noticeAddAction.jsp">
			<div>공지사항 제목 입력</div>
			<div><input type="text" name="noticeTitle"></div>
			<div>공지사항 내용 입력</div>
			<div><input type="text" name="noticeContent" style="width:500px;height:200px"></div>
			<div><button type="submit">[작성하기]</button></div>
		</form>
	</div>
</body>
</html>