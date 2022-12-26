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

import kr.co.ikosmo.mvc.dao.MypageDAOInter;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Mypage_ingVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;
import kr.co.ikosmo.mvc.vo.SubscribeVO;

@Controller
public class MypageController {

	
	@Autowired
	private MypageDAOInter mypageDAOInter;

//-----------------------
//레시피 최근 5개 목록(페이징x)
//-----------------------
	@RequestMapping(value="/Mypage")
	public String listSearch(Mypage_ingVO vo, Model model, HttpSession session,
			@RequestParam(value="nowPage", required=false ,defaultValue="1") 
			String nowPage,
			@RequestParam(value="cntPerPage", required=false , defaultValue="5") 
			String cntPerPage){
		
		int total = mypageDAOInter.getTotalCount();

		vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println("Start :"+vo.getStart());
		System.out.println("End :"+vo.getEnd());
		
		Integer sessionNo = (Integer)session.getAttribute("memNo");
		
				Map<String,Integer> map = new HashMap();
				
				map.put("start",vo.getStart());
				map.put("end",vo.getEnd());
				map.put("sessionNo",sessionNo);

		model.addAttribute("paging", vo);
		model.addAttribute("list", mypageDAOInter.getList(map));
		

//--------------------
//클래스 리스트 목록(동일페이지)	
//--------------------		
		//클래스 리스트출력-------------------------------------------------
		int mem_no = Integer.parseInt(session.getAttribute("memNo").toString());
		  System.out.println("클래스 리스트에 출력되는 mem번호 : "+ mem_no); //콘솔확인
	  List<ClassVO> classlist = mypageDAOInter.getClassList(mem_no);
	  
	  model.addAttribute("classlist", classlist);
		//클래스 리스트출력 끝-------------------------------------------------

//--------------------
//statistic 숫자 카운트	
//--------------------		  
		//statistic 숫자출력-------------------------------------------------
	  	
	  		//map.put("class_no",class_no);
	  		//map.put("recipe_no",recipe_no);
	  
	  	model.addAttribute("myRecipeCount", mypageDAOInter.getMyRecipeCount(map)); //내 레시피 갯수
	  	model.addAttribute("myReviewCount", mypageDAOInter.getMyReviewCount(map)); //내 레시피에 달린 리뷰 갯수
		model.addAttribute("myClassCount", mypageDAOInter.getMyClassCount(map)); //수강중인 클래스 갯수
		model.addAttribute("myScrapCount", mypageDAOInter.getMyScrapCount(map)); //스크랩한 레시피 갯수
		model.addAttribute("mySubscriberAvgCount", mypageDAOInter.getMySubscriberAvgCount(map)); //나를 구독하는 사람(subscriber) 팔로워
		model.addAttribute("mySubscribeAvgCount", mypageDAOInter.getMySubscribeAvgCount(map)); //내가 구독하는 사람(subscribe) 팔로잉
		
		if (session.getAttribute("myStarAvgCount") == null) {
	         System.out.println("myStarAvgCount 널 허용 처리");
	      }
	      else {
	    	  model.addAttribute("myStarAvgCount", mypageDAOInter.getMyStarAvgCount(map)); //내가 쓴 레시피의 별점 평균
	      }
		//statistic 숫자출력 끝-------------------------------------------------	  

		return "tiles/Mypage";
	}
	
	
	
	
	
	
	
	
	

/* =================================== 카테고리 =================================== */	
	
//--------------------
//리뷰 리스트 목록(resultmap)	
//--------------------		

	
	@RequestMapping(value="/review")
	 public String listMyComment(Mypage_ingVO vo, Model model, HttpSession session,
				@RequestParam(value="nowPage", required=false ,defaultValue="1") 
				String nowPage,
				@RequestParam(value="cntPerPage", required=false , defaultValue="10") 
				String cntPerPage){
	
			int total = mypageDAOInter.getTotalReviewList();

			vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			System.out.println("Start :"+vo.getStart());
			System.out.println("End :"+vo.getEnd()); 
			
			Integer sessionNo = (Integer)session.getAttribute("memNo");
					Map<String,Integer> map = new HashMap<String, Integer>();
					map.put("start",vo.getStart());
					map.put("end",vo.getEnd());
					map.put("sessionNo",sessionNo);			
					
			model.addAttribute("paging", vo);
			model.addAttribute("reviewlist", mypageDAOInter.getReviewlist(map));
	  
	  
	  
		return "tiles/review";
	}
	

	

//--------------------
//스크랩 리스트 목록(페이징)	
//--------------------
	@RequestMapping(value="/Myscrap")
	public String listScrap(Mypage_ingVO vo, Model model, HttpSession session,
			@RequestParam(value="nowPage", required=false ,defaultValue="1") 
			String nowPage,
			@RequestParam(value="cntPerPage", required=false , defaultValue="5") 
			String cntPerPage){
		
		int total = mypageDAOInter.getTotalscrapList();

		vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		System.out.println("Start :"+vo.getStart());
		System.out.println("End :"+vo.getEnd()); 
		
		Integer sessionNo = (Integer)session.getAttribute("memNo");
				Map<String,Integer> map = new HashMap<String, Integer>();
				map.put("start",vo.getStart());
				map.put("end",vo.getEnd());
				map.put("sessionNo",sessionNo);			
				
		model.addAttribute("paging", vo);
		model.addAttribute("scrapList", mypageDAOInter.getscrapList(map));
		
		return "tiles/Myscrap";
	}
	

