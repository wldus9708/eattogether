package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Recipe;
import com.eattogether.utility.Paging;

public class RecipeDao extends SuperDao{
	public Recipe getDataBean(int rec_no) {
		String sql ="select * from recipe";
		sql += " where rec_no = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe bean = null;
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rec_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = this.resultSet2Bean(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("bean 데이터 조회 결과 : ");
		System.out.println(bean);
		
		return bean;
	}
	
	public List<Recipe> getDataList(Paging paging){
 		String sql = "select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from recipe ";
		
		String mode = paging.getMode();
		String keyword = paging.getKeyword();
		
		if(mode == null|| mode.equals("all") || mode.equals("null")|| mode.equals("")) {
		}else {//전체 모드가 아니면
			sql += " where "+mode+" like '%"+keyword+"%'";
		}
			
		sql += ")";
		sql += " where ranking between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Recipe> dataList = new ArrayList<Recipe>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());
			
			rs = pstmt.executeQuery();
			
			//요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {rs.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dataList;
	}
	
	public List<Recipe> getDataList(int beginRow, int endRow){
		String sql = "select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from recipe) where ranking between ? and ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Recipe> dataList = new ArrayList<Recipe>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 9);
			
			rs = pstmt.executeQuery();
			
			//요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {rs.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println(dataList.size());
		return dataList;
	}
			
	private Recipe resultSet2Bean(ResultSet rs) {

		Recipe bean = new Recipe();
		try {
			bean.setRec_no(rs.getInt("rec_no"));
			bean.setMem_no(rs.getInt("mem_no"));
			bean.setCat_no(rs.getInt("cat_no"));
			bean.setRec_header(rs.getString("rec_header"));
			bean.setRec_content(rs.getString("rec_content"));
			bean.setRec_regdate(String.valueOf(rs.getDate("rec_regdate")));
			bean.setRec_photo(rs.getString("rec_photo"));		
			bean.setRec_hit(rs.getInt("rec_hit"));
			bean.setRec_popularity(rs.getInt("rec_popularity"));
			bean.setRec_bookmark(rs.getString("rec_bookmark"));
			bean.setRec_material(rs.getString("rec_material"));
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
	}
	
	/*
	 * public int insertData(Recipe bean) { System.out.println(bean);
	 * 
	 * String sql = " insert into r" //상품 번호는 시퀀스로 처리, 입고 일자는 상황에 맞도록 설정(기본 값 지정)하기로
	 * 합니다. //String
	 * sql=" insert into products(pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate)"
	 * ; //sql += " values(seqproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 * 
	 * PreparedStatement pstmt = null; int cnt = -999999;
	 * 
	 * try { super.conn = super.getConnection(); conn.setAutoCommit(false);
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * //치환은 실행 앞에서 하는거다!! pstmt.setString(1, bean.getName()); pstmt.setString(2,
	 * bean.getCompany()); pstmt.setString(3, bean.getImage01()); pstmt.setString(4,
	 * bean.getImage02()); pstmt.setString(5, bean.getImage03()); pstmt.setInt(6,
	 * bean.getStock()); pstmt.setInt(7, bean.getPrice()); pstmt.setString(8,
	 * bean.getCategory()); pstmt.setString(9, bean.getContents()); pstmt.setInt(10,
	 * bean.getPoint()); pstmt.setString(11, bean.getInputdate());
	 * 
	 * //여기가 실행 cnt = pstmt.executeUpdate(); conn.commit(); }catch(Exception e) {
	 * e.printStackTrace(); try { conn.rollback(); }catch(Exception e2) {
	 * e2.printStackTrace(); } }finally { try { if(pstmt != null) {pstmt.close();}
	 * super.closeConnection(); }catch(Exception e2) { e2.printStackTrace(); } }
	 * return cnt; }
	 * 
	 * public int UpdateData(Recipe bean) { System.out.println(bean); String
	 * sql=" update products set name=?, company=?, image01=?, image02=?, image03=?, stock=?, price=?, category=?, contents=?, point=?, inputdate=?"
	 * ; sql += " where pnum = ?";
	 * 
	 * PreparedStatement pstmt = null; int cnt = -9999999;
	 * 
	 * try { super.conn = super.getConnection(); conn.setAutoCommit(false);
	 * 
	 * pstmt = conn.prepareStatement(sql);
	 * 
	 * 
	 * pstmt.setString(1, bean.getName()); pstmt.setString(2, bean.getCompany());
	 * pstmt.setString(3, bean.getImage01()); pstmt.setString(4, bean.getImage02());
	 * pstmt.setString(5, bean.getImage03()); pstmt.setInt(6, bean.getStock());
	 * pstmt.setInt(7, bean.getPrice()); pstmt.setString(8, bean.getCategory());
	 * pstmt.setString(9, bean.getContents()); pstmt.setInt(10, bean.getPoint());
	 * pstmt.setString(11, bean.getInputdate()); pstmt.setInt(12, bean.getPnum());
	 * 
	 * cnt = pstmt.executeUpdate(); conn.commit(); }catch(Exception e) {
	 * e.printStackTrace(); try { conn.rollback(); }catch(Exception e1) {
	 * e1.printStackTrace(); } }finally { try { if(pstmt != null) {pstmt.close();}
	 * super.closeConnection(); }catch(Exception e2) { e2.printStackTrace(); } }
	 * return cnt; }
	 */
}
