package kr.co.ikosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.StoreDaoImple;
import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.StoreReviewVO;

@Service("StoreService")
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDaoImple storeDaoImple;
	
		public void insertCart(CartDTO dto) {
			storeDaoImple.insertCart(dto);
		}
	
}
