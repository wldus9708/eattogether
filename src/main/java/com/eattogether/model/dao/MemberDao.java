package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Member;
import com.eattogether.model.bean.combo02;
import com.eattogether.utility.Paging;

public class MemberDao extends SuperDao {
	public static final int USABLE_ID = 1;
	public static final int UNUSABLE_ID = 2;
	public static final int USABLE_PHONE = 1;
	public static final int UNUSABLE_PHONE = 2;
	public static final int USABLE_ALIAS = 1;
	public static final int UNUSABLE_ALIAS = 2;
	
	
	public Member getData5(String alias) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT *";
	    sql += " FROM members where mem_alias =?";
	    Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, alias);
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
	
	public Member getData5(int rec_no) {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT m.*";
	    sql += " FROM recipe r";
	    sql += " JOIN members m ON r.mem_id = m.mem_id";
	    sql += " where r.rec_no =?";
	    Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rec_no);
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
	
	public List<combo02> getDataList4(int rec_no) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT m.mem_id, r.rec_no, r.rec_photo";
	    sql += " FROM recipe r";
	    sql += " JOIN members m ON r.mem_id = m.mem_id";
	    sql += " where r.rec_no =?";
	    List<combo02> dataList = new ArrayList<>();
	    super.conn = super.getConnection();

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, rec_no);
	        rs = pstmt.executeQuery();

	        // 요소들 읽어서 컬렉션에 담습니다.
	        while (rs.next()) {
	            dataList.add(this.makeBeanCombo01(rs));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstmt != null) {
	                pstmt.close(); // pstmt로 수정
	            }
	            super.closeConnection();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	    return dataList;
	}
	
	
	public List<combo02> getDataList1(String id) {
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String sql = "SELECT m.mem_id, r.rec_no, r.rec_photo";
	    sql += " FROM recipe r";
	    sql += " JOIN members m ON r.mem_id = m.mem_id";
	    sql += " where r.mem_id =?";
	    List<combo02> dataList = new ArrayList<>();
	    super.conn = super.getConnection();

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();

	        // 요소들 읽어서 컬렉션에 담습니다.
	        while (rs.next()) {
	            dataList.add(this.makeBeanCombo01(rs));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (pstmt != null) {
	                pstmt.close(); // pstmt로 수정
	            }
	            super.closeConnection();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	    return dataList;
	}
	
	private combo02 makeBeanCombo01(ResultSet rs) {
	    combo02 bean = new combo02();

	    try {
	        bean.setId(rs.getString("mem_id")); // "id"를 "mem_id"로 수정
	        bean.setRec_no(rs.getInt("rec_no"));
	        bean.setRec_photo(rs.getString("rec_photo"));

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return bean;
	}

	public List<Member> getDataList(Paging paging) {
		String sql = " select mem_id, mem_name, mem_alias, mem_password, mem_social_key, mem_social_host,mem_birth, mem_phone, mem_taste , mem_picture, mem_flag";
		sql += " from (select rank() over(order by mem_id desc) as ranking, mem_id, mem_name, mem_alias, mem_password, mem_social_key, mem_social_host, mem_birth, mem_phone, mem_taste , mem_picture, mem_flag ";
		sql += " from Members ";

		String mode = paging.getMode();
		String keyword = paging.getKeyword();

		if (mode == null || mode.equals("all") || mode.equals("null") || mode.equals("")) {
		} else {
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += " )";
		sql += " where ranking between ? and ? ";

		System.out.println("sql 구문:\n" + sql);

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<Member> dataList = new ArrayList<Member>();

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member bean = this.resultSet2Bean(rs);

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
					pstmt.close();
				}
				super.closeConnection();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dataList;
	}

	public Member getDataByIdAndPassword(String id, String password) {

		String sql = "select * from members where mem_id = ? and mem_password = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
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
		System.out.println(bean);
		return bean;
	}

	public int insertData(Member bean) {
		System.out.println(bean);
		String sql = "insert into members(mem_id,mem_name,mem_alias,mem_password,mem_birth,mem_phone,mem_taste,mem_flag)";
		sql += " values(?,?,?,?,?,?,?,default)";

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
	public int getDataByIdChk(String id) {
		String sql = "select count(*) from members ";
		sql += " where mem_id = ? and mem_social_key is null ";
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
	
	public int getDataByKakaoIdChk(String id) {
		String sql = "select count(*) from members ";
		sql += " where mem_id = ? and mem_social_key is not null";
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
		System.out.println("카카오아이디 중복확인 결과([1]사용가능,[2]사용불가능 :  " + result + " , 아이디 : " + id);
		return result;
	}
	
	public int getDataByAlias(String alias) {
		String sql = "select count(*) from members ";
		sql += " where mem_alias = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, alias);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					result = MemberDao.UNUSABLE_ALIAS;
				} else {
					result = MemberDao.USABLE_ALIAS;
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
		System.out.println("닉네임 중복확인 결과([1]사용가능,[2]사용불가능 :  " + result + " , 닉네임 : " + alias);
		return result;
	}
	
	public int getDataByPhone(String phone) {
		String sql = "select count(*) from members ";
		sql += " where mem_phone = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int result = 0;
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, phone);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					result = MemberDao.UNUSABLE_PHONE;
				} else {
					result = MemberDao.USABLE_PHONE;
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
		System.out.println("전화번호 중복확인 결과([1]사용가능,[2]사용불가능 :  " + result + " , 전화번호 : " + phone);
		return result;
	}
	
	private Member resultSet2Bean(ResultSet rs) {
		try {

			Member bean = new Member();
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
		String sql = " update members set mem_alias = ?,mem_password = ?,mem_phone=?,mem_taste=?,mem_picture=?, mem_birth=?";
        sql += " where mem_id =?";
        PreparedStatement pstmt = null;
		int cnt = -9999999;
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getAlias());
            pstmt.setString(2, bean.getPassword());
            pstmt.setString(3, bean.getPhone());
            pstmt.setString(4, bean.getTaste());
            pstmt.setString(5, bean.getPicture());
            pstmt.setString(6, bean.getBirth());
            pstmt.setString(7, bean.getId());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
			conn.setAutoCommit(false);

		} catch (Exception e) {
			e.printStackTrace();
			try {
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

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member bean = this.resultSet2Bean(rs);
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
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return dataList;
	}
	public List<Member> getDataList(String id){
		String sql = "select * from members where mem_id=?";
		PreparedStatement pstmt = null ; // 문장 객체
		ResultSet rs = null ;
		
		List<Member> dataList = new ArrayList<Member>();
		
		super.conn = super.getConnection() ;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
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

	public int deleteData(String id) {
		
		String sql = "" ;		
		PreparedStatement pstmt = null ;
		int cnt = -9999999 ;
		
		try {
			
			super.conn = super.getConnection() ;
			conn.setAutoCommit(false); // dml과 관련이 있습니다.			
			// 다음 항목도 공부하세요 : Connection Pooling 기법

			// step02 : 상품 테이블에서 해당 상품 번호를 삭제합니다.
			sql = " delete from members where mem_id = ? " ;
			pstmt = conn.prepareStatement(sql) ;			
			pstmt.setString(1, id);				
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
	

	public String getDataByNameAndPhone(String name, String phone) {

		String sql = "select * from members where mem_name = ? and mem_phone = ? and mem_social_key is null";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String findId = null;
		System.out.println("입력한 이름: " + name + " / 입력한 전화번호 : " + phone);
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findId = rs.getString("mem_id");
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
		System.out.println("아이디 찾기한 아이디 : " + findId);
		return findId;
	}
	
	public Member getDataByIdAndPhoneAndName(String id, String phone, String name) {

		String sql = "select * from members where mem_id = ? and mem_phone = ? and mem_name = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;
		System.out.println("입력한 이름: " + id + " / 입력한 전화번호 : " + phone + "입력한 이름 : " + name);
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			pstmt.setString(3, name);
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
	
	public boolean tempPassword(String id, String tempPassword) {
		String sql = " update members set mem_password = ? where mem_id = ?";
        PreparedStatement pstmt = null;
        boolean success = false;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, tempPassword);
            pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			 success = cnt > 0;
			conn.commit();
			conn.setAutoCommit(false);

		} catch (Exception e) {
			e.printStackTrace();
			try {
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
		System.out.println("임시 비밀번호로 업데이트 [true] : 성공, [false]: 실패,  결과: " + success);
		return success;
	}
	public int insertKakaoData(Member bean) {
		System.out.println(bean);
		String sql = "insert into members(mem_id,mem_name,mem_password,mem_social_key,mem_social_host,mem_flag)";
		sql += " values(?,?,?,?,'KAKAO',3)";

		PreparedStatement pstmt = null;
		int cnt = -1;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getSocial_key());
		

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


}
