package kr.co.ikosmo.mvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.ReviewDAO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.ReviewJoinVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewdao;
	
	
	

	@ResponseBody
	@RequestMapping(value="/insertClassReview", method=RequestMethod.POST)
	public void insertClassReview(HttpServletRequest request, ReviewVO ro) throws ServletException,IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("insertClassReview 호출");
		
		reviewdao.insertClassReview(ro);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/deleteClassReview")
	public void deleteSche(int review_no) throws Exception {
		System.out.println("deleteClassReview 호출");
		
		reviewdao.deleteClassReview(review_no);
	}


}
