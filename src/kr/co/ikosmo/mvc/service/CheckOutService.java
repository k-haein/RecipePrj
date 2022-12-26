package kr.co.ikosmo.mvc.service;

import java.util.List;

import kr.co.ikosmo.mvc.vo.CheckOutDTO;

public interface CheckOutService {
	
	public void insertChkOut(CheckOutDTO dto);
	
	List<CheckOutDTO> getChkOutList(CheckOutDTO dto);

}
