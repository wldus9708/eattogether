package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eattogether.model.bean.Recipe;
import com.eattogether.utility.MyUtility;
import com.eattogether.utility.Paging;

public class RecipeDao extends SuperDao{
	public Recipe getDataBean(int rec_no) {
		String sql ="select * from recipe";
		sql += " where rec_no = ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Recipe bean = null;
		
		super.conn = super.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rec_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean = this.resultSet2Bean(rs);
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
		System.out.println("bean 데이터 조회 결과 : ");
		System.out.println(bean);
		
		return bean;
	}
	
	public List<Recipe> getDataList(Paging paging){
 		String sql = "select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from recipe ";
		
		String mode = paging.getMode();
		String keyword = paging.getKeyword();
		
		if(mode == null|| mode.equals("all") || mode.equals("null")|| mode.equals("")) {
		}else {//전체 모드가 아니면
			sql += " where "+mode+" like '%"+keyword+"%'";
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
			
			//요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {rs.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return dataList;
	}
	
	public List<Recipe> getDataList(int beginRow, int endRow){
		String sql = "select rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from (select rank() over(order by rec_regdate desc) as ranking, rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_photo, rec_hit, rec_popularity, rec_bookmark, rec_material";
		sql += " from recipe) where ranking between ? and ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Recipe> dataList = new ArrayList<Recipe>();
		
		super.conn = super.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 22);
			
			rs = pstmt.executeQuery();
			
			//요소들 읽어서 컬렉션에 담습니다.
			while(rs.next()) {
				Recipe bean = this.resultSet2Bean(rs);
				dataList.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {rs.close();}
				super.closeConnection();
			}catch(Exception e2) {
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
			bean.setMem_no(rs.getInt("mem_no"));
			bean.setCat_no(rs.getInt("cat_no"));
			bean.setRec_header(rs.getString("rec_header"));
			bean.setRec_content(rs.getString("rec_content"));
			bean.setRec_regdate(String.valueOf(rs.getDate("rec_regdate")));
			bean.setRec_photo(rs.getString("rec_photo"));		
			bean.setRec_hit(rs.getInt("rec_hit"));
			bean.setRec_popularity(rs.getInt("rec_popularity"));
			bean.setRec_bookmark(rs.getString("rec_bookmark"));
			bean.setRec_material(rs.getString("rec_material"));
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
	}

	public int insertData(Recipe bean) {
		System.out.println(bean);
		
		String sql=" insert into recipe(rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_hit, rec_popularity, rec_bookmark, rec_material)";
		sql += " values(seqproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int cnt = -999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			//치환은 실행 앞에서 하는거다!!
			pstmt.setInt(1, bean.getRec_no());
			pstmt.setInt(2, bean.getMem_no());
			pstmt.setInt(3, bean.getCat_no());
			pstmt.setString(4, bean.getRec_header());
			pstmt.setString(5, bean.getRec_content());
			pstmt.setString(6, bean.getRec_regdate());
			pstmt.setInt(7, bean.getRec_hit());
			pstmt.setInt(8, bean.getRec_popularity());
			pstmt.setString(9, bean.getRec_bookmark());
			pstmt.setString(10, bean.getRec_material());
			
			//여기가 실행
			cnt = pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}

	public int updateData(Recipe bean) {
		System.out.println(bean);
		String sql=" update into recipe(rec_no, mem_no, cat_no, rec_header, rec_content, rec_regdate, rec_hit, rec_popularity, rec_bookmark, rec_material)";
		sql += " values(seqproduct.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int cnt = -9999999;
		
		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, bean.getRec_no());
			pstmt.setInt(2, bean.getMem_no());
			pstmt.setInt(3, bean.getCat_no());
			pstmt.setString(4, bean.getRec_header());
			pstmt.setString(5, bean.getRec_content());
			pstmt.setString(6, bean.getRec_regdate());
			pstmt.setInt(7, bean.getRec_hit());
			pstmt.setInt(8, bean.getRec_popularity());
			pstmt.setString(9, bean.getRec_bookmark());
			pstmt.setString(10, bean.getRec_material());
			
			cnt = pstmt.executeUpdate();
			conn.commit();
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			}catch(Exception e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteData(int rec_no) {
		//상품은 주문 상세 테이블과 참조 무결성 제약 조건 set null을 가지고 있습니다.
		//상품 삭제시 주문 상세 테이블의 remark컬럼을 갱신하도록 합니다.
		
		//no 컬럼은 시퀀스가 알아서 처리합니다.		
		String sql = " ";
		PreparedStatement pstmt = null;
		int cnt = -9999999;
		
		try {
			super.conn = super.getConnection();
			//자동 커밋 기능을 비활성화 시킵니다.
			//실행이 성공적으로 완료된 이후 commit() 메소드를 명시해 줍니다.
			//conn.setAutoCommit(false); dml이 없으니까 
			
			Recipe bean = this.getDataBean(rec_no);
			String message = MyUtility.getCurrentTime()+bean.getRec_no() + "(상품 번호 : "+ rec_no + "번)이 삭제 되었습니다.";
			
			//getDataBean() 메소드가 리턴된 다음에 conn이 null이 됩니다. 
			//그래서, 다음과 같이 null체크를 해줘야 합니다.
			//다음 항목도 공부하세요 : Connection Pooling 기법(수영장에 커넥션을 다 넣어놓고 사용자에게 하나씩 꺼내주는것)
			/*
			 * if(conn == null) { super.conn = super.getConnection();
			 * conn.setAutoCommit(false); }
			 */
			super.conn = super.getConnection();
			conn.setAutoCommit(false);
			
			//두개의 dml문장이 성공시 같이 성공되어야 하고 실패시 같이 실패되어야 합니다. 즉 트랜잭션이라고 볼수있습니다.
			//step01 : 주문 상세 테이블의 비고 컬럼에 삭제된 히스토리를 남깁니다.
			sql = " update orderdetails set remark = ? where pnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,message);
			pstmt.setInt(2,rec_no);
			cnt = pstmt.executeUpdate();
			if(pstmt != null) {pstmt.close();}
			
			//step02 : 상품 테이블에서 해당 상품 번호를 삭제합니다.
			sql = " delete from products where pnum = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,rec_no);
			cnt = pstmt.executeUpdate();
			
			//cnt = super.updateRemark("orderdetails", message);
			
			conn.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				super.closeConnection();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
}
