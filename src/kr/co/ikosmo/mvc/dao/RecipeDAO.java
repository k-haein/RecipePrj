package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.ikosmo.mvc.vo.ChefVO;
import kr.co.ikosmo.mvc.vo.KindTagVO;
import kr.co.ikosmo.mvc.vo.MaterialTagVO;
import kr.co.ikosmo.mvc.vo.RecipeReviewVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ThemeTagVO;

public interface RecipeDAO {
	
	// ������ �깅�
	public int insertRecipe(Recipe_infoVO vo);
	// ������ ����
	public void updateRecipe(Recipe_infoVO vo);
	// ������ ����
	public void deleteRecipe(int recipe_no) throws Exception;
	// ������ ���몃낫湲�
	public Recipe_infoVO getRecipe(Recipe_infoVO vo) throws Exception;
	// ������ 紐⑸�
	public List<Recipe_infoVO> getRecipeList();
	// 異�泥� ������ 紐⑸�
	public List<Recipe_infoVO> getBestRecipeList();
	// ������ 議고���� 利�媛�
	public void updateRecipeCnt(int recipe_no) throws Exception;
	
	// ������ ��湲� �몄����
	public void recipeReviewInsert(RecipeReviewVO rvo);
	// ��湲� 紐⑸�
	public List<RecipeReviewVO> getReviewList(int recipe_no);
	// ��湲� ����
	public void deleteReview(int review_no) throws Exception;
	
	//���� 媛���
	public HashMap<String,Object> footerCnt();
	
	// ����醫�瑜� ��洹몃� 寃���
	public List<Recipe_infoVO> recipeKindTag(int kind_tag_no);
	
	// �щ� ��洹몃� 寃���
	public List<Recipe_infoVO> recipeMaterialTag(int material_tag_no);
	
	// ���⑸� ��洹몃� 寃���
	public List<Recipe_infoVO> recipeThemeTag(int theme_tag_no);
	
	public List<Recipe_infoVO> recipememTag(int mem_no);
	
	// ��洹� 紐⑸� 由ъ�ㅽ�몃� 戮�湲�
	public List<KindTagVO> kindtaglist();
	public List<MaterialTagVO> matetaglist();
	public List<ThemeTagVO> themetaglist();
	
	// ��以��� 寃������� �멸���
	// public List<Recipe_infoVO> boardWriterSearch(String search_keyword) ;
	
	public List<Recipe_infoVO> recipeSubjectSearch(String search_keyword) ;
	
	public List<Recipe_infoVO> recipeContentSearch(String search_keyword) ;
	
	
	
}
