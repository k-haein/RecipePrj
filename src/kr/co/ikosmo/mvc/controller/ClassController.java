package kr.co.ikosmo.mvc.controller;

import java.awt.PageAttributes.MediaType;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.ClassDAO;
import kr.co.ikosmo.mvc.dao.IndexDAO;
import kr.co.ikosmo.mvc.dao.RankingDAO;
import kr.co.ikosmo.mvc.dao.ReviewDAO;
import kr.co.ikosmo.mvc.service.ClassService;
import kr.co.ikosmo.mvc.service.MembershipService;
import kr.co.ikosmo.mvc.service.RankingService;
import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.KindTagVO;
import kr.co.ikosmo.mvc.vo.MembershipVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ReviewJoinVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;

@Controller
public class ClassController {

	private List<ClassVO> page_list;

	@Autowired
	private ClassDAO classdao;

	@Autowired
	private IndexDAO indexdao;

	@Autowired
	private ClassService classservice;

	@Autowired
	private ReviewDAO reviewdao;
	
	@Autowired
	private RankingService rankingservice;

	

	/* =============== class_main 처리=============== */

	@RequestMapping("/class_main")
	public String getClassList(HttpSession session, RedirectAttributes redirectAttribute) throws Exception {

		session.removeAttribute("classSearch_keyword");
		
		session.removeAttribute("classSearch_key");

		
		List<ClassVO> classlist = classdao.getClassList();

		System.out.println("getClassList 호출호출!");

		redirectAttribute.addFlashAttribute("list", classlist);

		page_list = classlist;

		return "redirect:/paging";
	}

	/* =============== class_main 페이징 =============== */

	@RequestMapping("/paging")
	public String paging(ClassVO co, HttpServletRequest request, Model model, String page) throws Exception {

		List<ClassVO> paginglist = (List) model.asMap().get("list");
		if (paginglist != null) {
			System.out.println(paginglist.get(0).getClass_no());
		}

		List<ClassVO> setPage = new ArrayList<ClassVO>();
		int page_size = 6;

		try {

			if (page == null) {
				for (int i = 0; i < page_size; i++) {

					ClassVO vo = page_list.get(i);

					setPage.add(vo);
				}
			} else {

				int paramPage = Integer.parseInt(page);
				if (page_list.size() > page_size * paramPage) {

					for (int i = (page_size * paramPage - page_size); i < page_size * paramPage; i++) {

						ClassVO vo = page_list.get(i);
						setPage.add(vo);
					}
				} else {
					for (int i = (page_size * paramPage - page_size); i < page_list.size(); i++) {

						ClassVO vo = page_list.get(i);
						setPage.add(vo);
					}
				}
			}

		} catch (IndexOutOfBoundsException e) {

		}

		int page_num = 0;

		if (page_list.size() % page_size == 0) {
			page_num = page_list.size() / page_size;

		} else {
			page_num = (int) Math.floor(page_list.size() / page_size) + 1;
		}

		int[] p_num = new int[page_num];

		for (int i = 0; i < p_num.length; i++) {
			p_num[i] = i + 1;
		}

		model.addAttribute("class_main", setPage);

		model.addAttribute("p_num", p_num);
		

		List<ClassVO> popularClassList = classdao.popularClass();

		model.addAttribute("poplist", popularClassList);
		
		
		List<ClassVO> paylist = rankingservice.getMaxPayClass(co);
		
		model.addAttribute("paylist", paylist);

		return "tiles/class_main";
	}

	/* =============== class_main 검색 처리 =============== */
	@RequestMapping("/classSearch")
	public String classSearch(HttpServletRequest request, HttpSession session) {

		String classSearch_key = request.getParameter("classSearch_key");

		String classSearch_keyword = request.getParameter("classSearch_keyword");

		if (classSearch_key.equals("재료를입력해요")) {

			page_list = classdao.classContentSearch(classSearch_keyword);

		} else {

			page_list = classdao.classSubjectSearch(classSearch_keyword);
		}

		session.setAttribute("classSearch_keyword", classSearch_keyword);

		session.setAttribute("classSearch_key", classSearch_key);

		return "redirect:/paging";

	}

	

/* ===============  class_detail ===============   */ 
	
	@RequestMapping("/class_detail")
	
	public String class_detail(ClassVO co, ReviewJoinVO ro, Model model, HttpSession session,@RequestParam int class_no) throws Exception {
		
		ClassVO valueOne = classdao.getClass(co);	
		
		Integer memNo = Integer.parseInt(session.getAttribute("memNo").toString());		
				
		model.addAttribute("classDe", valueOne);		
		
		
		List<ClassVO> classList = new ArrayList<ClassVO>();
		
		classList.add(valueOne);
		
		model.addAttribute("classList",classList);	
		
		

		List<ReviewJoinVO> reviewllist = reviewdao.getReview(ro);
		
		model.addAttribute("reviewllist",reviewllist);
		
		
		classservice.classViewCnt(class_no, session);  /* 조회수 */ 
		
		
		/* 결제 아이디 체크 */ 
		
		int payck = classservice.getPayidCk(class_no, memNo);
		
		int msg = 0;
						
		if (payck == 1) {
			
			model.addAttribute("payck",payck);			
			
		}else {
			
			model.addAttribute("payck",msg);
			
		}		
		
		return "tiles/class_detail";						
	
	}
		

	  
	  

