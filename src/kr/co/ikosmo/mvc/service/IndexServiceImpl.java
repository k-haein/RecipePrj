package kr.co.ikosmo.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.IndexDAO;
import kr.co.ikosmo.mvc.vo.ClassVO;

@Service("indexservice")
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexDAO indexdao;
	
	
	
	public List<ClassVO> getMainList(ClassVO vo){
		
		return indexdao.getMainList(vo);
	}


	
	
	
}
