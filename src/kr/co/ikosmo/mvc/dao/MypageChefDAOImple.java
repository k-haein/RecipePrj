package kr.co.ikosmo.mvc.dao;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

@Repository
public class MypageChefDAOImple implements MypageChefDAOInter{
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//--------------------
	//(쉐프)레시피 목록 - 페이징
	//--------------------	
	@Override
	public List<Recipe_infoVO> getList(Map<String,Integer> map){ //nowPage등으로 연산이 된  start,end
		return ss.selectList("mppc.listc",map);
	}
	@Override
	public int getTotalCount() {//전체 데이터를 기준으로 페이지를 나눌것이기 때문에..
		return ss.selectOne("mppc.totalCountc");
	}
	
	//-----------------
	//(쉐프)클래스 목록 출력	
	//-----------------	
	@Override
	public List<ClassVO> getClassList(int mem_no) { //클래스 리스트 출력
		return ss.selectList("mppc.classlistC", mem_no);
	}
	
	//---------------------------
	//(쉐프)가 수강중인 클래스 목록 출력	
	//---------------------------	
	public List<ClassVO> getClassList_std(int mem_no) {//쉐프가 수강중인 클래스 리스트
		return ss.selectList("mppc.classlist_std", mem_no);
	}
	
	
	//-----------------------
	//(쉐프)statistic 숫자 카운트		
	//-----------------------
	@Override
	public int getMyRecipeCount(Map<String,Integer> map) { //내 레시피 갯수
		return ss.selectOne("mppc.myRecipeCount", map);
	}
	@Override
	public int getMyReviewCount(Map<String,Integer> map) { //내 레시피에 달린 리뷰 갯수
		return ss.selectOne("mppc.myReviewCount", map);
	}
	@Override
	public int getMyClassCount(Map<String,Integer> map) { //쉐프가 수강중인 클래스 갯수
		return ss.selectOne("mppc.myClassCount", map);
	}
	@Override
	public int getMyClientCount(Map<String,Integer> map) { //내가 진행중인 클래스를 듣는 고객의 수
		return ss.selectOne("mppc.myClientCount", map);
	}
	@Override
	public int getMyScrapCount(Map<String,Integer> map) { //스크랩한 레시피 갯수
		return ss.selectOne("mppc.myScrapCount", map);
	}
	@Override
	public int getMyStarAvgCount(Map<String,Integer> map) { //내가 쓴 레시피의 별점 평균
		return ss.selectOne("mppc.myStarAvgCount", map);
	}
	@Override
	public int getMySubscriberAvgCount(Map<String,Integer> map) { //나를 구독하는 사람(subscriber) 팔로워
		return ss.selectOne("mppc.mySubscriberAvgCount", map);
	}
	@Override
	public int getMySubscribeAvgCount(Map<String,Integer> map) { //내가 구독하는 사람(subscribe) 팔로잉
		return ss.selectOne("mppc.mySubscribeAvgCount", map);
	}
}
