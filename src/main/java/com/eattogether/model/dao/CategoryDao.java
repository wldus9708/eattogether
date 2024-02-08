package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Category;


public class CategoryDao extends SuperDao{
	private Category resultSet2Bean(ResultSet rs){
		Category bean = new Category();
		
		try {
			bean.setCat_no(rs.getInt("cat_no"));
			bean.setCat_name(rs.getString("cat_name"));
			
			return bean;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Category> getDataList(String module, String field) {
		//세미콜론위치, 띄어쓰기 위치 정확히 파악하셔라
		//?를 placeholder(1베이스입니다.)라고 합니다.
		//어떠한 값으로 치환될 대상입니다. 
		//치환은 뭐로? setxxx메소드로. executeQuery실행전에 해야하는거 알쥬
		String sql = "select * from fillitems";
		sql += " where module = ? and field = ?";
		sql += " order by ordering asc";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Category> dataList = new ArrayList<Category>();
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, module);
			pstmt.setString(2, field);
			
			rs = pstmt.executeQuery();
			
			//목록에 담기(memberDao의 요소들 읽기랑 같다)
			while(rs.next()) {
				Category bean = this.resultSet2Bean(rs);
				dataList.add(bean);
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
		
		return dataList;
	}
}