	/* =============== class_write =============== */

	@RequestMapping("/insertClass")

	public String insertClass(ClassVO vo, HttpSession session, MultipartHttpServletRequest file) throws Exception {

		System.out.println(vo.getMem_no());
		System.out.println("insert호출!");

		System.out.println(session.getAttribute("memNo").toString());

		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());

		vo.setMem_no(memNo);

		classservice.insertClass(vo);

		UUID uuid = UUID.randomUUID();

		List<MultipartFile> fileList = file.getFiles("file");

		String path = "D:\\bigdata\\workspace\\RecipePrj_01\\WebContent\\resources\\image\\FoodImg\\";

		for (MultipartFile mf : fileList) {

			String originFileName = mf.getOriginalFilename();

			long fileSize = mf.getSize();

			System.out.println("originFileName : " + originFileName);

			System.out.println("fileSize : " + fileSize);

			String safeFile = path + originFileName;

			vo.setClass_thumbnail(originFileName);

			try {

				mf.transferTo(new File(safeFile));

			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		return "redirect:/class_write_ok";
	}

	/* =============== class_update =============== */

	@RequestMapping(value = "/class_update")
	public String classUpdateFrom(ClassVO vo, Model model, MultipartHttpServletRequest mtfRequest) throws Exception {

		ClassVO upValue = classdao.getClass(vo);

		model.addAttribute("classUpDe", upValue);

		return "tiles/class_update";
	}

	@RequestMapping("/updateClass")
	public String updateClass(@ModelAttribute("classvo") ClassVO vo, MultipartHttpServletRequest file)
			throws Exception {

		classservice.updateClass(vo);

		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();

		List<MultipartFile> fileList = file.getFiles("file");

		String path = "D:\\bigdata\\workspace\\RecipePrj_01\\WebContent\\resources\\image\\FoodImg\\";

		for (MultipartFile mf : fileList) {

			String originFileName = mf.getOriginalFilename(); // 원본 파일 명

			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);

			System.out.println("fileSize : " + fileSize);

			String safeFile = path + originFileName;

			vo.setClass_thumbnail(originFileName);

			try {

				mf.transferTo(new File(safeFile));

			} catch (IllegalStateException e) {

				e.printStackTrace();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		return "redirect:class_main";
	}

	/* =============== 클래스 삭제 =============== */

	@RequestMapping("deleteClass")

	public String deleteClass(@RequestParam int class_no) throws Exception {

		classservice.deleteClass(class_no);

		return "redirect:class_main";

	}
	
	
	
	
	/* =============== class_payment =============== */

	@RequestMapping("/class_payment")

	public String class_payment(ClassVO co, Model model, HttpSession session, @RequestParam int class_no)
			throws Exception {

		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());

		co.setMem_no(memNo);

		ClassVO payValue = classdao.getClass(co);

		model.addAttribute("classPay", payValue);

		classservice.classViewCnt(class_no, session);

		return "tiles/class_payment";

	}

	

	@ResponseBody
	@RequestMapping(value="/insertPayClass", method=RequestMethod.POST)
	public void insertPayClass(HttpServletRequest request, ClassPayInfoVO vo) throws ServletException,Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("insertClassReview 호출");
		
		classdao.insertPayClass(vo);
	}
	
	
	

	/* index 페이지 두번째 섹션 연결 */

	@RequestMapping("/getFood")
	public String getFood(ClassVO vo, RedirectAttributes redirectAttribute) throws Exception {

		List<ClassVO> classlist = indexdao.getFood(vo);

		System.out.println(" getFood 호출");

		redirectAttribute.addFlashAttribute("list", classlist);

		page_list = classlist;

		return "redirect:/paging";
	}
	
	
	
	/* 태그 처리 */

	@RequestMapping("/getTheme")
	public String getTheme(ClassVO vo, RedirectAttributes redirectAttribute) throws Exception {

		List<ClassVO> themelist = classdao.getTheme(vo);

		System.out.println(" getTheme 호출");

		redirectAttribute.addFlashAttribute("list", themelist);

		page_list = themelist;

		return "redirect:/paging";
	}
	
	
	@RequestMapping("/getMaterial")
	public String getMaterial(ClassVO vo, RedirectAttributes redirectAttribute) throws Exception {

		List<ClassVO> materiallist = classdao.getMaterial(vo);

		System.out.println(" getMaterial 호출");

		redirectAttribute.addFlashAttribute("list", materiallist);

		page_list = materiallist;

		return "redirect:/paging";
	}
	
	
	
	

}
