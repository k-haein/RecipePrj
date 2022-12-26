package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.stream.events.Namespace;

import org.apache.velocity.app.event.ReferenceInsertionEventHandler.referenceInsertExecutor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

@Repository
public class IndexDAOImpl implements IndexDAO{
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
		
	
	 @Override 
	 public List<ClassVO> getFood(ClassVO vo) {
	  System.out.println("===> Mybatis getFood() 출력처리"); 
	  List<ClassVO> classlist = mybatis.selectList("class.getFood", vo); 
	  
	  return classlist;
	  
	 }
	 
	 
	 @Override
	   public List<ClassVO> getMainList(ClassVO vo){ 		   
		   System.out.println("===> Mybatis getMainList() 출력처리");		   
	      return mybatis.selectList("class.getMainList",vo); 
	      
	   }
	 
		  
		  @Override 
		  public Recipe_infoVO getBestRecipe(Recipe_infoVO ro) throws Exception {
		  System.out.println("===> Mybatis getBestRecipe() 출력처리"); 
		  return mybatis.selectOne("recipe.getBestRecipe", ro);
		  
		  }	  

	 @Override
	 public int getRecipeCnt(String recipe_no) throws Exception{
		 
		 System.out.println("===> Mybatis getRecipeCnt() 출력처리");
		 
		 return mybatis.selectOne("recipe.getRecipeCnt", recipe_no);
		 
	 }
	 
	 
	 @Override
	 public int getClassCnt(String class_no) throws Exception{
		 
		 System.out.println("===> Mybatis getClassCnt() 출력처리");
		 
		 return mybatis.selectOne("class.getClassCnt", class_no);
		 
	 }
	 
	 
	 @Override
	 public int getChefRecipeCnt(String recipe_no) throws Exception{
		 
		 System.out.println("===> Mybatis getChefRecipeCnt() 출력처리");
		 
		 return mybatis.selectOne("recipe.getChefRecipeCnt", recipe_no);
		 
	 }
	 
	 
	 
	 @Override
	 public int getMemCnt(String mem_no) throws Exception{
		 
		 System.out.println("===> Mybatis getMemCnt() 출력처리");
		 
		 return mybatis.selectOne("class.getMemCnt", mem_no);
		 
	 }
	 
	 
	 
	 
	 
}



