package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Notice;
import com.eattogether.utility.Paging;

public class NoticeDao extends SuperDao{
	
	public int insertData(Notice bean) {
		// no 컬럼은 시퀀스가 알아서 처리합니다.				
		String sql = " insert into Notice(noti_no, mem_no, noti_header, noti_content, noti_regdate)" ;
		sql += " values(seq_Notice.nextval, default, ?, ?, sysdate)" ;
		
		PreparedStatement pstmt = null ;
		int cnt = -1 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getNoti_header());
			pstmt.setString(2, bean.getNoti_content());
			
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
	
	public int updateData(Notice bean) {
		System.out.println("문의사항 수정 페이지: ");
		System.out.println(bean);
		
		String sql = " update Notice set noti_header=?, noti_content=?, noti_regdate=sysdate ";
		sql += " where noti_no= ? ";
		
		PreparedStatement pstmt = null ;
		int cnt = -1 ;
		
		try {
			super.conn = super.getConnection() ;  
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			
			pstmt.setString(1, bean.getNoti_header());
			pstmt.setString(2, bean.getNoti_content());
			pstmt.setInt(3, bean.getNoti_no());
			
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

	public List<Notice> getDataList(Paging paging) {
		String sql = " select noti_no, mem_no, noti_header, noti_content, noti_regdate ";
		sql += " from (select rank() over(order by noti_no desc) as ranking, noti_no, mem_no, noti_header, noti_content, noti_regdate ";
		sql += " from Notice " ;
		
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
		
		List<Notice> dataList = new ArrayList<Notice>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());			
			
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Notice bean = this.resultSet2Bean(rs) ;
				
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
	
	private Notice resultSet2Bean(ResultSet rs) {
		try {
			Notice bean = new Notice() ;			
			bean.setNoti_no(rs.getInt("noti_no"));
			bean.setMem_no(rs.getInt("mem_no"));
			bean.setNoti_header(rs.getString("noti_header"));
			bean.setNoti_content(rs.getString("noti_content"));
			bean.setNoti_regdate(String.valueOf(rs.getDate("noti_regdate")));	
			return bean ;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null ;
		}
	}
	
	public NoticeDao() {
		super();
	}

	public Notice getDataBean(int noti_no) {
		String sql = " select * from Notice";
		sql += " where noti_no= ? ";

		PreparedStatement pstmt = null ; 
		ResultSet rs = null ;		
		Notice bean = null ;
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, noti_no); 
			rs = pstmt.executeQuery() ;
			if(rs.next()) {				
				bean = this.resultSet2Bean(rs) ;
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
		return bean ;
	}

	public int deleteData(int noti_no) {

String sql = " delete from  Notice where noti_no = ? " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1,noti_no);
			
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
