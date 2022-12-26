package kr.co.ikosmo.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.CartDao;
import kr.co.ikosmo.mvc.service.CartService;
import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.CheckOutDTO;

@Controller
public class CartController {
	
	@Autowired
	private CartDao cartdao;
	
	//장바구니페이지
	@RequestMapping("/storeCart")
	public String getCartUserList(HttpSession session, Model model, CartDTO dto) throws Exception {
		//session.setAttribute("memNo",'3');
		System.out.println(dto.getMem_no());
		System.out.println(session.getAttribute("memNo").toString());
		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
		dto.setMem_no(memNo);
		List<CartDTO> ss = cartdao.getCartList(dto);
		model.addAttribute("cart", ss);
		return "tiles/storeCart";
	}
	
	//상품수량 변경
	@ResponseBody
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public List<CartDTO> UpdateList(HttpSession session, CartDTO cartDTO) throws Exception {
		List<CartDTO> updateCart = cartdao.getUpdateList(cartDTO);
		return updateCart;
	}
	
	//장바구니 상품삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, CartDTO cartDTO) throws Exception {
		int str_cart_no = cartDTO.getStr_cart_no();
		return cartdao.getDeleteList(str_cart_no);
	}



}
