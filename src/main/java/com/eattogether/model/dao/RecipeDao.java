package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Recipe;
import com.eattogether.model.bean.Star;
import com.eattogether.model.bean.combo01;
import com.eattogether.utility.Paging;

public class RecipeDao extends SuperDao {
	
	public void updateReadhit(int rec_no) {
		String sql = " update recipe set rec_hit = rec_hit + 1 where rec_no = ? ";
		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rec_no);
			cnt = pstmt.executeUpdate();
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
				if (pstmt != null) {
					pstmt.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public Recipe getDataBean2(String mem_id) {
		String sql = "select * from members";
		sql += " where mem_id = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe bean = null;

		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mem_id);

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

	public Recipe getDataBean(int rec_no) {
		String sql = "select * from recipe";
		sql += " where rec_no = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe bean = null;

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
		System.out.println("bean 데이터 조회 결과 : ");
		System.out.println(bean);

		return bean;
	}
	/*public List<Recipe> getDataList(Paging paging) {
		String sql = "select rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += " from (select rank() over(order by rec_regdate desc, rec_no desc) as ranking, rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += " from recipe ";

		String mode = paging.getMode();
		String keyword = paging.getKeyword();

		if (mode == null || mode.equals("all") || mode.equals("null") || mode.equals("")) {
		} else {// 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
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
*/
	public List<combo01> getDataList(Paging paging) {
		String sql = "SELECT r.rec_no, r.mem_id, r.cat_no, r.rec_header, r.rec_regdate, r.rec_photo, r.rec_hit, r.rec_popularity, r.rec_bookmark, r.rec_material";
		sql += " , r.rec_content01, r.rec_content02, r.rec_content03, r.rec_content04, r.rec_content05, r.rec_content06, r.rec_content07, r.rec_content08, r.rec_content09, r.rec_content10";
		sql += " , m.mem_name, m.mem_alias, m.mem_birth, m.mem_phone, m.mem_taste, m.mem_picture";
		sql += " FROM ( SELECT rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += "  , RANK() OVER (ORDER BY rec_regdate DESC, rec_no DESC) AS ranking";
		sql += "  FROM recipe r ";
		
		String mode = paging.getMode();
		String keyword = paging.getKeyword();

		if (mode == null || mode.equals("all") || mode.equals("null") || mode.equals("")) {
		} else {// 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += ")r";
		sql += " JOIN members m ON r.mem_id = m.mem_id";
		sql += " where ranking between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<combo01> dataList = new ArrayList<combo01>();
		super.conn = super.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());

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
					rs.close();
				}
				super.closeConnection();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dataList;
	}
	
	public List<combo01> getDataList2(Paging paging) {
		String sql = "SELECT r.rec_no, r.mem_id, r.cat_no, r.rec_header, r.rec_regdate, r.rec_photo, r.rec_hit, r.rec_popularity, r.rec_bookmark, r.rec_material";
		sql += " , r.rec_content01, r.rec_content02, r.rec_content03, r.rec_content04, r.rec_content05, r.rec_content06, r.rec_content07, r.rec_content08, r.rec_content09, r.rec_content10";
		sql += " , m.mem_name, m.mem_alias, m.mem_birth, m.mem_phone, m.mem_taste, m.mem_picture";
		sql += " FROM ( SELECT rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += "  , RANK() OVER (ORDER BY rec_hit DESC, rec_no DESC) AS ranking";
		sql += "  FROM recipe r ";
		
		String mode = paging.getMode();
		String keyword = paging.getKeyword();

		if (mode == null || mode.equals("all") || mode.equals("null") || mode.equals("")) {
		} else {// 전체 모드가 아니면
			sql += " where " + mode + " like '%" + keyword + "%'";
		}

		sql += ")r";
		sql += " JOIN members m ON r.mem_id = m.mem_id";
		sql += " where ranking between ? and ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<combo01> dataList2 = new ArrayList<combo01>();
		super.conn = super.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paging.getBeginRow());
			pstmt.setInt(2, paging.getEndRow());

			rs = pstmt.executeQuery();

			// 요소들 읽어서 컬렉션에 담습니다.
			while (rs.next()) {
				dataList2.add(this.makeBeanCombo01(rs));
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
		return dataList2;
	}
	
