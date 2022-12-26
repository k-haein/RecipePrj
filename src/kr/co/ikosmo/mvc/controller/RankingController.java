package kr.co.ikosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.ClassDAO;
import kr.co.ikosmo.mvc.dao.RankingDAO;
import kr.co.ikosmo.mvc.service.RankingService;
import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.RankingJoinVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;



@Controller
public class RankingController {
	
	@Autowired
	private RankingService rankingservice;

	@Autowired
	private ClassDAO classdao;
	
	
	
	/* ===============   rankin  탭 매뉴로 한꺼번에  처리===============   */
	
	 @GetMapping(value="/ranking")
	 
	   private String getRankingRecipe(Recipe_infoVO ro, ClassVO vo, RankingJoinVO jo, Model model) throws Exception {	
		 
		 model.addAttribute("rkRecipeList", rankingservice.getRankingRecipe(ro));   // recipe탭- 레시피 구독자 수로 랭킹.
		 
		 
		 model.addAttribute("rkChefList", rankingservice.getRankingChef(vo));   // class탭-평균점수 클래스로 랭킹	
		 
		 model.addAttribute("rkReviewList" , rankingservice.getRankingReview(vo));   // class탭- 리뷰 목록
		   				 
		 model.addAttribute("payList" , rankingservice.getMaxPayClass(vo));    // class탭- 제일 많이 구입된 클래스
		 
		 model.addAttribute("chRecipeList" , rankingservice.getRecipeChef(jo));  // 레시피 제일 많이 올린 회원
		 
		 model.addAttribute("chClassList" , rankingservice.getClassChef(vo));    // 클래스 제일 많이 올린 회원
	
		 model.addAttribute("chPayList" , rankingservice.getPayChef(jo));   // 클래스 제일 많이 구매한 회원 
		 
		   return "tiles/ranking";
	   }
	
	
	
	
	

}
