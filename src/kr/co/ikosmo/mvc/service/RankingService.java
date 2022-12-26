package kr.co.ikosmo.mvc.service;

import java.util.List;

import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.RankingJoinVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;


public interface RankingService {
	

	List<Recipe_infoVO> getRankingRecipe(Recipe_infoVO ro) throws Exception;
	
	
	List<ClassVO> getRankingChef(ClassVO co) throws Exception;
	
	List<ClassVO> getRankingReview(ClassVO co) throws Exception;
	
	
	List<ClassVO> getMaxPayClass(ClassVO co) throws Exception;
	
	
	List<RankingJoinVO> getRecipeChef(RankingJoinVO jo) throws Exception;
	
	
	List<ClassVO> getClassChef(ClassVO co) throws Exception;
	 
	
	List<RankingJoinVO> getPayChef(RankingJoinVO jo) throws Exception;

}
