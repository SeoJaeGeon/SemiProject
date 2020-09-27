package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;
import oracle.net.aso.s;
import product.model.vo.Product;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-Squery.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String memId, String memPwd) {
		Member loginUser = null;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(
							rset.getInt("MEM_NUM"),
							rset.getString("MEM_NAME"),
							rset.getString("MEM_ID"),
							rset.getString("MEM_PWD"),
							rset.getString("MEM_PHONE"),
							rset.getString("MEM_ADDRESS"),
							rset.getString("MEM_EMAIL"),
							rset.getDate("ENROLL_DATE"),
							rset.getDate("MODIFY_DATE"),
							rset.getString("MSTATUS"),
							rset.getString("DIVISION_CODE")
							);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	// 회원 가입용 dao
	public int insertMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMemName());
			pstmt.setString(2, mem.getMemId());
			pstmt.setString(3, mem.getMemPwd());
			pstmt.setString(4, mem.getMemPhone());
			pstmt.setString(5, mem.getAddress());
			pstmt.setString(6, mem.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 판매자 회원 가입 dao
	public int insertSeller1(Connection conn, Member mem) {
		int result1 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSeller1");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMemName());
			pstmt.setString(2, mem.getMemId());
			pstmt.setString(3, mem.getMemPwd());
			pstmt.setString(4, mem.getMemPhone());
			pstmt.setString(5, mem.getAddress());
			pstmt.setString(6, mem.getEmail());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
	}
	
	public int insertSeller2(Connection conn, Product pro) {
		int result2 = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSeller2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pro.getStoreName());
			pstmt.setString(2, pro.getUrl());
			pstmt.setString(3, pro.getIntroduction());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}
	

	// 회원 정보 수정용 dao
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemName());
			pstmt.setString(2, m.getMemPhone());
			pstmt.setString(3, m.getAddress());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getMemId());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// memId를 통해 회원 1명 조회용
		public Member selectMember(Connection conn, String memId) {
			Member updateMember = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectMember");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					updateMember = new Member(
								rset.getInt("MEM_NUM"),
								rset.getString("MEM_NAME"),
								rset.getString("MEM_ID"),
								rset.getString("MEM_PWD"),
								rset.getString("MEM_PHONE"),
								rset.getString("MEM_ADDRESS"),
								rset.getString("MEM_EMAIL"),
								rset.getDate("ENROLL_DATE"),
								rset.getDate("MODIFY_DATE"),
								rset.getString("MSTATUS"),
								rset.getString("DIVISION_CODE")
								);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return updateMember;
		}
		
	// 비밀번호 변경용 dao 메소드
	public int updatePwd(Connection conn, String memId, String memPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 회원 탈퇴용 Dao
	public int deleteMember(Connection conn, String memId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection conn, String memId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	
	
	

}
