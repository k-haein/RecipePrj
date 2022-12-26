package kr.co.ikosmo.mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.MembershipVO;

@Repository("MembershipDAO")
public class MembershipDAOImpl implements MembershipDAO {
	
	
	@Autowired 
	private SqlSessionTemplate ss;
		

	
	@Override
	public MembershipVO memberlogin(MembershipVO vo) {
		MembershipVO mv = ss.selectOne("membership.memberlogin", vo);
		return mv;
	}

	@Override
	public int memberInsert(MembershipVO vo) {
		return ss.insert("membership.memberinsert", vo);
	}
	//로그인 회원가입 완료 -------------------------------------------------------

	@Override
	public int memberIdchk(String mem_id) {
		return ss.selectOne("membership.idchk",mem_id);
	}
	
	//회원정보수정
	@Override
	public void updateMember(MembershipVO vo) {
		ss.update("membership.updateMember", vo); 
	}
	
	
	//회원탈퇴
	@Override
	public void memberDelete(MembershipVO vo, Integer mem_no){
		ss.update("membership.memberDelete", mem_no);
		
	}

	
}
