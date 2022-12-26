package kr.co.ikosmo.mvc.vo;

public class ScrapVO {
	
	private int scrap_no;
	private int mem_no;
	private int recipe_no;
	private String scrap_uploadtime;
	private int scrap_cnt;
	
	//--------------------------------
	//스크랩 페이지에서 레시피 부문 가져오기 위함.
	private Recipe_infoVO recipe_asso;
	private Mypage_ingVO paging_asso;
	//--------------------------------
	
	
	public Recipe_infoVO getRecipe_asso() {
		return recipe_asso;
	}
	public void setRecipe_asso(Recipe_infoVO recipe_asso) {
		this.recipe_asso = recipe_asso;
	}
	public Mypage_ingVO getPaging_asso() {
		return paging_asso;
	}
	public void setPaging_asso(Mypage_ingVO paging_asso) {
		this.paging_asso = paging_asso;
	}
	public int getScrap_no() {
		return scrap_no;
	}
	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getScrap_uploadtime() {
		return scrap_uploadtime;
	}
	public void setScrap_uploadtime(String scrap_uploadtime) {
		this.scrap_uploadtime = scrap_uploadtime;
	}
	public int getScrap_cnt() {
		return scrap_cnt;
	}
	public void setScrap_cnt(int scrap_cnt) {
		this.scrap_cnt = scrap_cnt;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	
	
}
