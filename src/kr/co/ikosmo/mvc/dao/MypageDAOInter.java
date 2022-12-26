package kr.co.ikosmo.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;
import kr.co.ikosmo.mvc.vo.ScrapVO;
import kr.co.ikosmo.mvc.vo.SubscribeVO;

public interface MypageDAOInter {
	
	//---------------
	//레시피 목록 - 페이징
	//---------------	
	public List<Recipe_infoVO> getList(Map<String,Integer> map); //페이징 처리
	public int getTotalCount();//페이징 카운트
	
	//------------
	//클래스 목록 출력	
	//------------		
	public List<ClassVO> getClassList(int mem_no);//클래스 리스트
	
	
	//------------------
	//statistic 숫자 카운트		
	//------------------
	public int getMyRecipeCount(Map<String,Integer> map); //내 레시피 갯수
	public int getMyReviewCount(Map<String,Integer> map); //내 레시피에 달린 리뷰 갯수
	public int getMyClassCount(Map<String,Integer> map); //수강중인 클래스 갯수
	public int getMyScrapCount(Map<String,Integer> map); //스크랩한 레시피 갯수
	public int getMySubscriberAvgCount(Map<String,Integer> map); //나를 구독하는 사람(subscriber) 팔로워
	public int getMySubscribeAvgCount(Map<String,Integer> map); //내가 구독하는 사람(subscribe) 팔로잉
	public int getMyStarAvgCount(Map<String,Integer> map); //내가 쓴 레시피의 별점 평균
	
	
	//========================================= 카테고리 ===============================================
	
	//------------
	//리뷰 목록 출력	
	//------------	
	public List<ReviewVO> getReviewlist(Map<String,Integer> map);//리뷰 리스트 출력
	public int getTotalReviewList();//페이징 카운트
	
	//------------
	//스크랩 목록 출력	
	//------------
	public List<ScrapVO> getscrapList(Map<String,Integer> map); //스크랩 리스트 출력
	public int getTotalscrapList();//페이징 카운트
	
	
	//---------------
	//레시피 목록 - 페이징
	//---------------	
	public List<Recipe_infoVO> getMyrecipeList(Map<String,Integer> map); //페이징 처리
	public int getMyrecipeTotalCount();//페이징 카운트
	
	
	//----------------------------------
	//구독 목록 - 내가 구독하는 사람(subscribe)
	//----------------------------------
	public List<SubscribeVO> getSubscribeList(Map<String,Integer> map); //페이징 처리
	public int getTotalsubscribeCount();//페이징 카운트
	
	//----------------------------------
	//구독 목록 - 나를 구독하는 사람(subscriber)
	//----------------------------------
	public List<SubscribeVO> getSubscriberList(Map<String,Integer> map); //페이징 처리
	public int getTotalsubscriberCount();//페이징 카운트
	
}
