package kr.co.ikosmo.mvc.service;

import java.util.List;

import kr.co.ikosmo.mvc.vo.ChefVO;

public interface ChefService {
	
	// 쉐프 목록
	List<ChefVO> getChefList(ChefVO vo);

}
