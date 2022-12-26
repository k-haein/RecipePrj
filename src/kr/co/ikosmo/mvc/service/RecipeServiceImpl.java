package kr.co.ikosmo.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.RecipeDAOImpl;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.RecipeReviewVO;

@Service("RecipeService")
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDAOImpl recipeDAO;
	
	@Override
	public void insertRecipe(Recipe_infoVO vo) {
		recipeDAO.insertRecipe(vo);
		System.out.println("RecipeService 인서트 사진 호출 :"+vo.getRecipe_thumbnail());
	}

	@Override
	public void updateRecipe(Recipe_infoVO vo) {
		recipeDAO.updateRecipe(vo);
	}

	@Override
	public void deleteRecipe(int recipe_no) throws Exception {
		recipeDAO.deleteRecipe(recipe_no);
	}

	@Override
	public Recipe_infoVO getRecipe(Recipe_infoVO vo) throws Exception {
		return recipeDAO.getRecipe(vo);
	}

	@Override
	public List<Recipe_infoVO> getRecipeList(Recipe_infoVO vo) {
		return recipeDAO.getRecipeList();
	}

	@Override
	public void recipeReviewInsert(RecipeReviewVO rvo) {
		recipeDAO.recipeReviewInsert(rvo);
	}
	
	@Override
	public List<RecipeReviewVO> getReviewList(int recipe_no) {
		return recipeDAO.getReviewList(recipe_no);
	}

	@Override
	public void deleteReview(int review_no) throws Exception{
		recipeDAO.deleteReview(review_no);
	}

	@Override
	public void updateRecipeCnt(int recipe_no, HttpSession session) throws Exception {
		long update_time = 0;
		
		if(session.getAttribute("update_time_"+recipe_no) != null){
			
			update_time = (long)session.getAttribute("update_time_"+recipe_no);
		}
		
		long current_time = System.currentTimeMillis();
		
		if(current_time - update_time > 5*1000){
			
			recipeDAO.updateRecipeCnt(recipe_no);
			
			session.setAttribute("update_time_"+recipe_no, current_time);
			
		}
	}

}
