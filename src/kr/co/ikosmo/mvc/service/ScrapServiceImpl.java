package kr.co.ikosmo.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ikosmo.mvc.dao.ScrapDAO;
import kr.co.ikosmo.mvc.vo.ScrapVO;

@Service("ScrapService")
public class ScrapServiceImpl implements ScrapService{

	@Autowired
	private ScrapDAO scrapDAO;
	
	@Override
	public void insertScrap(ScrapVO vo) {
		scrapDAO.insertScrap(vo);
	}

	@Override
	public void deleteScrap(ScrapVO vo) throws Exception {
		scrapDAO.deleteScrap(vo);
	}

}
