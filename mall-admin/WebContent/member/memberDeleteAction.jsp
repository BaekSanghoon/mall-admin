<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String memberEmail = request.getParameter("memberEmail");
	Member member = new Member();
	member.setMemberEmail(memberEmail);
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	
	response.sendRedirect("/mall-admin/member/memberList.jsp");
	
%>
