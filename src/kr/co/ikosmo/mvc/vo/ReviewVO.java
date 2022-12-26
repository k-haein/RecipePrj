package kr.co.ikosmo.mvc.vo;


/*
REVIEW_NO	NUMBER(5,0)
MEM_NO	NUMBER(5,0)
CLASS_NO	NUMBER(5,0)
RECIPE_NO	NUMBER(4,0)
TYPE	VARCHAR2(10 BYTE)
STAR_RATE	NUMBER(1,0)
REVIEW_CONTENT	VARCHAR2(80 BYTE)
REVIEW_DATE	DATE
REVIEW_DECLARE	NUMBER(3,0)
 * 
 */



public class ReviewVO {
	
	
	private int review_no  ,mem_no  ,class_no, recipe_no  ,star_rate ,review_declare    ;
	
	private String type , review_content  ,review_date ;
	
	
	//--------------------------------------
	//리뷰 페이지에서 레시피 부문 가져오기 위함.
	private Recipe_infoVO recipe2_asso;
	//--------------------------------------
	public Recipe_infoVO getRecipe2_asso() {
		return recipe2_asso;
	}

	public void setRecipe2_asso(Recipe_infoVO recipe2_asso) {
		this.recipe2_asso = recipe2_asso;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public int getStar_rate() {
		return star_rate;
	}

	public void setStar_rate(int star_rate) {
		this.star_rate = star_rate;
	}

	public int getReview_declare() {
		return review_declare;
	}

	public void setReview_declare(int review_declare) {
		this.review_declare = review_declare;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	
	
	
	
	
	
	
	
	

}
