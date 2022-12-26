package kr.co.ikosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.MembershipDAOImpl;
import kr.co.ikosmo.mvc.dao.MypageDAOImple;
import kr.co.ikosmo.mvc.vo.MembershipVO;



@Service("MembershipService")
public class MembershipServiceImpl implements MembershipService {
		
		@Autowired
		MembershipDAOImpl membershipDAOImpl;
		
		//회원가입
		@Override
		public int insertmembership(MembershipVO vo) {
			return membershipDAOImpl.memberInsert(vo);
		}
		
		//로그인
		@Override
		public MembershipVO loginmembership(MembershipVO vo) {
			return membershipDAOImpl.memberlogin(vo);
		}
				
		
		//회원정보수정
		@Override
		public void updateMember(MembershipVO vo) {
			membershipDAOImpl.updateMember(vo); 
		}
		
		
		//회원탈퇴
		@Override
		public void memberDelete(MembershipVO vo, Integer mem_no){
			membershipDAOImpl.memberDelete(vo, mem_no);
	}




		//로그인 회원가입 완료 --------------------------------------
		
}

