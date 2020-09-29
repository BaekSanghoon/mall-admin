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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp" ></jsp:include>
	</div>
	<%

	request.setCharacterEncoding("UTF-8");
	//페이지에 출력할 주문내용
	String ordersState = ""; 
	//null인지 체크
	if (request.getParameter("ordersState") != null) {
		//ordersState를 입력값을 저장하는 변수로 지정
		ordersState = request.getParameter("ordersState");
	}
	//dao에 있는 주문 목록을 받아온다.
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> list = null;
	//ArrayList<String> list2 = null;
	
	//리스트 전체출력
	if (ordersState.equals("")) {
		list = ordersDao.selectOrdersList(); //주문내역 리스트 dao
	//검색한 주문 상태 리스트 출력	
	} else {
		//list = ordersDao.selectOrdersListByState(ordersState);
	}
	ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();//ordersStateList의 리스트값을 보여주는db
		//list2 = ordersDao.selectOrdersStateList();
	%>
	<h1>주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				//주문 상태 검색 버튼 출력하는 부분
				for(String s : ordersStateList) {
			%>
					<option value="<%=s%>"><%=s%></option>
			<%		
				}
			%>
		</select>
		<button type="submit">주문상태별로 보기</button>
	</form>
	<table Class="table">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>oders_state</th>
				<th>orders_date</th>
				<th>orders_state 수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				//리스트를 불러온다.
				for(OrdersAndProduct ordersAndProduct : list) {
			%>
			<tr>
				<td><%=ordersAndProduct.getOrders().getOrdersId() %></td>
				<td><%=ordersAndProduct.getOrders().getProductId() %></td>
				<td><%=ordersAndProduct.getProduct().getProductName() %></td>
				<td><%=ordersAndProduct.getOrders().getOrdersAmount() %></td>
				<td><%=ordersAndProduct.getOrders().getOrdersPrice() %></td>
				<td><%=ordersAndProduct.getOrders().getMemberEmail() %></td>
				<td><%=ordersAndProduct.getOrders().getOrdersAddr() %></td>
				<td><%=ordersAndProduct.getOrders().getOrdersState() %></td>
				<td><%=ordersAndProduct.getOrders().getOrdersDate() %></td>
				<td><a href = "/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=ordersAndProduct.getOrders().getOrdersId()%>&ordersState=<%=ordersAndProduct.getOrders().getOrdersState() %>" >orders state 수정</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
		
	</table>
</div>
</body>
</html>