package kr.co.ikosmo.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.ikosmo.mvc.vo.RecipeReviewVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

public interface RecipeService {
	
	// CRUD 메소드
	// 레시피 등록
	public void insertRecipe(Recipe_infoVO vo);
	
	// 레시피 수정
	public void updateRecipe(Recipe_infoVO vo);
	
	// 레시피 삭제
	public void deleteRecipe(int recipe_no) throws Exception;
	
	// 레시피 상세보기
	public Recipe_infoVO getRecipe(Recipe_infoVO vo) throws Exception;
	
	// 레시피 조회수 증가
	public void updateRecipeCnt(int recipe_no, HttpSession session) throws Exception;
	
	// 레시피 목록 만들기
	public List<Recipe_infoVO> getRecipeList(Recipe_infoVO vo);

	// 리뷰 인서트 Ajax는 나중에
	public void recipeReviewInsert(RecipeReviewVO rvo);  
	
	// 리뷰 셀렉트
	public List<RecipeReviewVO> getReviewList(int recipe_no);
	
	// 리뷰 딜리트
	public void deleteReview(int review_no) throws Exception;
}
