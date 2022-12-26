package kr.co.ikosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.CartDaoImpl;
import kr.co.ikosmo.mvc.vo.CartDTO;

@Service("CartServiceInter")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDaoImpl cartDao;

}
