package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.CheckOutDTO;

public interface CheckOutDao {
	
	public int insertChkOut(CheckOutDTO dto);
	
	public List<CheckOutDTO> getChkOutList(CheckOutDTO dto);
	public List<CheckOutDTO> getChkOutUserList(CheckOutDTO checkOutDTO);
	

}
