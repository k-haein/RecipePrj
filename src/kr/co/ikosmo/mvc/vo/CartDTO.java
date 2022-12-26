package kr.co.ikosmo.mvc.vo;

public class CartDTO {
	
	private int str_cart_no;
	private int mem_no;
	private int str_pro_no;  
	private int str_pro_primecost;
	private int str_cart_cnt;
	private int sum_str_pro_primecost;
	
	private String mem_id,str_pro_name,str_pro_image;

	public int getStr_cart_no() {
		return str_cart_no;
	}

	public void setStr_cart_no(int str_cart_no) {
		this.str_cart_no = str_cart_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getStr_pro_no() {
		return str_pro_no;
	}

	public void setStr_pro_no(int str_pro_no) {
		this.str_pro_no = str_pro_no;
	}

	public int getStr_pro_primecost() {
		return str_pro_primecost;
	}

	public void setStr_pro_primecost(int str_pro_primecost) {
		this.str_pro_primecost = str_pro_primecost;
	}

	public int getStr_cart_cnt() {
		return str_cart_cnt;
	}

	public void setStr_cart_cnt(int str_cart_cnt) {
		this.str_cart_cnt = str_cart_cnt;
	}

	public int getSum_str_pro_primecost() {
		return sum_str_pro_primecost;
	}

	public void setSum_str_pro_primecost(int sum_str_pro_primecost) {
		this.sum_str_pro_primecost = sum_str_pro_primecost;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getStr_pro_name() {
		return str_pro_name;
	}

	public void setStr_pro_name(String str_pro_name) {
		this.str_pro_name = str_pro_name;
	}

	public String getStr_pro_image() {
		return str_pro_image;
	}

	public void setStr_pro_image(String str_pro_image) {
		this.str_pro_image = str_pro_image;
	}

	

}
