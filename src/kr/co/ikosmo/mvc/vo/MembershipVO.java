package kr.co.ikosmo.mvc.vo;
/* 硫ㅻ쾭�뀒�씠釉�
MEM_NO	NUMBER(5,0)
MEM_ID	VARCHAR2(15 BYTE)
MEM_PWD	VARCHAR2(15 BYTE)
MEM_NAME	VARCHAR2(15 BYTE)
MEM_NICKNAME	VARCHAR2(20 BYTE)
MEM_JUMINNUM	CHAR(13 BYTE)
MEM_EMAIL	VARCHAR2(30 BYTE)
MEM_PHONE	CHAR(11 BYTE)
MEM_REGDATE	DATE
MEM_PIC	VARCHAR2(90 BYTE)
MEM_GRADE_NO	VARCHAR2(10 BYTE)
KIND_TAG_NO	NUMBER(2,0)
*/

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class MembershipVO {
	private int mem_no;
	private String mem_id,mem_pwd,mem_name,mem_nickname,
	mem_juminnum,mem_email,mem_phone,mem_regdate,mem_pic,mem_grade_no,kind_tag_no;
	
	
	
	
	

	

	/* �봽濡쒗븘 �궗吏� �뾽濡쒕뱶瑜� �쐞�븳 �뙆�씪 �뾽濡쒕뱶 */
	MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		// �뾽濡쒕뱶 �뙆�씪 �젒洹�
		if(! file.isEmpty()) {
			this.mem_pic = file.getOriginalFilename();
			File f = new File("D:\\FinalProject\\springworkspace\\RecipePrj_01\\WebContent\\resources\\image\\member_upload\\"+mem_pic);

			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* �봽濡쒗븘 �궗吏� �뾽濡쒕뱶瑜� �쐞�븳 �뙆�씪 �뾽濡쒕뱶 */
	
	
	
	
	
	
	
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_juminnum() {
		return mem_juminnum;
	}
	public void setMem_juminnum(String mem_juminnum) {
		this.mem_juminnum = mem_juminnum;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	public String getMem_pic() {
		return mem_pic;
	}
	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	
	public String getMem_grade_no() {
		return mem_grade_no;
	}
	public void setMem_grade_no(String mem_grade_no) {
		this.mem_grade_no = mem_grade_no;
	}
	public String getKind_tag_no() {
		return kind_tag_no;
	}
	public void setKind_tag_no(String kind_tag_no) {
		this.kind_tag_no = kind_tag_no;
	}
}