package kr.co.ikosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.CheckOutDTO;

@Repository
public class CheckOutDaoImpl implements CheckOutDao {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public int insertChkOut(CheckOutDTO dto) {
		System.out.println("insrtChkOut() 호출");
		int cnt = ss.insert("chkoutdto.insertChkOut", dto);
		
		if(cnt > 0) {
			ss.selectOne("chkoutdto.selectOrderNo");
			ss.insert("chkoutdto.insertOrder", dto);
			ss.delete("chkoutdto.deleteCart", dto);
		}
		return cnt;
	}

	@Override
	public List<CheckOutDTO> getChkOutList(CheckOutDTO dto) {
		System.out.println("getChkOutList() 호출");
		List<CheckOutDTO> p = ss.selectList("chkoutdto.getChkOutList", dto);
		return p;
	}

	@Override
	public List<CheckOutDTO> getChkOutUserList(CheckOutDTO checkOutDTO) {
		System.out.println("getChkOutUserList() 호출");
		List<CheckOutDTO> c = ss.selectList("chkoutdto.getChkOutUserList", checkOutDTO);
		return c;
	}
	

}
