package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.eattogether.model.bean.Notice;

public class NoticeDao extends SuperDao{
	
	public int insertData(Notice bean) {
		// no 컬럼은 시퀀스가 알아서 처리합니다.				
		String sql = " insert into notice(not_no, mem_no, not_header, not_content, not_redate)" ;
		sql += " values(seqboard.nextval, ?, ?, ?, ?)" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, bean.getMem_no());
			pstmt.setInt(2, bean.getNot_header());
			pstmt.setInt(3, bean.getNot_content());
			pstmt.setInt(4, bean.getNot_redate());
			
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
	
	public NoticeDao() {
		super();
	}

}
