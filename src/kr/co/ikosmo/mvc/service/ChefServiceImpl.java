package kr.co.ikosmo.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.ChefDAO;
import kr.co.ikosmo.mvc.vo.ChefVO;

@Service("ChefService")
public class ChefServiceImpl implements ChefService {

	@Autowired
	private ChefDAO chefDAO;
	
	@Override
	public List<ChefVO> getChefList(ChefVO vo) {
		return chefDAO.getChefList(vo);
	}
	
}
