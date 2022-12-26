package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ThemeTagVO;
import kr.co.ikosmo.mvc.vo.KindTagVO;
import kr.co.ikosmo.mvc.vo.MaterialTagVO;
import kr.co.ikosmo.mvc.vo.RecipeReviewVO;

@Repository("recipeDAO")
public class RecipeDAOImpl implements RecipeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int insertRecipe(Recipe_infoVO vo) {
		System.out.println("===> Mybatis insertRecipe() �몄�");
		System.out.println("DAOImpl �ъ� �몄�"+vo.getRecipe_thumbnail());
		return mybatis.insert("recipe.insertRecipe", vo);
	}

	@Override
	public void updateRecipe(Recipe_infoVO vo) {
		System.out.println("===> Mybatis updateRecipe() �몄�");
		System.out.println("사진 업데이트"+vo.getRecipe_thumbnail());
		mybatis.update("recipe.updateRecipe", vo);
	}

	@Override
	public void deleteRecipe(int recipe_no) throws Exception {
		System.out.println("===> Mybatis deleteRecipe() �몄�");
		mybatis.delete("recipe.deleteRecipe", recipe_no);
	}

	@Override
	public Recipe_infoVO getRecipe(Recipe_infoVO vo) throws Exception {
		System.out.println("===> Mybatis getRecipe() �몄�");
		return (Recipe_infoVO) mybatis.selectOne("recipe.getRecipe", vo);
	}

	@Override
	public List<Recipe_infoVO> getRecipeList() {
		System.out.println("===> Mybatis getRecipeList() �몄�");
		List<Recipe_infoVO> v = mybatis.selectList("recipe.getRecipeList");
		return v;
	}
	
	@Override
	public List<Recipe_infoVO> getBestRecipeList() {
		System.out.println("===> Mybatis getBestRecipeList() �몄�");
		List<Recipe_infoVO> v = mybatis.selectList("recipe.weekendBest");
		return v;
	}
	
	@Override
	public void updateRecipeCnt(int recipe_no) throws Exception {
		System.out.println("===> Mybatis updateRecipeCnt() �몄�");
		mybatis.update("recipe.update_recipecnt", recipe_no);
	}
	// 由щ럭 �몄����
	@Override
	public void recipeReviewInsert(RecipeReviewVO rvo) {
		System.out.println("===> Mybatis recipeReviewInsert() �몄�");
		mybatis.insert("recipe_review.RecipeReviewinsert", rvo);
	}
    // 由щ럭 紐⑸�
	@Override
	public List<RecipeReviewVO> getReviewList(int recipe_no) {
		System.out.println("===> Mybatis getReviewList() �몄�");
		List<RecipeReviewVO> v = mybatis.selectList("recipe_review.getReviewList", recipe_no);
		return v;
	}
	// 由щ럭 ����
	@Override
	public void deleteReview(int review_no) throws Exception{
		System.out.println("===> Mybatis deleteReview() �몄�");
		mybatis.delete("recipe_review.deleteReview", review_no);
	}
	
	
	
	/*
	 * @Override public List<Recipe_infoVO> boardWriterSearch(String search_keyword)
	 * { System.out.println("===> Mybatis boardWriterSearch() �몄�");
	 * List<Recipe_infoVO> v =
	 * mybatis.selectList("recipe.boardWriterSearch",search_keyword); return v; }
	 */
	
	@Override
	public List<Recipe_infoVO> recipeSubjectSearch(String recipeSearch_Keyword) {
		System.out.println("===> Mybatis boardSubjectSearch() �몄�");
		List<Recipe_infoVO> search = mybatis.selectList("recipe.recipeSubjectSearch",recipeSearch_Keyword);
		return search;
	}
	@Override
	public List<Recipe_infoVO> recipeContentSearch(String recipeSearch_Keyword) {
		System.out.println("===> Mybatis boardContentSearch() �몄�");
		List<Recipe_infoVO> search = mybatis.selectList("recipe.recipeContentSearch",recipeSearch_Keyword);
		return search;
	}

	@Override
	public HashMap<String, Object> footerCnt() {
		System.out.println("===> Mybatis footerCnt() �몄�");
		HashMap<String, Object> aa = mybatis.selectOne("recipe.footerCnt");
//		System.out.println("recipecnt : "+aa.get("recipecnt"));
		return mybatis.selectOne("recipe.footerCnt");
	}

	
	
	@Override
	public List<Recipe_infoVO> recipeKindTag(int kind_tag_no) {
		System.out.println("===> Mybatis recipeKindTag() �몄�");
		List<Recipe_infoVO> tagsearch = mybatis.selectList("recipe.kindtag", kind_tag_no);
		return tagsearch;
	}
	
	@Override
	public List<Recipe_infoVO> recipeMaterialTag(int material_tag_no) {
		System.out.println("===> Mybatis recipeMaterialTag() �몄�");
		List<Recipe_infoVO> tagsearch = mybatis.selectList("recipe.materialtag", material_tag_no);
		return tagsearch;
	}
	
	@Override
	public List<Recipe_infoVO> recipeThemeTag(int theme_tag_no) {
		System.out.println("===> Mybatis recipeThemeTag() �몄�");
		List<Recipe_infoVO> tagsearch = mybatis.selectList("recipe.themetag", theme_tag_no);
		return tagsearch;
	}

	@Override
	public List<Recipe_infoVO> recipememTag(int mem_no) {
		System.out.println("===> Mybatis recipememTag() �몄�");
		List<Recipe_infoVO> v = mybatis.selectList("recipe.memtag", mem_no);
		return v;
	}

	
	@Override
	public List<KindTagVO> kindtaglist() {
		System.out.println("===> Mybatis kindtaglist() �몄�");
		List<KindTagVO> v = mybatis.selectList("tag.kind_tag");
		return v;
	}

	@Override
	public List<MaterialTagVO> matetaglist() {
		System.out.println("===> Mybatis matetaglist() �몄�");
		List<MaterialTagVO> v = mybatis.selectList("tag.material_tag");
		return v;
	}

	@Override
	public List<ThemeTagVO> themetaglist() {
		System.out.println("===> Mybatis themetaglist() �몄�");
		List<ThemeTagVO> v = mybatis.selectList("tag.theme_tag");
		return v;
	}
	
}
