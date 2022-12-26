package kr.co.ikosmo.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ikosmo.mvc.dao.IndexDAO;
import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;



@Controller
public class IndexController {
	
	@Autowired
	private IndexDAO indexdao;
	
	


	@RequestMapping("/{step}")
	public String viewPage(@PathVariable String step) {
		return "tiles/" + step;
	}

	
	
	@RequestMapping("/index")

	public String doindex(Model model) {

		return "redirect:/goindex";

	}

	@RequestMapping(value = "/goindex")
	private String goIndex(ClassVO vo, Recipe_infoVO ro, String recipe_no, String class_no, String mem_no, Model model)
			throws Exception {

		model.addAttribute("mainList", indexdao.getMainList(vo));
		
		model.addAttribute("recipeList", indexdao.getBestRecipe(ro));
		
		int count = indexdao.getRecipeCnt(recipe_no);

		model.addAttribute("count", count);

		int classcount = indexdao.getClassCnt(class_no);

		model.addAttribute("classcount", classcount);

		int chefcount = indexdao.getChefRecipeCnt(recipe_no);

		model.addAttribute("chefcount", chefcount);

		int memcount = indexdao.getMemCnt(mem_no);

		model.addAttribute("memcount", memcount);

		return "aaa/bbb/index";
		
		
	}
	
	
	

}
