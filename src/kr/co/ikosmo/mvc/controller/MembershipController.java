package kr.co.ikosmo.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ikosmo.mvc.dao.MembershipDAOImpl;
import kr.co.ikosmo.mvc.service.MembershipService;
import kr.co.ikosmo.mvc.vo.MembershipVO;


@Controller
public class MembershipController {
	@Autowired
	private MembershipService membershipService;
	@Autowired
	private MembershipDAOImpl membershipDAOImpl;

	
	// 로그인 세션 매핑
	@RequestMapping("/login.do")
	public String login(MembershipVO vo, HttpSession session ) {
		MembershipVO result = membershipService.loginmembership(vo);
			if(result == null) {
				return "tiles/login";
			}else {
				
				//정보 출력을 위한 세션 매핑
				session.setAttribute("memNo", result.getMem_no()); //회원번호
				session.setAttribute("memId", result.getMem_id()); //회원id
				//session.setAttribute("memPwd", result.getMem_pwd()); //회원pwd
				session.setAttribute("memName", result.getMem_name()); //회원이름
				session.setAttribute("memNickname", result.getMem_nickname()); //회원별명
				//session.setAttribute("memJuminnum", result.getMem_juminnum()); //회원주민번호
				session.setAttribute("memEmail", result.getMem_email()); //회원메일
				session.setAttribute("memPhone", result.getMem_phone()); //회원전화번호
				session.setAttribute("memPic", result.getMem_pic()); //회원사진
				session.setAttribute("memGrade_no", result.getMem_grade_no()); //쉐프또는 일반인
			 
			}
			return "aaa/bbb/index"; //마이페이지에 로그인 이름 뜨는지 확인하기
	}

	
	// 회원가입 매핑
	@RequestMapping("/register")
	public ModelAndView membership(MembershipVO vo) {
		int result = membershipService.insertmembership(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("aaa/bbb/index");
		return mv;   //회원가입 되면 index로 이동
	}
	
	
	
	//로그인 회원가입 완료 -------------------------------------------------------
	
	
	//아이디 중복 확인을 구현합시다. 
	@RequestMapping("idChk")
	public String idchk(String mem_id, Model m) {
		
		// Dao와 연결해서 아이디값이 존재하면 1, 없으면 0 을 반환한다.
		int cnt = membershipDAOImpl.memberIdchk(mem_id);
		//Model을 사용해서 View로 값을 전달한다. 
		m.addAttribute("cnt", cnt);
		
		return "tiles/idChk";
		
	}
	
	//아이디 중복체크 완료 -------------------------------------------------------
	
	// 회원정보수정
	@RequestMapping("memberupdate")
	public String registerUpdate(MembershipVO vo){
		
		membershipService.updateMember(vo);
		
		return "tiles/Mypage";
	}

	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/index";
	}
	
	//업데이트 로그아웃 완료 -----------------------------------------------------
	
	// 회원 탈퇴 -> 회원정보를 없음 처리한다.
	@RequestMapping("memberDelete")
	public String registerDelete(MembershipVO vo, HttpSession session){
		

		Integer mem_no = (Integer)session.getAttribute("memNo");
		  System.out.println("회원탈퇴시 사용되는 mem번호 : "+ mem_no); //콘솔확인
		
		  membershipDAOImpl.memberDelete(vo, mem_no); //delete 지만 없음 처리로 업데이트한 것.
		  
		  session.invalidate(); //회원탈퇴 누르면 로그인도 함께 됨
		  
		
		return "redirect:/index";
	}
}






