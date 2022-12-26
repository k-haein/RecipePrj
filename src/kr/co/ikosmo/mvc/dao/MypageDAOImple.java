package kr.co.ikosmo.mvc.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;
import kr.co.ikosmo.mvc.vo.ScrapVO;
import kr.co.ikosmo.mvc.vo.SubscribeVO;

@Repository
public class MypageDAOImple implements MypageDAOInter{
	
	@Autowired
	private SqlSessionTemplate ss;

	//---------------
	//레시피 목록 - 페이징
	//---------------
	@Override
	public List<Recipe_infoVO> getList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mpp.list",map);
	}
	@Override
	public int getTotalCount() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mpp.totalCount");
	}
	
	//------------
	//클래스 목록 출력	
	//------------
	@Override
	public List<ClassVO> getClassList(int mem_no) { //클래스 리스트 출력
		return ss.selectList("mpp.classlist", mem_no);
	}
	
	
	//------------------
	//statistic 숫자 카운트		
	//------------------
	@Override
	public int getMyRecipeCount(Map<String,Integer> map) { //내 레시피 갯수
		return ss.selectOne("mpp.myRecipeCount", map);
	}
	@Override
	public int getMyReviewCount(Map<String,Integer> map) { //내 레시피에 달린 리뷰 갯수
		return ss.selectOne("mpp.myReviewCount", map);
	}
	@Override
	public int getMyClassCount(Map<String,Integer> map) { //수강중인 클래스 갯수
		return ss.selectOne("mpp.myClassCount", map);
	}
	@Override
	public int getMyScrapCount(Map<String,Integer> map) { //스크랩한 레시피 갯수
		return ss.selectOne("mpp.myScrapCount", map);
	}
	@Override
	public int getMySubscriberAvgCount(Map<String,Integer> map) { //나를 구독하는 사람(subscriber) 팔로워
		return ss.selectOne("mpp.mySubscriberAvgCount", map);
	}
	@Override
	public int getMySubscribeAvgCount(Map<String,Integer> map) { //내가 구독하는 사람(subscribe) 팔로잉
		return ss.selectOne("mpp.mySubscribeAvgCount", map);
	}
	@Override
	public int getMyStarAvgCount(Map<String,Integer> map) { //내가 쓴 레시피의 별점 평균
		return ss.selectOne("mpp.myStarAvgCount", map);
	}

	

	//========================================= 카테고리 ===============================================
	
	//------------
	//리뷰 목록 출력	
	//------------
	@Override //레시피 리스트 출력
	public List<ReviewVO> getReviewlist(Map<String,Integer> map){//리뷰 리스트 출력
		return ss.selectList("mpp.reviewlist", map);
	}

	@Override
	public int getTotalReviewList() {//페이징 카운트
		return ss.selectOne("mpp.totalreviewCount");
	}
	

	
	//------------
	//스크랩 목록 출력	
	//------------
	@Override
	public List<ScrapVO> getscrapList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mpp.scrapList",map);
	}
	@Override
	public int getTotalscrapList() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mpp.totalscrapCount");
	}
	
	
	//---------------
	//레시피 목록 - 페이징
	//---------------
	@Override
	public List<Recipe_infoVO> getMyrecipeList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mpp.listr",map);
	}
	@Override
	public int getMyrecipeTotalCount() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mpp.totalMyrecipeCount");
	}
	
	
	//----------------------------------
	//구독 목록 - 내가 구독하는 사람(subscribe)
	//----------------------------------
	@Override
	public List<SubscribeVO> getSubscribeList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mpp.subscribeList",map);
	}
	@Override
	public int getTotalsubscribeCount() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mpp.totalsubscribeCount");
	}
	
	//----------------------------------
	//구독 목록 - 나를 구독하는 사람(subscriber)
	//----------------------------------
	@Override
	public List<SubscribeVO> getSubscriberList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mpp.subscriberList",map);
	}
	@Override
	public int getTotalsubscriberCount() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mpp.totalsubscriberCount");
	}
	
}
