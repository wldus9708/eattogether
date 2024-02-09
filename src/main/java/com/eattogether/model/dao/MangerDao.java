package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Manger;
import com.eattogether.utility.Paging;

public class MangerDao extends SuperDao{
	public List<Manger> getDataList(Paging paging) {
		String sql = " select mem_id, mem_name, mem_alias, mem_birth, mem_phone, mem_taste , mem_flag";
		sql += " from (select rank() over(order by mem_no desc) as ranking, mem_id, mem_name, mem_alias, mem_birth, mem_phone, mem_taste, mem_flag ";
		sql += " from Members " ;
		
		// 필드 검색을 위하여 mode 변수로 분기 처리하도록 합니다.
		String mode = paging.getMode() ;
		String keyword = paging.getKeyword() ;
		
		if(mode==null || mode.equals("all") || mode.equals("null") || mode.equals("")) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ; 
		}
		
		sql += " )";
		sql += " where ranking between ? and ? ";
		
		System.out.println("sql 구문:\n" + sql);
		
		PreparedStatement pstmt = null ; // 문장 객체
		ResultSet rs = null ;
		
		List<Manger> dataList = new ArrayList<Manger>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());			
			
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Manger bean = this.resultSetBean(rs) ;
				
				dataList.add(bean) ;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
			
		return dataList ;
	}

	private Manger resultSetBean(ResultSet rs) {
		try {
			Manger bean = new Manger();
			bean.setMem_id(rs.getString("mem_id"));
			bean.setMem_id(rs.getString("mem_name"));
			bean.setMem_id(rs.getString("mem_alias"));
			bean.setMem_id(String.valueOf(rs.getDate("mem_birth")));
			bean.setMem_id(rs.getString("mem_phone"));
			bean.setMem_id(rs.getString("mem_taste"));
			bean.setMem_id(rs.getString("mem_flag"));
			
			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
