package kr.co.ikosmo.mvc.vo;
//str_pro_no number(5),
//mem_no number(5),
//trd_list_no number(3),
//str_pro_image  varchar2(90)  not null,
//str_pro_detail_image varchar2(90) not null,
//str_pro_content varchar2(200) not null,
//shop_category_no number(4) not null,
//str_pro_name  varchar2(50) not null,
//str_pro_remind  number(3),
//str_pro_primecost number(7)  not null,
//str_pro_salescost number(7)  not null,
//str_pro_show number(1)  not null,
public class StoreVO {

	private int str_pro_no, trd_list_no, mem_no, str_pro_remind, str_pro_primecost, str_pro_salescost, str_pro_show, shop_category_no;
	private String str_pro_image, str_pro_detail_image,str_pro_name, str_pro_content;
	public int getStr_pro_no() {
		return str_pro_no;
	}
	public void setStr_pro_no(int str_pro_no) {
		this.str_pro_no = str_pro_no;
	}
	public int getTrd_list_no() {
		return trd_list_no;
	}
	public void setTrd_list_no(int trd_list_no) {
		this.trd_list_no = trd_list_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getStr_pro_remind() {
		return str_pro_remind;
	}
	public void setStr_pro_remind(int str_pro_remind) {
		this.str_pro_remind = str_pro_remind;
	}
	public int getStr_pro_primecost() {
		return str_pro_primecost;
	}
	public void setStr_pro_primecost(int str_pro_primecost) {
		this.str_pro_primecost = str_pro_primecost;
	}
	public int getStr_pro_salescost() {
		return str_pro_salescost;
	}
	public void setStr_pro_salescost(int str_pro_salescost) {
		this.str_pro_salescost = str_pro_salescost;
	}
	public int getStr_pro_show() {
		return str_pro_show;
	}
	public void setStr_pro_show(int str_pro_show) {
		this.str_pro_show = str_pro_show;
	}
	public int getShop_category_no() {
		return shop_category_no;
	}
	public void setShop_category_no(int shop_category_no) {
		this.shop_category_no = shop_category_no;
	}
	public String getStr_pro_image() {
		return str_pro_image;
	}
	public void setStr_pro_image(String str_pro_image) {
		this.str_pro_image = str_pro_image;
	}
	public String getStr_pro_detail_image() {
		return str_pro_detail_image;
	}
	public void setStr_pro_detail_image(String str_pro_detail_image) {
		this.str_pro_detail_image = str_pro_detail_image;
	}
	public String getStr_pro_name() {
		return str_pro_name;
	}
	public void setStr_pro_name(String str_pro_name) {
		this.str_pro_name = str_pro_name;
	}
	public String getStr_pro_content() {
		return str_pro_content;
	}
	public void setStr_pro_content(String str_pro_content) {
		this.str_pro_content = str_pro_content;
	}
	
	
	
	
	

}