	//--------------------
	//레시피 리스트 목록(페이징)	
	//--------------------
		@RequestMapping(value="/Myrecipe_list")
		public String listMyrecipe(Mypage_ingVO vo, Model model, HttpSession session,
				@RequestParam(value="nowPage", required=false ,defaultValue="1") 
				String nowPage,
				@RequestParam(value="cntPerPage", required=false , defaultValue="6") 
				String cntPerPage){
			
			int total = mypageDAOInter.getMyrecipeTotalCount();

			vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("Start :"+vo.getStart());
			System.out.println("End :"+vo.getEnd());
			
			Integer sessionNo = (Integer)session.getAttribute("memNo");
			
					Map<String,Integer> map = new HashMap();
					
					map.put("start",vo.getStart());
					map.put("end",vo.getEnd());
					map.put("sessionNo",sessionNo);

			model.addAttribute("paging", vo);
			model.addAttribute("listr", mypageDAOInter.getMyrecipeList(map));
	
			return "tiles/Myrecipe_list";
		}	
	
		//----------------------------------
		//구독 목록 - 내가 구독하는 사람(subscribe)
		//----------------------------------
			@RequestMapping(value="/MySubscribe")
			public String listSubscribe(Mypage_ingVO vo, Model model, HttpSession session,
					@RequestParam(value="nowPage", required=false ,defaultValue="1") 
					String nowPage,
					@RequestParam(value="cntPerPage", required=false , defaultValue="5") 
					String cntPerPage){
				
				int total = mypageDAOInter.getTotalsubscribeCount();

				vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				
				System.out.println("Start :"+vo.getStart());
				System.out.println("End :"+vo.getEnd()); 
				
				Integer sessionNo = (Integer)session.getAttribute("memNo");
						Map<String,Integer> map = new HashMap<String, Integer>();
						map.put("start",vo.getStart());
						map.put("end",vo.getEnd());
						map.put("sessionNo",sessionNo);			
						
				model.addAttribute("paging", vo);
				model.addAttribute("subscribeList", mypageDAOInter.getSubscribeList(map));
				
				return "tiles/MySubscribe";
			}
	

			//----------------------------------
			//구독 목록 - 나를 구독하는 사람(subscriber)
			//----------------------------------
				@RequestMapping(value="/MySubscriber")
				public String listSubscriber(Mypage_ingVO vo, Model model, HttpSession session,
						@RequestParam(value="nowPage", required=false ,defaultValue="1") 
						String nowPage,
						@RequestParam(value="cntPerPage", required=false , defaultValue="5") 
						String cntPerPage){
					
					int total = mypageDAOInter.getTotalsubscriberCount();

					vo = new Mypage_ingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					
					System.out.println("Start :"+vo.getStart());
					System.out.println("End :"+vo.getEnd()); 
					
					Integer sessionNo = (Integer)session.getAttribute("memNo");
							Map<String,Integer> map = new HashMap<String, Integer>();
							map.put("start",vo.getStart());
							map.put("end",vo.getEnd());
							map.put("sessionNo",sessionNo);			
							
					model.addAttribute("paging", vo);
					model.addAttribute("subscriberList", mypageDAOInter.getSubscriberList(map));
					
					return "tiles/MySubscriber";
				}			
			
	
}