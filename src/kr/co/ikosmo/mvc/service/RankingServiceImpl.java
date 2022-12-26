package kr.co.ikosmo.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.RankingDAO;
import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.RankingJoinVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;


@Service("reankingService")

public class RankingServiceImpl implements RankingService{
	
	
	@Autowired
	private RankingDAO rankingdao;

	
	@Override
	public List<Recipe_infoVO> getRankingRecipe(Recipe_infoVO ro) throws Exception{
		
		return rankingdao.getRankingRecipe(ro);
	}
	
	
	@Override
	public List<ClassVO> getRankingChef(ClassVO co) throws Exception{
		
		return rankingdao.getRankingChef(co);
	}
	
	
	@Override
	public List<ClassVO> getMaxPayClass(ClassVO co) throws Exception{
		
		return rankingdao.getMaxPayClass(co);
	}
	
	
	
	
	@Override
	public List<ClassVO> getRankingReview(ClassVO co) throws Exception{
		
		return rankingdao.getRankingReview(co);
	}
	
	
	
	
	  @Override 
	  public List<RankingJoinVO> getRecipeChef(RankingJoinVO jo) throws  Exception{
	  
	  return rankingdao.getRecipeChef(jo); 
	  }
	  
	  
	  @Override 
	  public List<ClassVO> getClassChef(ClassVO co) throws  Exception{
	  
	  return rankingdao.getClassChef(co); 
	  }
	 
	 
	  @Override 
	  public List<RankingJoinVO> getPayChef(RankingJoinVO jo) throws  Exception{
	  
	  return rankingdao.getPayChef(jo);
	  }
	  
	  
	  
}
