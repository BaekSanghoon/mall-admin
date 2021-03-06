<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String productName = request.getParameter("productName");	
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");

	Product product = new Product();
	product.setProductId(productId);
	product.setCategoryId(categoryId);
	product.setProductName(productName); 
	product.setProductPrice(productPrice); 
	product.setProductContent(productContent);
	product.setProductSoldout(productSoldout);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductOne(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>