package com.eattogether.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.eattogether.model.bean.Member;

public class MemberDao extends SuperDao {
	
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
		sql += " where id = ?";
		PreparedStatement pstmt = null;
		int cnt = -1;

		try {
			super.conn = super.getConnection();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

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
}
