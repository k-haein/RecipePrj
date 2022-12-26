package kr.co.ikosmo.mvc.dao;

import java.util.List;

import kr.co.ikosmo.mvc.vo.ChefVO;

public interface ChefDAO {

	public List<ChefVO> getChefList(ChefVO vo);
	
	public List<ChefVO> chefkind(int kind_tag_no);
	
	public List<ChefVO> bestchef();
	
	public List<ChefVO> chef_KeywordSearch(String search_chef);
}
