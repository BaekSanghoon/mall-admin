<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
<h1>쇼핑몰 회원관리</h1>
<%
	request.setCharacterEncoding("utf-8");
	MemberDao memberDao = new MemberDao();
	ArrayList<Member>list = memberDao.selectMemberList();
%>
	<table class="table">
		<thead>
			<tr>
				<th>member_email</th>
				<th>member_pw</th>
				<th>member_name</th>
				<th>member_date</th>
				<th>member_delete</th>
			</tr>	
		</thead>
		<tbody>
		<%
			for(Member m : list) {
		%>
			<tr>
				<td><%=m.getMemberEmail() %></td>
				<td><%=m.getMemberPw() %></td>
				<td><%=m.getMemberName() %></td>
				<td><%=m.getMemberDate() %></td>
				<td><a href="/mall-admin/member/memberDeleteAction.jsp?memberEmail=<%=m.getMemberEmail()%>">회원삭제</a></td>
			</tr>
		<%
			}
		%>	
		</tbody>
	
	</table>
</div>
</body>
</html>