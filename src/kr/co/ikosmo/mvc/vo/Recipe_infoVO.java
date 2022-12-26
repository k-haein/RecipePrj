package kr.co.ikosmo.mvc.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Recipe_infoVO {

	private int recipe_no;
	private int mem_no;	
	private int scrap_no;
	private int scrap_cnt;	
	private String mem_nickname;

	private String recipe_title;
	private String recipe_thumbnail;
	private String recipe_video;
	private String recipe_content;
	private String recipe_time;
	private String recipe_level;
	private String mate_name;
	private String mate_cnt;
	private String step;
	private int visit_cnt;
	private int report_cnt;
	private int kind_tag_no;
	private int theme_tag_no;
	private int material_tag_no;
	private int review_no;
	private String recipe_uploadtime;
	private int rank;
	
	private ClassMemberVO member;
	private KindTagVO kindtag;
	private ThemeTagVO themetag;
	private MaterialTagVO material;		
	private ReviewVO review;
	private ScrapVO scrap;
	
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()) {
			this.recipe_thumbnail = file.getOriginalFilename();
			
		}
		
	}
	
	
	
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getRecipe_title() {
		return recipe_title;
	}
	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}
	public String getRecipe_thumbnail() {
		return recipe_thumbnail;
	}
	public void setRecipe_thumbnail(String recipe_thumbnail) {
		this.recipe_thumbnail = recipe_thumbnail;
	}
	public String getRecipe_video() {
		return recipe_video;
	}
	public void setRecipe_video(String recipe_video) {
		this.recipe_video = recipe_video;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getRecipe_time() {
		return recipe_time;
	}
	public void setRecipe_time(String recipe_time) {
		this.recipe_time = recipe_time;
	}
	public String getRecipe_level() {
		return recipe_level;
	}
	public void setRecipe_level(String recipe_level) {
		this.recipe_level = recipe_level;
	}
	public String getMate_name() {
		return mate_name;
	}
	public void setMate_name(String mate_name) {
		this.mate_name = mate_name;
	}
	public String getMate_cnt() {
		return mate_cnt;
	}
	public void setMate_cnt(String mate_cnt) {
		this.mate_cnt = mate_cnt;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public int getVisit_cnt() {
		return visit_cnt;
	}
	public void setVisit_cnt(int visit_cnt) {
		this.visit_cnt = visit_cnt;
	}
	public int getReport_cnt() {
		return report_cnt;
	}
	public void setReport_cnt(int report_cnt) {
		this.report_cnt = report_cnt;
	}
	public int getKind_tag_no() {
		return kind_tag_no;
	}
	public void setKind_tag_no(int kind_tag_no) {
		this.kind_tag_no = kind_tag_no;
	}
	public int getTheme_tag_no() {
		return theme_tag_no;
	}
	public void setTheme_tag_no(int theme_tag_no) {
		this.theme_tag_no = theme_tag_no;
	}
	public int getMaterial_tag_no() {
		return material_tag_no;
	}
	public void setMaterial_tag_no(int material_tag_no) {
		this.material_tag_no = material_tag_no;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getRecipe_uploadtime() {
		return recipe_uploadtime;
	}
	public void setRecipe_uploadtime(String recipe_uploadtime) {
		this.recipe_uploadtime = recipe_uploadtime;
	}
	public ClassMemberVO getMember() {
		return member;
	}
	public void setMember(ClassMemberVO member) {
		this.member = member;
	}
	public KindTagVO getKindtag() {
		return kindtag;
	}
	public void setKindtag(KindTagVO kindtag) {
		this.kindtag = kindtag;
	}
	public ThemeTagVO getThemetag() {
		return themetag;
	}
	public void setThemetag(ThemeTagVO themetag) {
		this.themetag = themetag;
	}
	public MaterialTagVO getMaterial() {
		return material;
	}
	public void setMaterial(MaterialTagVO material) {
		this.material = material;
	}
	public ReviewVO getReview() {
		return review;
	}
	public void setReview(ReviewVO review) {
		this.review = review;
	}
	public int getScrap_no() {
		return scrap_no;
	}
	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getScrap_cnt() {
		return scrap_cnt;
	}
	public void setScrap_cnt(int scrap_cnt) {
		this.scrap_cnt = scrap_cnt;
	}
	public ScrapVO getScrap() {
		return scrap;
	}
	public void setScrap(ScrapVO scrap) {
		this.scrap = scrap;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
	
	
	
	
	
	
	
	
}
