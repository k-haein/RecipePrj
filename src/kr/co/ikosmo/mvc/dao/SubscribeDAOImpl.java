package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.SubscribeVO;

@Repository("SubscribeDAO")
public class SubscribeDAOImpl implements SubscribeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int subscribeCnt(HashMap<String, Integer> map) {
		System.out.println("===> Mybatis subscribeCnt() 호출");
		return mybatis.selectOne("subscribe.select", map);
	}

	@Override
	public int insertScrap(SubscribeVO vo) {
		System.out.println("===> Mybatis insertScrap() 호출");
		return mybatis.insert("subscribe.insert", vo);
	}

	@Override
	public void deleteScrap(SubscribeVO vo) throws Exception {
		System.out.println("===> Mybatis deleteScrap() 호출");
		mybatis.delete("subscribe.delete",vo);
	}

}
