<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<title>categoryList</title>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		
		<h1 class="bg-warning text-white">카테고리 목록</h1>
		<div>
			<a href="/mall-admin/category/addCategory.jsp" class="btn btn-info" role="button">상품카테고리 추가</a>
		</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list =categoryDao.selectCategoryList();
	%>
		<table class="table table-light table-striped table-hover">
			<thead>
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 이름</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			</thead>
			<tbody>
			<%
				for(Category c : list) {
			%>
				<tr>
					<td><%=c.getCategoryId()%></td>
					<td><%=c.getCategoryName()%></td>
					<td><a href="/mall-admin/category/categoryUpdate.jsp?categoryId=<%=c.getCategoryId()%>">[수정]</a></td>
					<td><a href="/mall-admin/category/categoryDeleteAction.jsp?categoryId=<%=c.getCategoryId()%>">[삭제]</a></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</body>
</html>