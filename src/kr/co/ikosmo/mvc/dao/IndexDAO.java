package kr.co.ikosmo.mvc.dao;

import java.util.List;


import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

public interface IndexDAO {

	public List<ClassVO> getFood(ClassVO vo);

	public List<ClassVO> getMainList(ClassVO vo);	
	
	
	/*
	 * public List<Recipe_infoVO> getBestRecipe(Recipe_infoVO ro)throws Exception;
	 */
	
	
	  public Recipe_infoVO getBestRecipe(Recipe_infoVO ro) throws Exception;
	 
	 
	
	public int getRecipeCnt(String recipe_no) throws Exception;
	
	public int getClassCnt(String class_no) throws Exception;
	
	public int getChefRecipeCnt(String recipe_no) throws Exception;
	
	public int getMemCnt(String mem_no) throws Exception;
	
	
	

}
