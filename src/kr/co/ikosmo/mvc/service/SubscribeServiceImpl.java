package kr.co.ikosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.SubscribeDAO;
import kr.co.ikosmo.mvc.vo.SubscribeVO;

@Service("SubscribeService")
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDAO subscribeDAO;
	
	@Override
	public void insertSubscribe(SubscribeVO vo) {
		subscribeDAO.insertScrap(vo);
	}

	@Override
	public void deleteSubscribe(SubscribeVO vo) throws Exception {
		subscribeDAO.deleteScrap(vo);
	}

}
