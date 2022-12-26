package kr.co.ikosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.CartDTO;
import kr.co.ikosmo.mvc.vo.PageVO;
import kr.co.ikosmo.mvc.vo.StoreReviewVO;
import kr.co.ikosmo.mvc.vo.StoreVO;



@Repository
public class StoreDaoImple implements StoreDaoInter{
	
	@Autowired
	private SqlSessionTemplate ss;
	
	@Override
	public List<StoreVO> getList(PageVO svo){ 
		return ss.selectList("store.list", svo);
	}

	@Override
	public StoreVO productDetail(int str_pro_no){
		return ss.selectOne("store.product",str_pro_no);
	}
	@Override
	public int getTotalCount(PageVO svo){ 
		return ss.selectOne("store.totalCount", svo);
	}

	@Override
	public List<StoreVO> storeCategory(int shop_category_no) {
		List<StoreVO> category = ss.selectList("store.shop_category", shop_category_no);	
		return ss.selectList("store.shop_category",shop_category_no);
	}
	
	public void reviewInsert(StoreReviewVO rvo) {	
		 ss.insert("store.reviewInsert",rvo);
	}
	
	@Override
	public List<StoreReviewVO> reviewSelect(int str_pro_no){
		System.out.println("DAO IMPL 까지 : " + str_pro_no);
		System.out.println("===> 셀렉트");
		return ss.selectList("store.reviewSelect",str_pro_no);
	}
	
	@Override
	public void insertCart(CartDTO dto) {
		System.out.println("=====> 카트인서트");
		ss.insert("store.insertCart", dto);
	}
}
