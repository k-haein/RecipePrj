package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.MembershipVO;

public interface MembershipDAO {
	
	
	MembershipVO memberlogin(MembershipVO vo);
	public int memberInsert(MembershipVO vo);
	//로그인 회원가입 완료 -------------------------------------------------------
	public int memberIdchk(String mem_id); // 아이디 중복 처리 

	public void updateMember(MembershipVO vo);//회원정보수정

	public void memberDelete(MembershipVO vo, Integer mem_no);	// 회원 탈퇴
}