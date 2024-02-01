package com.eattogether.model.dao;

import java.sql.PreparedStatement;

import com.eattogether.model.bean.Member;

public class MemberDao extends SuperDao {

	public int insertData(Member bean) { // 회원 가입 insert
		System.out.println(bean);
		String sql = "insert into members(mem_no,mem_id,mem_name,mem_alias,mem_password,mem_birth,mem_phone,mem_taste)";
		sql += " values(seqmember.nextval,?,?,?,?,?,?,?)";
		
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
			pstmt.setInt(6, bean.getPhone());
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

}
