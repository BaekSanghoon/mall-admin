<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrdersState.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		String ordersState = request.getParameter("ordersState");
		
		OrdersDao ordersDao = new OrdersDao();
		//ArrayList<Orders> ordersStateList = ordersDao.selectOrdersOne();
	%>
		<div class="container">
			
			<div>
				<jsp:include page="/inc/menu.jsp"></jsp:include>
			</div>
			
			<div class="jumbotron">
				<h1>주문 수정</h1>
			</div>
			
			<form method="post" action="/mall-admin/orders/modifyOrdersStateAction.jsp">
				<table class="table table-hover" style="text-align: center;">
					<tr>
						<td>주문 번호</td>
						<td>
							<input type="text" class="form-control" name="ordersId" value="<%=ordersId %>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>주문 상태</td>
						<td>
							<select class="form-control" name="ordersState">
							<%
								if (ordersState.equals("결제완료")) {
									%><option value="결제완료" selected="selected">결제완료</option><%
								} else {
									%><option value="결제완료">결제완료</option><%
								}
							
								if (ordersState.equals("배송준비중")) {
									%><option value="배송준비중" selected="selected">배송준비중</option><%
								} else {
									%><option value="배송준비중">배송준비중</option><%
								}
								
								if (ordersState.equals("배송완료")) {
									%><option value="배송완료" selected="selected">배송완료</option><%
								} else {
									%><option value="배송완료">배송완료</option><%
								}
								
								if (ordersState.equals("주문취소")) {
									%><option value="주문취소" selected="selected">주문취소</option><%
								} else {
									%><option value="주문취소">주문취소</option><%
								}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-info">수정</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
</body>
</html>