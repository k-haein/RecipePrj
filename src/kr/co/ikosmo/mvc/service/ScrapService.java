package kr.co.ikosmo.mvc.service;

import java.util.List;
import java.util.Map;

import kr.co.ikosmo.mvc.vo.ScrapVO;

public interface ScrapService {

	// 스크랩 인서트
	public void insertScrap(ScrapVO vo);
	
	// 스크랩 딜리트
	public void deleteScrap(ScrapVO vo) throws Exception;
	
	// 스크랩 리스트
	//public ScrapVO getScrap(Map<String, Object> m);
}
