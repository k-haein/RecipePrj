package kr.co.ikosmo.mvc.vo;

/*
SUBSCRIBE_NO	NUMBER(5,0)
KIND_TAG_NO	NUMBER(2,0)
MEM_NO	NUMBER(5,0)
SUBSCRIBE_MEM_NO	NUMBER(5,0)
SUBSCRIBE_UPLOADTIME	DATE
*/

public class SubscribeVO {
	

	private int subscribe_no;
	private int kind_tag_no;
	private int mem_no;
	private int subscribe_mem_no;
	private String subscribe_uploadtime;
	
	//--------------------------------	
	//援щ���� �� 硫ㅻ����대� ����
	private MembershipVO member_asso;
	//--------------------------------
	
	public int getSubscribe_no() {
		return subscribe_no;
	}

	public void setSubscribe_no(int subscribe_no) {
		this.subscribe_no = subscribe_no;
	}

	public int getKind_tag_no() {
		return kind_tag_no;
	}

	public void setKind_tag_no(int kind_tag_no) {
		this.kind_tag_no = kind_tag_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public int getSubscribe_mem_no() {
		return subscribe_mem_no;
	}

	public void setSubscribe_mem_no(int subscribe_mem_no) {
		this.subscribe_mem_no = subscribe_mem_no;
	}

	public String getSubscribe_uploadtime() {
		return subscribe_uploadtime;
	}

	public void setSubscribe_uploadtime(String subscribe_uploadtime) {
		this.subscribe_uploadtime = subscribe_uploadtime;
	}

	public MembershipVO getMember_asso() {
		return member_asso;
	}

	public void setMember_asso(MembershipVO member_asso) {
		this.member_asso = member_asso;
	}
	
	
}
