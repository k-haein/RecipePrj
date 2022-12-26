package kr.co.ikosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.CheckOutDao;
import kr.co.ikosmo.mvc.service.CheckOutService;
import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.CheckOutDTO;

@Controller
public class CheckOutController {
	
	@Autowired
	private CheckOutDao checkOutDao;
	
	//결제페이지 보기
	@RequestMapping("/checkOut")
	public String getChkOutList(HttpSession session, Model model, CheckOutDTO dto) throws Exception {
		System.out.println(dto.getMem_no());
		System.out.println(session.getAttribute("memNo").toString());
		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
		dto.setMem_no(memNo); 
		List<CheckOutDTO> ss = checkOutDao.getChkOutList(dto);

		model.addAttribute("orderInfo", ss);
		return "tiles/checkOut";
	}
	
	//결제페이지 결제상품정보 처리
	@ResponseBody
	@RequestMapping(value = "/checkOut_User", method = RequestMethod.POST)
	public List<CheckOutDTO> getChkOutUserList(HttpSession session, Model mv, RedirectAttributes redirectAttributes, CheckOutDTO checkOutDTO) throws Exception {
		List<CheckOutDTO> checkoutlist = checkOutDao.getChkOutUserList(checkOutDTO);
		return checkoutlist;
	}
	
	//결제 정보를 pay테이블, order테이블로 전송 후 cart테이블 정보삭제 처리
	@RequestMapping(value = "/chkOut_insert", produces="text/plain; charset=UTF-8")
	public String insert_chkOut(@ModelAttribute("chkOutinfo") CheckOutDTO dto) {
		checkOutDao.insertChkOut(dto);
		return "tiles/checkOut";
	}
	
		

}
