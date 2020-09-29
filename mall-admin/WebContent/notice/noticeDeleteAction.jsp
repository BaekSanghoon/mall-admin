<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	Notice notice = new Notice();
	notice.setNoticeId(noticeId);
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(notice);
	
	response.sendRedirect("/mall-admin/notice/noticeList.jsp");
%>