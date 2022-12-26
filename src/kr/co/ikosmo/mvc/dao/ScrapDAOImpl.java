package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ScrapVO;

@Repository("ScrapDAO")
public class ScrapDAOImpl implements ScrapDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int insertScrap(ScrapVO vo) {
		System.out.println("===> Mybatis insertScrap() 호출");
		return mybatis.insert("scrap.insert", vo);
	}

	@Override
	public void deleteScrap(ScrapVO vo) throws Exception {
		System.out.println("===> Mybatis deleteScrap() 호출");
		mybatis.delete("scrap.delete", vo);
	}

	@Override
	public int scrapCnt(HashMap<String,Integer> map) {
		System.out.println("===> Mybatis scrapCnt() 호출");
		return mybatis.selectOne("scrap.select", map);
	}

}
