package kr.co.ikosmo.mvc.service;

import kr.co.ikosmo.mvc.vo.SubscribeVO;

public interface SubscribeService {

	// 구독 인서트
	public void insertSubscribe(SubscribeVO vo);
	
	// 구독 딜리트
	public void deleteSubscribe(SubscribeVO vo) throws Exception;
}
