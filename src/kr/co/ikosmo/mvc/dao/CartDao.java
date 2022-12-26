package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.CartDTO;

public interface CartDao {

	public List<CartDTO> getCartList(CartDTO dto);
	public List<CartDTO> getUpdateList(CartDTO dto);
	public int getDeleteList(int str_cart_no);
	
}
