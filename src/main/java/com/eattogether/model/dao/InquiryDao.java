package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Inquiry;
import com.eattogether.model.bean.Recipe;
import com.eattogether.utility.Paging;

public class InquiryDao extends SuperDao{
	public InquiryDao() {
		super();
	}

	public List<Inquiry> getDataList(Paging paging) {
		String sql = " select inq_no, mem_id, inq_content, inq_regdate ,inq_reply, inq_groupno, inq_orderno";
		sql += " from (select rank() over(order by  inq_groupno asc,inq_orderno asc) as ranking, inq_no, mem_id, inq_content, inq_regdate,inq_reply, inq_groupno, inq_orderno ";
		sql += " from Inquiry " ;
		
		String mode = paging.getMode() ;
		String keyword = paging.getKeyword() ;
		
		if(mode==null || mode.equals("all") || mode.equals("null") || mode.equals("")) {			
		}else { // 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'" ; 
		}
		
		sql += " )";
		sql += " where ranking between ? and ?  AND inq_reply IS NULL";
		
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
				System.out.println("확인"+bean);
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
			bean.setInq_reply(rs.getString("inq_reply"));
			bean.setInq_groupno(rs.getInt("inq_groupno"));
			bean.setInq_orderno(rs.getInt("inq_orderno"));
			return bean;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertData(Inquiry bean) {
		String sql = " insert into inquiry(inq_no, mem_id, inq_content, inq_regdate, inq_reply, inq_groupno, inq_orderno)" ;
		sql += " values(seq_inquiry.nextval, ?, ?, sysdate,? , seq_inquiry.currval , default)" ;
		
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
			pstmt.setString(3, bean.getInq_reply());
			
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
	public Inquiry getdatareply(String i){
		
		String sql=" select * from inquiry";
		sql+= " where inq_groupno=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Inquiry bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, i);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = this.resultSet2Bean(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("bean 데이터 조회 결과 : ");
		System.out.println(bean);

		return bean;
	}
	public Integer getReplyCount(Integer inq_groupno) {
		System.out.println("검색할 그룹 번호 : " + inq_groupno);
		
		
		String sql = " select count(*) as cnt from inquiry " ;
		sql += " where inq_groupno = ? " ;
		
		int cnt = -1 ; // 데이터 행 개수
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		super.conn = super.getConnection() ;
		
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, inq_groupno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt") ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt ;
	}

	public List<Inquiry> getReply() {
		
		String sql = " select * from inquiry  where inq_reply is not null " ;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> dataList = new ArrayList<Inquiry>();
		
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);


			rs = pstmt.executeQuery();

			while(rs.next()) {	
				Inquiry bean =new Inquiry();
				bean.setInq_no(rs.getInt("inq_no"));
				bean.setMem_id(rs.getString("mem_id"));
				bean.setInq_content(rs.getString("inq_content"));
				bean.setInq_regdate(String.valueOf(rs.getDate("inq_regdate")));
				bean.setInq_reply(rs.getString("inq_reply"));
				bean.setInq_groupno(rs.getInt("inq_groupno"));
				bean.setInq_orderno(rs.getInt("inq_orderno"));
				System.out.println("확인"+bean);
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
	
	public int replyData(Inquiry bean, Integer inq_orderno) {
		System.out.println("답글 달기 ");
		System.out.println(bean);		
		
		String sql = "" ;
		PreparedStatement pstmt = null ;
		int cnt = - 1 ;
		
		super.conn = super.getConnection() ;
		
		try {
			// step 01 : 동일한 그룹 번호에 대하여 orderno 컬럼의 숫자를 1씩 증가 시켜 주어야 합니다.
			sql = " update inquiry set inq_orderno = inq_orderno + 1 " ;
			sql += " where inq_groupno = ? and inq_orderno > ? " ;			
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, bean.getInq_groupno());
			pstmt.setInt(2, inq_orderno);
			cnt = pstmt.executeUpdate() ;
			
			if(pstmt!=null) {pstmt.close();}
			
			// step 02 : 답글(bean) 객체 정보를 이용하여 데이터 베이스에 추가합니다.
			sql = " INSERT INTO inquiry(inq_no, mem_id, inq_content, inq_regdate, inq_reply, inq_groupno, inq_orderno) " ;
			sql +=" VALUES(seq_inquiry.nextval, ?, ?, SYSDATE, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getMem_id());
			pstmt.setString(2, bean.getInq_content());
			pstmt.setString(3, bean.getInq_reply());
			pstmt.setInt(4, bean.getInq_groupno());
			pstmt.setInt(5, bean.getInq_orderno());
			
			cnt = pstmt.executeUpdate() ;
			conn.commit();
			
		} catch (SQLException e) {			
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if(pstmt!=null) {pstmt.close();}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
}
