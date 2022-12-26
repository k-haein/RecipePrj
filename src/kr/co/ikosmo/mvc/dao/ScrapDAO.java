package kr.co.ikosmo.mvc.dao;


import java.util.HashMap;

import kr.co.ikosmo.mvc.vo.ScrapVO;

public interface ScrapDAO {
	
	// 스크랩 인서트
	public int insertScrap(ScrapVO vo);
	
	// 스크랩 딜리트
	public void deleteScrap(ScrapVO vo) throws Exception;
	
	// 스크랩 갯수 세기
	public int scrapCnt(HashMap<String,Integer> map); 
}
