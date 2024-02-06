package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Recipe;
import com.eattogether.utility.Paging;

public class RecipeDao extends SuperDao{
	public List<Recipe> getDataList(Paging paging){
		String sql = " select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_matrial";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark";
		//sql += " from products)";
		
		//sql += " where ranking between ? and ?";
		//필드 검색을 위하여 mode 변수로 분기 처리 하도록 합시다.
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
		String sql = " select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		/*
		 * String sql =
		 * " select pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate"
		 * ; sql +=
		 * " from (select rank() over(order by pnum asc) as ranking, pnum, name, company, image01, image02, image03, stock, price, category, contents, point, inputdate"
		 * ; sql += " from products)"; sql += " where ranking between ? and ?";
		 */
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Recipe> dataList = new ArrayList<Recipe>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			
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
			
	private Recipe resultSet2Bean(ResultSet rs) {
		Recipe bean = new Recipe();
		try {
			bean.setRec_no(rs.getInt("rec_no"));
			bean.setMem_no(rs.getInt("mem_no"));
			bean.setCat_no(rs.getInt("cat_no"));
			bean.setRec_header(rs.getString("rec_header"));
			bean.setRec_content(rs.getString("rec_content"));
			bean.setRec_regdate(String.valueOf(rs.getDate("rec_regdate")));
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
}
