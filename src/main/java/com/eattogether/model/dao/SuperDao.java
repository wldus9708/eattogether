package com.eattogether.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
	
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
