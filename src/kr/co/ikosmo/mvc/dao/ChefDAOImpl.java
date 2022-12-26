package kr.co.ikosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ChefVO;

@Repository
public class ChefDAOImpl implements ChefDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 
	@Override
	public List<ChefVO> getChefList(ChefVO vo) {
		System.out.println("===> Mybatis getChefList() 호출");
		List<ChefVO> v = mybatis.selectList("chef.cheflist", vo);
		return v;
	}

	@Override
	public List<ChefVO> chefkind(int kind_tag_no) {
		System.out.println("===> Mybatis chefkind() 호출");
		List<ChefVO> v = mybatis.selectList("chef.kindtag", kind_tag_no);
		return v;
	}

	@Override
	public List<ChefVO> bestchef() {
		System.out.println("===> Mybatis bestchef() 호출");
		List<ChefVO> v = mybatis.selectList("chef.subrank");
		return v;
	}

	@Override
	public List<ChefVO> chef_KeywordSearch(String search_chef) {
		List<ChefVO> v = mybatis.selectList("chef.chefSearch", search_chef);
		return v;
	}
	
}
