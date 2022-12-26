package kr.co.ikosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.RankingJoinVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

@Repository
public class RankingDAOImpl implements RankingDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/* rankin_main recipe부분 처리 */
	@Override

	public List<Recipe_infoVO> getRankingRecipe(Recipe_infoVO ro) throws Exception {
		System.out.println("getRankingRecipe");
		return mybatis.selectList("ranking.getRankingRecipe", ro);
	}

	/* rankin_main chef부분 처리 */
	@Override
	public List<ClassVO> getRankingChef(ClassVO co) throws Exception {
		System.out.println("getRankingChef");
		return mybatis.selectList("ranking.getRankingChef", co);
	}

	/* rankin_main chef부분 처리 */
	@Override
	public List<ClassVO> getMaxPayClass(ClassVO co) throws Exception {
		System.out.println("getMaxPayClass");
		return mybatis.selectList("ranking.getMaxPayClass", co);
	}

	/* rankin_main review 슬라이드부분 처리 */
	@Override
	public List<ClassVO> getRankingReview(ClassVO co) throws Exception {
		System.out.println("getRankingReview");
		return mybatis.selectList("ranking.getRankingReview", co);
	}

	
	
	
	/*  rankin_main chef부분 처리  */
	 
	  @Override
	  public List<RankingJoinVO> getRecipeChef(RankingJoinVO jo) throws  Exception{ 
		  
	   System.out.println("getRecipeChef");
	   
	  return  mybatis.selectList("ranking.getRecipeChef",jo); 
	  }
	  
	  

	  @Override
	  public List<ClassVO> getClassChef(ClassVO co) throws  Exception{ 
		  
	   System.out.println("getClassChef");
	   
	  return  mybatis.selectList("ranking.getClassChef",co); 
	  }
	
	
	
	  @Override
	  public List<RankingJoinVO> getPayChef(RankingJoinVO jo) throws  Exception{ 
		  
	   System.out.println("getPayChef");
	   
	  return  mybatis.selectList("ranking.getPayChef",jo); 
	  }
	  
	  
	  
	  
}
