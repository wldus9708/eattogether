package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Recipe;
import com.eattogether.utility.MainPaging;

public class MainDao extends SuperDao{
	
	public List<Recipe> getDataList(MainPaging paging) {
		String sql = "select rec_no, mem_id, cat_no, rec_photo, rec_material";
		sql += " from (select rank() over(order by rec_no desc) as ranking, rec_no, mem_id, cat_no, rec_photo, rec_material";
		sql += " from recipe ";

		String keyword1 = paging.getKeyword();

		sql += " where " + " like '%" + keyword1 + "%'";
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

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					rs.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dataList;
	}
	
	public List<Recipe> getDataList(int beginRow, int endRow) {
		String sql = "select rec_no, mem_id, cat_no, rec_photo, rec_material";
		sql += " from (select rank() over(order by rec_no desc) as ranking, rec_no, mem_id, cat_no, rec_photo, rec_material";
		sql += " from recipe ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Recipe> dataList = new ArrayList<Recipe>();

		super.conn = super.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, 1);
			pstmt.setInt(2, 25);

			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					rs.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
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
			bean.setMem_id(rs.getString("mem_id"));
			bean.setCat_no(rs.getInt("cat_no"));
			bean.setRec_photo(rs.getString("rec_photo"));
			bean.setRec_material(rs.getString("rec_material"));

			return bean;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

}
