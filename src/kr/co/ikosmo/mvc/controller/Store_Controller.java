package kr.co.ikosmo.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ikosmo.mvc.dao.StoreDaoImple;
import kr.co.ikosmo.mvc.dao.StoreDaoInter;
import kr.co.ikosmo.mvc.service.StoreService;
import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.CheckOutDTO;
import kr.co.ikosmo.mvc.vo.PageVO;
import kr.co.ikosmo.mvc.vo.StoreReviewVO;
import kr.co.ikosmo.mvc.vo.StoreVO;


@Controller
public class Store_Controller {
	@Autowired
	private StoreDaoInter storeDaoInter;
	@Autowired
	private StoreDaoImple storeDaoImple;
	@Autowired
	private StoreService storeService;
	
	// �������몃낫湲고���댁� , 由щ럭������
	@RequestMapping(value="/product_detail",method = RequestMethod.GET)
	public String productList(@RequestParam int str_pro_no, Model model, StoreReviewVO rvo) {
		
		
		System.out.println("踰���"+str_pro_no);
		
		
		
		StoreVO vo = storeDaoInter.productDetail(rvo.getStr_pro_no());
		System.out.println("name:"+vo.getStr_pro_name());
		model.addAttribute("vo", vo);
		vo.setStr_pro_no(str_pro_no);
		
		
		
		
		System.out.println("/////////////"+str_pro_no);
		List<StoreReviewVO> result = storeDaoInter.reviewSelect(str_pro_no);
		System.out.println(result);
		model.addAttribute("result", result);
		return "tiles/product_detail_component";
	}
	
	
	
	// �ㅽ���댄���댁�, ���댁�泥�由�
	@RequestMapping(value = "/shop")
	public String proSearch(HttpSession session,PageVO vo, Model model
			, @RequestParam(value = "nowPage", required = false,
					defaultValue = "1") String nowPage
			, @RequestParam(value = "cntPerPage", required = false,
					defaultValue = "9") String cntPerPage) throws Exception {
		//session.setAttribute("memNo", "5");
		//int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
		vo.setSearchType("2");
		if (vo.getSearchType() == null) {
			System.out.println("-------------nowPage:" + nowPage + ",vo=>" + vo);
			int total = storeDaoInter.getTotalCount(vo);
			System.out.println("Total:" + total);
			vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		} else {
			System.out.println("---------------------------------->>");
			if(vo.getSearchValue()==null) {
				vo.setSearchValue("");
			}
			int total = storeDaoInter.getTotalCount(vo);
			System.out.println("Total:" + total);
			System.out.println("searchValue:" + vo.getSearchValue());
			vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getSearchType(),vo.getSearchValue());
		}
		List<StoreVO> list = storeDaoInter.getList(vo);
		for (StoreVO e : list) {
			System.out.println(e.getStr_pro_name());
		}
		System.out.println("listSize:" + list.size());
		System.out.println("Start :" + vo.getStart());
		System.out.println("End :" + vo.getEnd());
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		return "tiles/shopMain";
	}
	
	// �ㅽ���� 移댄��怨�由�
	@RequestMapping(value="/storeCategory")
	public String storeCategory(@RequestParam int shop_category_no, StoreVO vo,Model model) {
		List<StoreVO> list = storeDaoInter.storeCategory(shop_category_no);
		model.addAttribute("list", list);
		System.out.println("移댄��怨�由�=>"+vo.getShop_category_no());
		return "tiles/shopMain";
	}
	
	//由щ럭 �몄����
	@RequestMapping(value="/comm_add")
	public ModelAndView tvo_comm(StoreReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		storeDaoImple.reviewInsert(rvo);
		mav.setViewName("tiles/product_detail_component"+rvo.getStr_pro_no());
//		System.out.println("�몄����"+rvo.getMem_name());
		return mav;
	}
	
	//移댄�� �몄����
	@RequestMapping("/addCart")
	public ModelAndView insertCart(HttpSession session, CartDTO dto) throws Exception{
		//session.setAttribute("memNo",'3');
		System.out.println(dto.getMem_no());
		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
		dto.setMem_no(memNo);
		ModelAndView mav = new ModelAndView();
		storeDaoInter.insertCart(dto);
		System.out.println("===== insertCart() =====");
		mav.setViewName("tiles/product_detail_component");
		return mav;
	}

}
