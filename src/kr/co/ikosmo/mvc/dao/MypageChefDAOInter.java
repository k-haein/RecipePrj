package kr.co.ikosmo.mvc.dao;


import java.util.List;
import java.util.Map;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;


public interface MypageChefDAOInter {
	
	//--------------------
	//(쉐프)레시피 목록 - 페이징
	//--------------------		
	public List<Recipe_infoVO> getList(Map<String,Integer> map); //페이징 처리
	public int getTotalCount();//페이징 카운트	
	
	
	//-----------------
	//(쉐프)클래스 목록 출력	
	//-----------------	
	public List<ClassVO> getClassList(int mem_no);//클래스 리스트
	
	
	//---------------------------
	//(쉐프)가 수강중인 클래스 목록 출력	
	//---------------------------	
	public List<ClassVO> getClassList_std(int mem_no);//쉐프가 수강중인 클래스 리스트
	
	
	//-----------------------
	//(쉐프)statistic 숫자 카운트		
	//-----------------------
	public int getMyRecipeCount(Map<String,Integer> map); //내 레시피 갯수
	public int getMyReviewCount(Map<String,Integer> map); //내 레시피에 달린 리뷰 갯수
	public int getMyClassCount(Map<String,Integer> map); //쉐프가 수강중인 클래스 갯수
	public int getMyClientCount(Map<String,Integer> map); //내가 진행중인 클래스를 듣는 고객의 수
	public int getMyScrapCount(Map<String,Integer> map); //스크랩한 레시피 갯수
	public int getMyStarAvgCount(Map<String,Integer> map); //내가 쓴 레시피의 별점 평균	
	public int getMySubscriberAvgCount(Map<String,Integer> map); //나를 구독하는 사람(subscriber) 팔로워
	public int getMySubscribeAvgCount(Map<String,Integer> map); //내가 구독하는 사람(subscribe) 팔로잉
	
	
}
