package dao;

import java.util.*;

import commons.DBUtil;

import java.sql.*;
import vo.*;

public class ProductDao {
	// 판매중&품절 선택 쿼리문
	public void updateProductSoldout(int productId, String productSoldout) throws Exception  {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();//DBUtil 메소드를 호출하여 DB주소값을 호출한다
		String sql = "update product set product_soldout = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
		} else {
			stmt.setString(1, "Y");
		}
		stmt.setInt(2, productId);
		
		int row = stmt.executeUpdate();
		System.out.println(row +"행 수정");
	}
	
	//자세히보기(하나만보기)
	public Product selectProductOne(int productId) throws Exception {
		Product product = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			product = new Product();
			product.setProductId (rs.getInt("product_id"));
			product.setCategoryId (rs.getInt("category_id"));
			product.setProductName (rs.getString("product_name"));
			product.setProductPrice (rs.getInt("product_price"));
			product.setProductContent (rs.getString("product_content"));
			product.setProductSoldout (rs.getString("product_soldout"));
			product.setProductPic (rs.getString("product_pic")); // default.jpg를 가져온다.
		}
		
		return product;
	}
	
	public void insertProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection(); //DBUtil 메소드를 호출하여 DB주소값을 호출한다
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values (?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		
		conn.close();
		
	}
	//과일 리스트 선택시 리스트 출력 쿼리문
	public ArrayList<Product> selectProductListBycategoryId(int categoryId) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product where category_id = ? LIMIT 8";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,  categoryId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId (rs.getInt("product_id"));
			p.setCategoryId (rs.getInt("category_id"));
			p.setProductName (rs.getString("product_name"));
			p.setProductPrice (rs.getInt("product_price"));
			p.setProductContent (rs.getString("product_content"));
			p.setProductSoldout (rs.getString("product_soldout"));
			p.setProductPic(rs.getString("product_pic"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//리스트 쿼리문
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();	
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout, product_pic from product LIMIT 8";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId (rs.getInt("product_id"));
			p.setCategoryId (rs.getInt("category_id"));
			p.setProductName (rs.getString("product_name"));
			p.setProductPrice (rs.getInt("product_price"));
			p.setProductContent (rs.getString("product_content"));
			p.setProductSoldout (rs.getString("product_soldout"));
			p.setProductPic(rs.getString("product_pic"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//삭제 쿼리
	public void deleteProduct(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "delete from product where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getProductId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//수정 쿼리
	public void updateProductOne(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set category_id = ?, product_name = ?, product_price = ?, product_content = ?, product_soldout = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.setInt(6, product.getProductId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//수정 리스트 쿼리
	public Product selectProductOne(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select product_id, category_id, product_name, product_price, product_content, product_soldout from product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		//Product product = null;
		while(rs.next()) {
			product = new Product();
			product.setProductId (rs.getInt("product_id"));
			product.setCategoryId (rs.getInt("category_id"));
			product.setProductName (rs.getString("product_name"));
			product.setProductPrice (rs.getInt("product_price"));
			product.setProductContent (rs.getString("product_content"));
			product.setProductSoldout (rs.getString("product_soldout"));
		}
		conn.close();
		return product;
	}
	//사진 업데이트 쿼리
	public Product updateProductPic(Product product) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "update product set product_pic = ? where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
		
		conn.close();
		return product;
	}
	
}
