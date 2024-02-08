package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Manger;
import com.eattogether.model.bean.Member;
import com.eattogether.utility.Paging;

public class MemberDao extends SuperDao {
	// 아이디 중복확인에서 사용
	public static final int USABLE_ID = 1; // 사용가능
	public static final int UNUSABLE_ID = 2; // 사용 불가능
	
	public List<Member> getDataList(Paging paging) {
		String sql = " select mem_no, mem_id, mem_name, mem_alias, mem_password, mem_social_key, mem_social_host,mem_birth, mem_phone, mem_taste , mem_picture, mem_flag";
		sql += " from (select rank() over(order by mem_no desc) as ranking, mem_no, mem_id, mem_name, mem_alias, mem_password, mem_social_key, mem_social_host, mem_birth, mem_phone, mem_taste , mem_picture, mem_flag ";
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
		
		List<Member> dataList = new ArrayList<Member>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());			
			
			rs = pstmt.executeQuery() ;
			
			// 요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {				
				Member bean = this.resultSet2Bean(rs) ;
				
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

	public Member getDataByIdAndPassword(String id, String password) {

		// 아이디와 비밀번호를 이용하여 해당 회원이 존재하는지 확인합니다.
		String sql = "select * from members where mem_id = ? and mem_password = ?";
		PreparedStatement pstmt = null; // 문장 객체
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
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

		return bean;
	}

	public int insertData(Member bean) { // 회원 가입 insert
		System.out.println(bean);
		String sql = "insert into members(mem_no,mem_id,mem_name,mem_alias,mem_password,mem_birth,mem_phone,mem_taste,mem_flag)";
		sql += " values(seq_member.nextval,?,?,?,?,?,?,?,default)";

		PreparedStatement pstmt = null;
		int cnt = -1;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getAlias());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6, bean.getPhone());
			pstmt.setString(7, bean.getTaste());

			cnt = pstmt.executeUpdate();
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;
	}

	public int getDataById(String id) {
		// 아이디가 있는지 확인하기
		String sql = "select count(*) from members ";
		sql += " where mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					result = MemberDao.UNUSABLE_ID;
				} else {
					result = MemberDao.USABLE_ID;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("아이디 중복확인 결과([1]사용가능,[2]사용불가능 :  " + result + " , 아이디 : " + id);
		return result;
	}

	private Member resultSet2Bean(ResultSet rs) {
		try {

			Member bean = new Member();
			bean.setNo(Integer.parseInt(rs.getString("mem_no")));
			bean.setId(rs.getString("mem_id"));
			bean.setName(rs.getString("mem_name"));
			bean.setAlias(rs.getString("mem_alias"));
			bean.setPassword(rs.getString("mem_password"));
			bean.setSocial_key(rs.getString("mem_social_key"));
			bean.setSocial_host(rs.getString("mem_social_host"));
			bean.setBirth(String.valueOf(rs.getDate("mem_birth")));
			bean.setPhone(rs.getString("mem_phone"));
			bean.setTaste(rs.getString("mem_taste"));
			bean.setPicture(rs.getString("mem_picture"));
			bean.setFlag(rs.getString("mem_flag"));

			return bean;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Member getDataBean(String id) {
		String sql = " select * from members ";
		sql += " where mem_id = ?";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Member bean = null;
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
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
		return bean;
	}

	public int updateData(Member bean) {
		String sql = " update members set mem_id=?,mem_name = ?,mem_password = ?,mem_alias = ?,mem_phone=?,mem_taste=?";
		sql += " where mem_no =?";
		PreparedStatement pstmt = null;
		int cnt = -9999999;
		try {
			super.conn = super.getConnection();
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 후 commit() 메소드를 명시해줍니다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getAlias());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getTaste());
			pstmt.setInt(7, bean.getNo());
			cnt = pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(false);

		} catch (Exception e) {
			e.printStackTrace();
			try {
				// 예외가 발생한 경우 롤백 수행
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;
	}

	public List<Member> getDataList() {
		String sql = "select * from members";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> dataList = new ArrayList<Member>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			// 테이블의 몇행몇열이 여기에 들어있습니다.
			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				Member bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {// 200p 5번
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

		return dataList;
	}

	public int deleteData(int no) {
String sql = " delete from  Members where mem_no = ? " ;
		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			super.conn = super.getConnection() ;
			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다. 
			conn.setAutoCommit(false);			
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1,no);
			
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
