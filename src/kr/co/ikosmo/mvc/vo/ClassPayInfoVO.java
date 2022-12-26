package kr.co.ikosmo.mvc.vo;





public class ClassPayInfoVO {
	
	private int pay_info_no ,mem_no, class_no;

	
	private String pay_info_type, pay_info_date , str_ord_status;
	
	
	private int ct , rank;
	
	
	
	
	
	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getCt() {
		return ct;
	}

	public void setCt(int ct) {
		this.ct = ct;
	}

	public String getStr_ord_status() {
		return str_ord_status;
	}

	public void setStr_ord_status(String str_ord_status) {
		this.str_ord_status = str_ord_status;
	}

	public String getPay_info_type() {
		return pay_info_type;
	}

	public void setPay_info_type(String pay_info_type) {
		this.pay_info_type = pay_info_type;
	}

	public String getPay_info_date() {
		return pay_info_date;
	}

	public void setPay_info_date(String pay_info_date) {
		this.pay_info_date = pay_info_date;
	}

	public int getPay_info_no() {
		return pay_info_no;
	}

	public void setPay_info_no(int pay_info_no) {
		this.pay_info_no = pay_info_no;
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
	
	
	
	

}
