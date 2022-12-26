package kr.co.ikosmo.mvc.dao;

import java.util.HashMap;

import kr.co.ikosmo.mvc.vo.SubscribeVO;

public interface SubscribeDAO {

	public int insertScrap(SubscribeVO vo);
	
	public void deleteScrap(SubscribeVO vo) throws Exception;
	
	public int subscribeCnt(HashMap<String,Integer> map);
}
