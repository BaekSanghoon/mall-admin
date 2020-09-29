<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> <!-- 파일이름 대신 만들어줌 단! 직접 원하는 이름으로변환 불가  -->
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//상품 아이디와 이미지 파일을 받아서 이미지 파일을 저장한다.
	//이미지 파일을 서버 images폴더에 새로운 이름으로 저장
	//저장된 이미지의 이름을 강품테이블에서 수정한다 새로 생성된 이름으로 변경
	
	//기존방식 사용불가
	//String productId = request.getParameter("productId");
	//String productPic = request.getParameter("productPic");	
	//System.out.println(productId +"<-- productId 이미지 정보 확인 작업2"); //확인작업 //null
	//System.out.println(productPic +"<-- productPic 이미지 정보 확인 작업2");	//null
	
	//cos.jar 외부라이브러리 사용 (자동으로 저장함 단! 원하는 곳에 저장 불가) 경로, 크기, 인코딩, 파일이름 만들어질 객체
	int size = 1024 * 1024 *100; //크기 100M
	String path = application.getRealPath("image");	//실제경로를 찾아주세요 
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	//System.out.println(productId +"<-- productId 이미지 정보 확인 작업3");
	
	//System.out.println(multi.getOriginalFileName("productPic")+"<== 파일원본 파일 이름");
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+"<== 새로생성된 파일 이름");
	//두개를 묶음
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
	
	// update product set product_pic = ? where product_id = ?
	//productDao.updateProductPic(product);
	%>