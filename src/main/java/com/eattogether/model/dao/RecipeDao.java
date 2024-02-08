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
			pstmt.setInt(2, 22);
			
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

	public int insertData(Recipe bean) {
		System.out.println(bean);
		
		String sql=" insert into recipe(rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_hit, rec_popularity, rec_bookmark, rec_material)";
		sql += " values(seqproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			//치환은 실행 앞에서 하는거다!!
			pstmt.setInt(1, bean.getRec_no());
			pstmt.setInt(2, bean.getMem_no());
			pstmt.setInt(3, bean.getCat_no());
			pstmt.setString(4, bean.getRec_header());
			pstmt.setString(5, bean.getRec_content());
			pstmt.setString(6, bean.getRec_regdate());
			pstmt.setInt(7, bean.getRec_hit());
			pstmt.setInt(8, bean.getRec_popularity());
			pstmt.setString(9, bean.getRec_bookmark());
			pstmt.setString(10, bean.getRec_material());
			
			//여기가 실행
			cnt = pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	
	
}
