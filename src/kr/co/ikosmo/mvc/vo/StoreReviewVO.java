package kr.co.ikosmo.mvc.vo;
//store_review_no  number(5),
//str_pro_no number(5),
//mem_no  number(5) not null,
//mem_name varchar2(15) not null,
//star_rate  number(1) not null,
//store_review_content  varchar2(80) not null,
//store_review_date  date default sysdate,
public class StoreReviewVO {
	private int store_review_no, str_pro_no, mem_no,score;
	private String mem_name, store_review_content,email, store_review_date;
	public int getStore_review_no() {
		return store_review_no;
	}
	public void setStore_review_no(int store_review_no) {
		this.store_review_no = store_review_no;
	}
	public int getStr_pro_no() {
		return str_pro_no;
	}
	public void setStr_pro_no(int str_pro_no) {
		this.str_pro_no = str_pro_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getStore_review_content() {
		return store_review_content;
	}
	public void setStore_review_content(String store_review_content) {
		this.store_review_content = store_review_content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStore_review_date() {
		return store_review_date;
	}
	public void setStore_review_date(String store_review_date) {
		this.store_review_date = store_review_date;
	}
	
	
	
	
}
