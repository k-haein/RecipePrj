package kr.co.ikosmo.mvc.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ikosmo.mvc.dao.SubscribeDAO;
import kr.co.ikosmo.mvc.service.SubscribeService;
import kr.co.ikosmo.mvc.vo.SubscribeVO;

@Controller
public class SubscribeController {

		@Autowired
		private SubscribeDAO subscribeDAO;
		@Autowired
		private SubscribeService subscribeService;
		
		// 援щ�� 踰��� ���깊��
		@ResponseBody
		@RequestMapping(value = "/subscribe", method = RequestMethod.POST, produces="application/json; charset=UTF-8")
		public HashMap<String,Integer> subscribe(SubscribeVO vo, HttpSession session, HttpServletRequest request)  throws Exception  {
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			map.put("mem_no", (int)session.getAttribute("memNo"));
			map.put("subscribe_mem_no", Integer.parseInt(request.getParameter("subscribe_mem_no")));
			map.put("kind_tag_no", Integer.parseInt(request.getParameter("kind_tag_no")));
			int result = subscribeDAO.subscribeCnt(map);
			if(result > 0) {
				try {
					vo.setSubscribe_mem_no(Integer.parseInt(request.getParameter("subscribe_mem_no")));
					vo.setMem_no(Integer.parseInt(session.getAttribute("memNo").toString()));
					subscribeService.deleteSubscribe(vo);
					System.out.println("援щ�� ���� ��猷�");
					map.put("success", 1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return map;
			}
			else {
				try {
					vo.setSubscribe_mem_no(Integer.parseInt(request.getParameter("subscribe_mem_no")));
					vo.setMem_no(Integer.parseInt(session.getAttribute("memNo").toString()));
					vo.setKind_tag_no(Integer.parseInt(request.getParameter("kind_tag_no")));
					subscribeService.insertSubscribe(vo);
					map.put("success", 0);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return map;
			}
		}
		
		
		
	
}
