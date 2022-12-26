package kr.co.ikosmo.mvc.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ikosmo.mvc.dao.ScrapDAO;
import kr.co.ikosmo.mvc.dao.SubscribeDAO;
import kr.co.ikosmo.mvc.service.ScrapService;
import kr.co.ikosmo.mvc.service.SubscribeService;
import kr.co.ikosmo.mvc.vo.ScrapVO;

@Controller
public class ScrapController {
	
	@Autowired
	private ScrapDAO scrapDAO;
	
	@Autowired
	private ScrapService scrapService;
	
	
	// �ㅽ�щ�� ���깊��
	@ResponseBody
	@RequestMapping(value ="/scrapcontrol", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
	public HashMap<String,Integer> scrapcontrol(ScrapVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("mem_no", (int)session.getAttribute("memNo"));
		map.put("recipe_no", Integer.parseInt(request.getParameter("recipe_no")));
		int result = scrapDAO.scrapCnt(map);
		if(result > 0) {
			try {
				vo.setRecipe_no(Integer.parseInt(request.getParameter("recipe_no")));
				vo.setMem_no(Integer.parseInt(session.getAttribute("memNo").toString()));
				scrapService.deleteScrap(vo);
				System.out.println("�ㅽ�щ�� ���� ��猷�");
				map.put("success", 1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map;
		}
		else {
			try {
				vo.setRecipe_no(Integer.parseInt(request.getParameter("recipe_no")));
				vo.setMem_no(Integer.parseInt(session.getAttribute("memNo").toString()));
				scrapService.insertScrap(vo);
				System.out.println("�ㅽ�щ�� �깅� ��猷�");
				map.put("success", 1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map;
		}
		
	}
	
	
	
}
