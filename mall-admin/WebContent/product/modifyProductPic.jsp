<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 이미지 수정</h1>
		<%
			int productId = Integer.parseInt(request.getParameter("productId"));
		
			//System.out.println(productId +"<-- productId 이미지 정보 확인 작업");
		%>
	<form action="/mall-admin/product/modifyProductPicAction.jsp" method="post" enctype="multipart/form-data"> 
		<input type="hidden" name="productId" value=<%=productId %>>
		<div>
			이미지 선택:
			<input type="file" name="productPic">	
		</div>
			
		<div>
			<button type="submit">이미지수정</button>
		</div>
		
	</form>
</body>
</html>