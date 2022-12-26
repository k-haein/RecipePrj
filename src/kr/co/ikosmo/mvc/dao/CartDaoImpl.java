package kr.co.ikosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.CartDTO;

@Repository("cartDao")
public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<CartDTO> getCartList(CartDTO dto) {
		System.out.println("getCartList() 호출");
		try {
			List<CartDTO> cartlist = ss.selectList("cartdto.getCartList", dto);
			return cartlist;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@Override
	public List<CartDTO> getUpdateList(CartDTO cartDTO) {
		System.out.println("getUpdateList() 호출");
		List<CartDTO> cartlist = ss.selectList("cartdto.getUpdateList", cartDTO);
		return cartlist;
	}
	
	@Override
	public int getDeleteList(int str_cart_no) {
		System.out.println("getDeleteList() 호출");
		int cartlist = ss.delete("cartdto.getDeleteList", str_cart_no);
		return cartlist;
	}
	

	

}
