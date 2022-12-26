package kr.co.ikosmo.mvc.vo;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


/*
CLASS_NO	NUMBER(5,0)
MEM_NO	NUMBER(5,0)
CLASS_TITLE	VARCHAR2(80 BYTE)
CLASS_THUMBNAIL	VARCHAR2(80 BYTE)
CLASS_CONTENT	VARCHAR2(800 BYTE)
CLASS_RECIPE_VIDEO	VARCHAR2(80 BYTE)
MATE_NAME	VARCHAR2(600 BYTE)
MATE_CNT	VARCHAR2(600 BYTE)
STEP	VARCHAR2(800 BYTE)
CLASS_PRICE	NUMBER(7,0)
CLASS_PERIOD	VARCHAR2(20 BYTE)
CLASS_COOKTIME	VARCHAR2(20 BYTE)
CLASS_DETAIL_INFO	VARCHAR2(600 BYTE)
KIND_TAG_NO	NUMBER(4,0)
THEME_TAG_NO	NUMBER(4,0)
MATERIAL_TAG_NO	NUMBER(4,0)
CLASS_UPLOADTIME	DATE
VIEW_CNT	NUMBER
ADMIN_APP	NUMBER(4,0)
 */



public class ClassVO {
	
	
	private int class_no , mem_no  , class_price  ,admin_app     ;
	
	private String class_title    , class_cooktime,  class_period , class_thumbnail    , class_content   ;
	
	private String  class_recipe_video ,mate_name,step , mate_cnt ;
	
	
	private int kind_tag_no  ,theme_tag_no  , material_tag_no ,view_cnt   ;
		
	private String class_detail_info  , class_uploadtime    ;
	
	
	private int cot, rank;
	
	
	private KindTagVO kindtag;
		
	private ThemeTagVO themetag;
	
	private MaterialTagVO material;			

	private ClassMemberVO member;	
	
	private ReviewVO review;
	
	private ClassPayInfoVO payinfo;
	
	
		
	
	
MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()) {
			this.class_thumbnail = file.getOriginalFilename();			
					
		}
	}
	

	
	
	public int getCot() {
		return cot;
	}
	public void setCot(int cot) {
		this.cot = cot;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public String getClass_title() {
		return class_title;
	}
	public void setClass_title(String class_title) {
		this.class_title = class_title;
	}
	public String getClass_cooktime() {
		return class_cooktime;
	}
	public void setClass_cooktime(String class_cooktime) {
		this.class_cooktime = class_cooktime;
	}
	public String getClass_period() {
		return class_period;
	}
	public void setClass_period(String class_period) {
		this.class_period = class_period;
	}
	public String getClass_thumbnail() {
		return class_thumbnail;
	}
	public void setClass_thumbnail(String class_thumbnail) {
		this.class_thumbnail = class_thumbnail;
	}
	public String getClass_content() {
		return class_content;
	}
	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}
	
	public String getClass_recipe_video() {
		return class_recipe_video;
	}
	public void setClass_recipe_video(String class_recipe_video) {
		this.class_recipe_video = class_recipe_video;
	}
	
	
	public ClassPayInfoVO getPayinfo() {
		return payinfo;
	}
	public void setPayinfo(ClassPayInfoVO payinfo) {
		this.payinfo = payinfo;
	}
	public String getMate_name() {
		return mate_name;
	}
	public void setMate_name(String mate_name) {
		this.mate_name = mate_name;
	}
	
	
	public int getAdmin_app() {
		return admin_app;
	}
	public void setAdmin_app(int admin_app) {
		this.admin_app = admin_app;
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
	public String getClass_detail_info() {
		return class_detail_info;
	}
	public void setClass_detail_info(String class_detail_info) {
		this.class_detail_info = class_detail_info;
	}

	
	
	public String getClass_uploadtime() {
		return class_uploadtime;
	}
	public void setClass_uploadtime(String class_uploadtime) {
		this.class_uploadtime = class_uploadtime;
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
	public ClassMemberVO getMember() {
		return member;
	}
	public void setMember(ClassMemberVO member) {
		this.member = member;
	}
	public ReviewVO getReview() {
		return review;
	}
	public void setReview(ReviewVO review) {
		this.review = review;
	}
	   
	   
	
}
