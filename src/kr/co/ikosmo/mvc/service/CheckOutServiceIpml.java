package kr.co.ikosmo.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.CheckOutDaoImpl;
import kr.co.ikosmo.mvc.vo.CheckOutDTO;

@Service("CheckOutService")
public class CheckOutServiceIpml implements CheckOutService{
	
	@Autowired
	private CheckOutDaoImpl checkOutDao;

	@Override
	public void insertChkOut(CheckOutDTO dto){
		checkOutDao.insertChkOut(dto);
	}

	@Override
	public List<CheckOutDTO> getChkOutList(CheckOutDTO dto) {
		return checkOutDao.getChkOutList(dto);
	}
	

}
