package kr.co.ikosmo.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.ChefDAO;
import kr.co.ikosmo.mvc.dao.RecipeDAO;
import kr.co.ikosmo.mvc.vo.ChefVO;
import kr.co.ikosmo.mvc.vo.KindTagVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;

@Controller
public class ChefController {
	
	private List<ChefVO> page_list;
	
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Autowired
	private ChefDAO chefDAO;
	
	// ���� 紐⑸� ������
	@RequestMapping("/chef_recipe_list")
	public String getChefList(RedirectAttributes redirectAttribute, Model model, ChefVO vo) {
		List<ChefVO> ss = chefDAO.getChefList(vo);
		redirectAttribute.addFlashAttribute("relist", ss);
		page_list = ss;
		return "redirect:/chefpage";
	}
	
	// ���댁�
	@RequestMapping("/chefpage")
	public String chefpage(HttpServletRequest request, Model model, String page) {

		List<ChefVO> qq = (List) model.asMap().get("relist");
		if (qq != null) {
			System.out.println(qq.get(0).getMem_no());
		}

		List<ChefVO> setPage = new ArrayList<ChefVO>();
		int page_size = 5;
		// System.out.println("由щ�ㅼ�대���몃� 諛��� 媛� : " + oo.get(0).getNo());
		System.out.println("寃��� 湲� 媛��� : " + page_list.size());
		// System.out.println("BoardList 硫��������� ������ �곗�댄�� : " + qw.get(0).getNo());
		try {

			if (page == null) {
				for (int i = 0; i < page_size; i++) {
					ChefVO vo = page_list.get(i);
					System.out.println("���댁� 媛��� : "+ page_list.get(i));
					setPage.add(vo);
				}
			} else {

				int paramPage = Integer.parseInt(page);
				if (page_list.size() > page_size * paramPage) {
					for (int i = (page_size * paramPage - page_size); i < page_size * paramPage; i++) {
						ChefVO vo = page_list.get(i);
						setPage.add(vo);
					}
				} else {
					for (int i = (page_size * paramPage - page_size); i < page_list.size(); i++) {
						ChefVO vo = page_list.get(i);
						setPage.add(vo);
					}
				}
			}

		} catch (IndexOutOfBoundsException e) {
			System.out.println("���ъ���� : " + e);
		}

		// ���댁��� ���쇰�명�� 媛��� -> dao -> mapper
		// ���� 踰���, �� 踰��몃�� 蹂���泥�由� �댁�� -> mapper

		int page_num = 0; // 湲� 媛���瑜� �몄�� ���댁� 踰��몃�� �대�� 蹂���

		if (page_list.size() % page_size == 0) {
			page_num = page_list.size() / page_size;

		} else {
			page_num = (int) Math.floor(page_list.size() / page_size) + 1;
		}

		int[] p_num = new int[page_num];

		for (int i = 0; i < p_num.length; i++) {
			p_num[i] = i + 1;
		}
		List<ChefVO> bestchef = chefDAO.bestchef();
		model.addAttribute("bestchef", bestchef);
		
		model.addAttribute("chef_list", setPage);
		model.addAttribute("p_num", p_num);
		
		List<KindTagVO> kind = recipeDAO.kindtaglist();
		model.addAttribute("kind", kind);
		
		return "tiles/chef_recipe_list";
	}
	
	@RequestMapping("/chefkindTagSelect")
	public String chefkindTagSelect(@RequestParam int kind_tag_no, Recipe_infoVO vo) {
		page_list = chefDAO.chefkind(kind_tag_no);
		return "redirect:/chefpage";
	}
	
	@RequestMapping("/chefSearch")
	public String chefSearch(HttpServletRequest request, HttpSession session) {
		
		String chef_Keyword = request.getParameter("chef_Keyword");
		
		page_list = chefDAO.chef_KeywordSearch(chef_Keyword);
		
		//session.setAttribute("chef_Keyword", chef_Keyword);
		
		return "redirect:/chefpage";
	}
	
	
	
}
