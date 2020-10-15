<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null) {
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
		if($("#categoryName").val() == "") {
			alert("categoryName 입력")
			return;
		}
		$("#addCategory").submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h1 class="bg-warning text-white">카테고리 추가</h1>
		<form method="post" id="addCategory" action="/mall-admin/category/addCategoryAction.jsp">
			<div class="btn btn-info text-white">카테고리 이름 입력</div>
			<div><input type="text" name="categoryName" id="categoryName"></div>
			<div><button type="button" id="btn" class="btn btn-warning text-white">[확인]</button></div>
		</form>
	</div>
</body>
</html>