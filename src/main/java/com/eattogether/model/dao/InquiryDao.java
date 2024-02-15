package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Inquiry;
import com.eattogether.utility.Paging;

public class InquiryDao extends SuperDao{
	public InquiryDao() {
		super();
	}

	public List<Inquiry> getDataList(Paging paging) {
		String sql = " select inq_no, mem_id, inq_content, inq_regdate ";
		sql += " from (select rank() over(order by inq_no asc) as ranking, inq_no, mem_id, inq_content, inq_regdate ";
		sql += " from Inquiry " ;
		
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
		
		List<Inquiry> dataList = new ArrayList<Inquiry>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());			
			
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Inquiry bean = this.resultSet2Bean(rs) ;
				
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

	private Inquiry resultSet2Bean(ResultSet rs) {
		try {
			Inquiry bean = new Inquiry();
			bean.setInq_no(rs.getInt("inq_no"));
			bean.setMem_id(rs.getString("mem_id"));
			bean.setInq_content(rs.getString("inq_content"));
			bean.setInq_regdate(String.valueOf(rs.getDate("inq_regdate")));
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertData(Inquiry bean) {
		String sql = " insert into inquiry(inq_no, mem_id, inq_content, inq_regdate)" ;
		sql += " values(seq_inquiry.nextval, ?, ?, sysdate)" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -1 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMem_id());
			pstmt.setString(2, bean.getInq_content());
			
			cnt = pstmt.executeUpdate() ;			
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		} finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return cnt ;
	}
}
