package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.RankingJoinVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

public interface RankingDAO {
	
	

	
	public List<Recipe_infoVO> getRankingRecipe(Recipe_infoVO ro) throws Exception ;
	
	
	public List<ClassVO> getRankingChef(ClassVO co) throws Exception ;
	
	
	public List<ClassVO> getRankingReview(ClassVO co) throws Exception ;
	
	
	public List<ClassVO> getMaxPayClass(ClassVO co) throws Exception ;
	
	
	public List<RankingJoinVO> getRecipeChef(RankingJoinVO jo) throws Exception ;
	
	
	public List<ClassVO> getClassChef(ClassVO co) throws Exception ;
	
	
	public List<RankingJoinVO> getPayChef(RankingJoinVO jo) throws Exception ;
	
	
	
}
