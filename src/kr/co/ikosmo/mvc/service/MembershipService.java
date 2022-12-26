package kr.co.ikosmo.mvc.service;

import kr.co.ikosmo.mvc.vo.MembershipVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;



public interface MembershipService {

	public int insertmembership (MembershipVO vo); //회원가입
	
	public MembershipVO loginmembership( MembershipVO vo);//로그인

	public void updateMember(MembershipVO vo); //회원정보수정
	
	public void memberDelete(MembershipVO vo, Integer mem_no); //회원탈퇴
	
	//----------------------------------------------------------------
	
	
}

