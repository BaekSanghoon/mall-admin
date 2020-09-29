<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
	<%
		request.setCharacterEncoding("utf-8");
	
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		//System.out.println(noticeId+ "<--noticeId");
		
		NoticeDao noticeDao = new NoticeDao();
		Notice notice = null;
		notice = noticeDao.selectNotice(notice);
	%>
		<h1>공지사항 수정</h1>
		<form method="post" action="/mall-admin/notice/noticeUpdateAction.jsp">
			<table class="table">
				<tr>
					<td>공지 번호</td>
					<td><input type="hidden" value=<%=notice.getNoticeId() %> name="noticeId"><%=notice.getNoticeId() %></td>
				</tr>	
				<tr>
					<td>공지 title</td>
					<td><input type="text" value="<%=notice.getNoticeTitle()%>" name="noticeTitle"></td>
				</tr>	
				<tr>
					<td>공지 내용</td>
					<td><input type="text" value="<%=notice.getNoticeContent()%>" name="noticeContent" style="width:500px;height:200px" ></td>
				</tr>
			</table>
			<button type="submit">[수정 완료]</button>
		</form>
	
	</div>
</body>
</html>