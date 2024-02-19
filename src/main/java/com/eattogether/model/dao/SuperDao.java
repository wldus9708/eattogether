package com.eattogether.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SuperDao {
	
	public final int getTotalRecordCount(String tableName, String mode, String keyword) {
		System.out.print("검색할 필드 이름 : " + mode);
		System.out.println(", 검색할 키워드 : " + keyword);
		
		//제시한 tableName이라는 테이블의 총 행수를 구해줍니다. 이부분은 필드검색이랑 관계가 있습니다!
		String sql = " select count(*) as cnt from " + tableName + " ";
		if(mode == null|| mode.equals("all") || mode.equals("null")|| mode.equals("")) {
			if(keyword == null|| keyword.equals("all") || keyword.equals("null")|| keyword.equals("")) {
				
			}else {
				if(tableName=="recipe") {
				sql += " where(mem_id LIKE '%" + keyword + "%' OR rec_header LIKE '%" + keyword + "%' OR rec_content01 LIKE '%" + keyword + "%' OR rec_content02 LIKE '%" + keyword + "%' OR rec_content03 LIKE '%" + keyword + "%' OR rec_content04 LIKE '%" + keyword + "%'";
				sql += " OR rec_content05 LIKE '%" + keyword + "%' OR rec_content06 LIKE '%" + keyword + "%' OR rec_content07 LIKE '%" + keyword + "%' OR rec_content08 LIKE '%" + keyword + "%' OR rec_content09 LIKE '%" + keyword + "%' OR rec_content10 LIKE '%" + keyword + "%')";
			}	
			}
		}
		
		else {//전체 모드가 아니면
			sql += " where "+mode+" like '%"+keyword+"%'";
		}
		
		System.out.println("sql 구문 :\n"+sql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = -1;
		
		try {
			this.conn = this.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null) {pstmt.close();}
			}catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
	
protected Connection conn = null;
	
	public Connection getConnection() {
		// 접속 객체를 구해줍니다.
		String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
		String id = "onlyone" ;
		String password = "oracle" ;
		
		try {
			conn = DriverManager.getConnection(url, id, password) ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return conn ;
	}	
	
	protected void closeConnection() {
		// 작업 종료 후 커넥션 정보를 닫아 줍니다.
		try {
			if(conn != null) {conn.close();}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public SuperDao() { // 생성자에서 드라이브 로딩
		String driver = "oracle.jdbc.driver.OracleDriver" ;
		
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
