package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import product.model.vo.Product;

public class MemberService {

	public Member loginMember(String memId, String memPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, memId, memPwd);
		
		close(conn);
		
		return loginUser;
	}

	// 구매자 회원 가입용 서비스 메소드
	public int insertMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 판매자 회원 가입 서비스
	public int insertSeller(Member mem, Product pro) {
		Connection conn = getConnection();
		int result = 0;
		int result1 = new MemberDao().insertSeller1(conn, mem);
		int result2 = new MemberDao().insertSeller2(conn, pro);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
			result = 1;
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	// 회원 정보 수정용 서비스 
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		Member updateMember = null;
		
		int result = new MemberDao().updateMember(conn, m);
		
		if(result > 0) {
			commit(conn);
			updateMember = new MemberDao().selectMember(conn, m.getMemId());
		} else {
			rollback(conn);
		} 
		
		close(conn);
		
		return updateMember;
	}

	// 비밀번호 변경용 서비스 메소드
	public Member updatePwd(String memId, String memPwd, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, memId, memPwd, newPwd);
		
		Member updateMember = null;
		
		if(result > 0) {
			commit(conn);
			updateMember = new MemberDao().selectMember(conn, memId);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMember;
	}

	// 회원 탈퇴용 서비스
	public int deleteMember(String memId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, memId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		} 
		
		close(conn);
		
		return result;
	}

	// 아이디 중복 체크 서비스
	public int idCheck(String memId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, memId);
		
		close(conn);
		
		return result;
	}

	


}
