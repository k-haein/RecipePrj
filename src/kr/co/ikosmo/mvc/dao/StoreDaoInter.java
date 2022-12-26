package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.PageVO;
import kr.co.ikosmo.mvc.vo.StoreVO;
import kr.co.ikosmo.mvc.vo.StoreReviewVO;


public interface StoreDaoInter {

	public List<StoreVO> getList(PageVO svo);
	public int getTotalCount(PageVO svo);
	public StoreVO productDetail(int str_pro_no);
	public List<StoreReviewVO> reviewSelect(int str_pro_no);
	public List<StoreVO> storeCategory(int shop_category_no);
	public void insertCart(CartDTO dto);
}
