package kr.co.ikosmo.mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ikosmo.mvc.dao.MypageChefDAOInter;
import kr.co.ikosmo.mvc.dao.MypageDAOInter;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Mypage_ingVO;

@Controller
public class MypageChefController {

	
	@Autowired
	private MypageChefDAOInter mypageChefDAOInter;
	
	

//-----------------------
//(쉐프)레시피 리스트 목록(페이징x)	
//-----------------------
	@RequestMapping(value="/Mypage_chef")
	public String listSearch(Mypage_ingVO vo, Model model, HttpSession session,
			@RequestParam(value="nowPage", required=false ,defaultValue="1") 
			String nowPage,
			@RequestParam(value="cntPerPage", required=false , defaultValue="5") 
			String cntPerPage){
		
		int total = mypageChefDAOInter.getTotalCount();

		vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("Start :"+vo.getStart());
		System.out.println("End :"+vo.getEnd());
		Integer sessionNo = (Integer)session.getAttribute("memNo");
				Map<String,Integer> map = new HashMap();
				map.put("start",vo.getStart());
				map.put("end",vo.getEnd());
				map.put("sessionNo",sessionNo); //세션 넘버가 같은걸로 개인 레시피를 불러온다.

		model.addAttribute("paging", vo);
		model.addAttribute("listc", mypageChefDAOInter.getList(map));
//-------------------------
//(쉐프)클래스 리스트 목록(동일페이지)	
//-------------------------		
		//클래스 리스트출력-------------------------------------------------
		int mem_no = Integer.parseInt(session.getAttribute("memNo").toString());
		  System.out.println("클래스 리스트에 출력되는 mem번호 : "+ mem_no); //콘솔확인
		  
		  
	  List<ClassVO> classlistC = mypageChefDAOInter.getClassList(mem_no); //쉐프가 가르치는 클래스 목록
	  List<ClassVO> classlist_std = mypageChefDAOInter.getClassList_std(mem_no);//쉐프가 수강중인 클래스 목록 띄우기
	  
	  model.addAttribute("classlistC", classlistC); //쉐프가 가르치는 클래스 목록
	  model.addAttribute("classlist_std", classlist_std); //쉐프가 수강중인 클래스 목록 띄우기
		//클래스 리스트출력 끝-------------------------------------------------
	  
//-------------------------
//(쉐프)statistic 숫자 카운트	
//-------------------------		  
		//statistic 숫자출력-------------------------------------------------
	  	model.addAttribute("myRecipeCount", mypageChefDAOInter.getMyRecipeCount(map)); //내 레시피 갯수
	  	model.addAttribute("myReviewCount", mypageChefDAOInter.getMyReviewCount(map)); //내 레시피에 달린 리뷰 갯수
		model.addAttribute("myClassCount", mypageChefDAOInter.getMyClassCount(map)); //쉐프가 수강중인 클래스 갯수
		model.addAttribute("myClientCount", mypageChefDAOInter.getMyClientCount(map)); //내가 진행중인 클래스를 듣는 고객의 수
		model.addAttribute("myScrapCount", mypageChefDAOInter.getMyScrapCount(map)); //스크랩한 레시피 갯수
		
		if (session.getAttribute("myStarAvgCount") == null) {
	         System.out.println("myStarAvgCount 널 허용 처리");
	      }
	      else {
	    	  model.addAttribute("myStarAvgCount", mypageChefDAOInter.getMyStarAvgCount(map)); //내가 쓴 레시피의 별점 평균
	      }
		
		model.addAttribute("mySubscriberAvgCount", mypageChefDAOInter.getMySubscriberAvgCount(map)); //나를 구독하는 사람(subscriber) 팔로워
		model.addAttribute("mySubscribeAvgCount", mypageChefDAOInter.getMySubscribeAvgCount(map)); //내가 구독하는 사람(subscribe) 팔로잉
		
		//statistic 숫자출력 끝-------------------------------------------------
		
		
		return "tiles/Mypage_chef";
	}
	
	
	
}