	private combo01 makeBeanCombo01(ResultSet rs) {
		combo01 bean = new combo01();
		
		try {
			bean.setName(rs.getString("mem_name"));
			bean.setAlias(rs.getString("mem_alias"));			
			bean.setTaste(rs.getString("mem_taste"));		
			bean.setRec_no(rs.getInt("rec_no"));  
			bean.setMem_id(rs.getString("mem_id"));  
			bean.setCat_no(rs.getInt("cat_no"));  
			bean.setRec_header(rs.getString("rec_header"));  
			bean.setRec_regdate(rs.getString("rec_regdate"));  
			bean.setRec_photo(rs.getString("rec_photo"));  
			bean.setRec_hit(rs.getInt("rec_hit"));  
			bean.setRec_popularity(rs.getInt("rec_popularity"));  
			bean.setRec_bookmark(rs.getString("rec_bookmark"));  
			bean.setRec_material(rs.getString("rec_material"));  
			bean.setRec_content01(rs.getString("rec_content01"));  
			bean.setRec_content02(rs.getString("rec_content02"));  
			bean.setRec_content03(rs.getString("rec_content03"));  
			bean.setRec_content04(rs.getString("rec_content04"));  
			bean.setRec_content05(rs.getString("rec_content05")); 
			bean.setRec_content06(rs.getString("rec_content06"));  
			bean.setRec_content07(rs.getString("rec_content07"));  
			bean.setRec_content08(rs.getString("rec_content08"));  
			bean.setRec_content09(rs.getString("rec_content09"));  
			bean.setRec_content10(rs.getString("rec_content10"));  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public List<Recipe> getDataList(int beginRow, int endRow) {
		String sql = "select rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_id, cat_no, rec_header, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10";
		sql += " from recipe) where ranking between ? and ? ";

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
			bean.setRec_header(rs.getString("rec_header"));
			bean.setRec_regdate(String.valueOf(rs.getDate("rec_regdate")));
			bean.setRec_photo(rs.getString("rec_photo"));
			bean.setRec_hit(rs.getInt("rec_hit"));
			bean.setRec_popularity(rs.getInt("rec_popularity"));
			bean.setRec_bookmark(rs.getString("rec_bookmark"));
			bean.setRec_material(rs.getString("rec_material"));

			// rec_contents 설정
			List<String> recContents = new ArrayList<>();
			for (int i = 1; i <= 10; i++) {
				String content = rs.getString("rec_content" + String.format("%02d", i));
				if (content != null && !content.isEmpty()) {
					recContents.add(content);
				}
			}
			bean.setRec_contents(recContents);

			return bean;
		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}
	}

	public int insertData(Recipe bean) {
		System.out.println(bean);

		String sql = " insert into recipe(rec_no, mem_id, rec_header, cat_no, rec_regdate, rec_photo, rec_material ";
		sql += " , rec_content01, rec_content02, rec_content03, rec_content04, rec_content05, rec_content06, rec_content07, rec_content08, rec_content09, rec_content10)";
		sql += " values(seq_recipe.nextval, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			// 치환은 실행 앞에서 하는거다!!
			pstmt.setString(1, bean.getMem_id());
			pstmt.setString(2, bean.getRec_header());
			pstmt.setInt(3, bean.getCat_no());
			pstmt.setString(4, bean.getRec_photo());
			pstmt.setString(5, bean.getRec_material());
			pstmt.setString(6, bean.getRec_content01());

			pstmt.setString(7, bean.getRec_content02());
			pstmt.setString(8, bean.getRec_content03());
			pstmt.setString(9, bean.getRec_content04());
			pstmt.setString(10, bean.getRec_content05());
			pstmt.setString(11, bean.getRec_content06());
			pstmt.setString(12, bean.getRec_content07());
			pstmt.setString(13, bean.getRec_content08());
			pstmt.setString(14, bean.getRec_content09());
			pstmt.setString(15, bean.getRec_content10());

			// 여기가 실행
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

	public int updateData(Recipe bean) {
		System.out.println(bean);
		String sql = "UPDATE recipe SET mem_id=?, cat_no=?, rec_header=?, rec_photo=?, rec_regdate=sysdate, rec_material=?, ";
		sql += "rec_content01=?, rec_content02=?, rec_content03=?, rec_content04=?, rec_content05=?, rec_content06=?, ";
		sql += "rec_content07=?, rec_content08=?, rec_content09=?, rec_content10=? WHERE rec_no=?";

		PreparedStatement pstmt = null;
		int cnt = -9999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getMem_id());
			pstmt.setInt(2, bean.getCat_no());
			pstmt.setString(3, bean.getRec_header());
			pstmt.setString(4, bean.getRec_photo());
			pstmt.setString(5, bean.getRec_material());
			pstmt.setString(6, bean.getRec_content01());
			pstmt.setString(7, bean.getRec_content02());
			pstmt.setString(8, bean.getRec_content03());
			pstmt.setString(9, bean.getRec_content04());
			pstmt.setString(10, bean.getRec_content05());
			pstmt.setString(11, bean.getRec_content06());
			pstmt.setString(12, bean.getRec_content07());
			pstmt.setString(13, bean.getRec_content08());
			pstmt.setString(14, bean.getRec_content09());
			pstmt.setString(15, bean.getRec_content10());
			pstmt.setInt(16, bean.getRec_no());

			cnt = pstmt.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e1) {
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

	public int deleteData(int rec_no) {

		// 상품은 주문 상세 테이블과 참조 무결성 제약 조건 set null을 가지고 있습니다.
		// 상품 삭제시 주문 상세 테이블의 remark 컬럼을 갱신하도록 합니다.
		String sql = "delete from recipe where rec_no=? ";
		PreparedStatement pstmt = null;
		int cnt = -1;

		try {
			super.conn = super.getConnection();

			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rec_no);

			cnt = pstmt.executeUpdate();
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
	public int insertData1(Recipe bean,String id) {
		String sql = " insert into stars(rec_no, mem_id,  rec_photo )";
		sql += " values(?, ?, ?)";

		PreparedStatement pstmt = null;
		int cnt = -999999;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			// 치환은 실행 앞에서 하는거다!!
			pstmt.setInt(1, bean.getRec_no());
			pstmt.setString(2, id);
			pstmt.setString(3, bean.getRec_photo());		

			// 여기가 실행
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
	public int deleteData1(int rec_no) {

		

		// 상품은 주문 상세 테이블과 참조 무결성 제약 조건 set null을 가지고 있습니다.
		// 상품 삭제시 주문 상세 테이블의 remark 컬럼을 갱신하도록 합니다.
		String sql = "delete from stars where rec_no=? ";
		PreparedStatement pstmt = null;
		int cnt = -1;

		try {
			super.conn = super.getConnection();

			// 자동 커밋 기능을 비활성화 시킵니다.
			// 실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다.
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rec_no);

			cnt = pstmt.executeUpdate();
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
	public List<Star> getDataBean1(String id) {
		String sql = "select * from stars";
		sql += " where mem_id = ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe bean = null;
		List<Star> dataList = new ArrayList<Star>();
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dataList.add(this.makeBeanstars(rs));
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
	
	public Star getDataBean0(int rec_no) {
		String sql = "select * from stars";
		sql += " where rec_no = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Star bean = null;
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rec_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = this.makeBeanstars(rs);
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


	private Star makeBeanstars(ResultSet rs) {
		Star bean = new Star();
		
		try {	
			bean.setRec_no(rs.getInt("rec_no"));  
			bean.setMem_id(rs.getString("mem_id"));  
			bean.setRec_photo(rs.getString("rec_photo"));  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public combo01 getDateBean3(int rec_no) {
		String sql = "SELECT r.rec_no, r.mem_id, r.cat_no, r.rec_header, r.rec_regdate, r.rec_photo, r.rec_hit, r.rec_popularity, r.rec_bookmark,";
		sql+= " r.rec_material, r.rec_content01, r.rec_content02, r.rec_content03, r.rec_content04, r.rec_content05, r.rec_content06,";
		sql+= " r.rec_content07, r.rec_content08, r.rec_content09, r.rec_content10, m.mem_name, m.mem_alias, m.mem_birth, m.mem_phone,";
		sql+= " m.mem_taste, m.mem_picture";
		sql+= " FROM recipe r";
		sql+= " JOIN members m ON r.mem_id = m.mem_id";				
		sql += " where rec_no = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		combo01 bean = null;
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, rec_no);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean=this.makeBeanCombo01(rs);
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
}
