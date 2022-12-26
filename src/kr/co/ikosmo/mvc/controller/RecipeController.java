package kr.co.ikosmo.mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ikosmo.mvc.dao.RecipeDAO;
import kr.co.ikosmo.mvc.dao.ScrapDAO;
import kr.co.ikosmo.mvc.service.RecipeService;
import kr.co.ikosmo.mvc.vo.KindTagVO;
import kr.co.ikosmo.mvc.vo.MaterialTagVO;
import kr.co.ikosmo.mvc.vo.RecipeReviewVO;
import kr.co.ikosmo.mvc.vo.Recipe_infoVO;
import kr.co.ikosmo.mvc.vo.ThemeTagVO;

@Controller
public class RecipeController {
	
	private static final String DIR_PATH = "D:\\FinalProject\\springworkspace\\RecipePrj_01\\WebContent\\resources\\image\\recipe_upload\\";

	
	private List<Recipe_infoVO> page_list;

	@Autowired
	RecipeService recipeService;

	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private ScrapDAO scrapDAO;
	
	
	// ������ �몄���� 留ㅽ��
	@RequestMapping("/insert_recipe")
	public String insert_recipe(Recipe_infoVO vo, HttpSession session, MultipartHttpServletRequest file, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(vo.getRecipe_thumbnail());
		int memNo = Integer.parseInt(session.getAttribute("memNo").toString());
		vo.setMem_no(memNo);
		recipeService.insertRecipe(vo);
		
		List<MultipartFile> fileList = file.getFiles("file");
		//String path = "D:\\bigdata\\합본 210104\\RecipePrj_01\\WebContent\\resources\\image\\recipe_upload\\";
		
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			
			String safeFile = DIR_PATH + originFileName;
			vo.setRecipe_thumbnail(originFileName);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:/recipe_write_ok"; 
	}
	
   // ���곗�댄�� ���댁� 留ㅽ��
   @RequestMapping( value = "/recipe_update") 
   public String update_recipe(Recipe_infoVO vo, Model model, HttpServletRequest file, MultipartHttpServletRequest mtfRequest) throws Exception {
 	   Recipe_infoVO uprecipe = recipeDAO.getRecipe(vo);
	   model.addAttribute("update", uprecipe);
	   return "tiles/recipe_update";
   }
	 
	// ���곗�댄�� ���� �ㅽ��
	@RequestMapping("/update_recipe")
	public String update(@ModelAttribute("recipeinfo") Recipe_infoVO vo, MultipartHttpServletRequest file) {
		recipeService.updateRecipe(vo);
		
		
		List<MultipartFile> fileList = file.getFiles("file");
		//String path = "D:\\bigdata\\합본 210104\\RecipePrj_01\\WebContent\\resources\\image\\recipe_upload\\";
		
		for (MultipartFile mf : fileList) {
			String originFileName = mf.getOriginalFilename();
			
			String safeFile = DIR_PATH + originFileName;
			vo.setRecipe_thumbnail(originFileName);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/recipe_write_ok"; 
	}
	
	// ������ ����
	@RequestMapping("/deleterecipe")
	public String deleterecipe(@RequestParam int recipe_no) throws Exception {
		recipeService.deleteRecipe(recipe_no);
		return "redirect:recipe_list";
	}
	

	// ������ ���몃낫湲� 留ㅽ�� + 議고���� 利�媛�
	@RequestMapping("/recipe_detail")
	public String getRecipe(Recipe_infoVO vo, RecipeReviewVO rvo, HttpServletRequest request, Model model, HttpSession session, @RequestParam int recipe_no, RedirectAttributes redirectAttribute) throws Exception {
		if (session.getAttribute("memNo") == null) {
			System.out.println("�몄�� �� ���� 泥�由�");
		}
		else {
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			map.put("mem_no", Integer.parseInt(session.getAttribute("memNo").toString()));
			System.out.println(vo.getRecipe_no());
			map.put("recipe_no", vo.getRecipe_no());
			int result = scrapDAO.scrapCnt(map);
			model.addAttribute("result", result);
		}
		
		Recipe_infoVO one = recipeDAO.getRecipe(vo);
		model.addAttribute("detail", one);
		System.out.println("��由� �댁�� : " + one.getRecipe_content());
		//---- �ш린源�吏� ��由� ���몄��蹂� ------
		List<Recipe_infoVO> list = new ArrayList<Recipe_infoVO>();
		list.add(one);
		model.addAttribute("list", list);
		//----- �ш린源�吏� ��由� ���몄��蹂댁���� 諛�蹂듬Ц----
		System.out.println("寃���湲� 踰��� :" + one.getRecipe_no());
		System.out.println("寃���湲� ���깆���� ����踰��� :" + one.getMem_no());
		System.out.println("濡�洹몄�명�� �щ���� ����踰��� :" + session.getAttribute("memNo"));
		System.out.println("寃���湲� ���깆���� ����踰��몄�� 濡�洹몄�명�� �щ���� ����踰��멸� �쇱���硫� ���� 踰���, ���� 踰��쇱�� 蹂댁������");
		
		recipeService.updateRecipeCnt(recipe_no, session);

		List<Recipe_infoVO> thebest = recipeDAO.getBestRecipeList();
		model.addAttribute("best", thebest);
		// -- �ш린源�吏� 議고���� ���곗�댄��
		// ��湲� 紐⑸� ������
		List<RecipeReviewVO> reviewlist = recipeService.getReviewList(rvo.getRecipe_no());
		model.addAttribute("reviewList", reviewlist);
		//redirectAttribute.addFlashAttribute("revlist", reviewlist);
		//review_page_list = reviewlist;
		return "tiles/recipe_detail";
		//return "redirect:/reviewpage";
		//return "forward:/reviewpage";
	}
	

	// ������ 紐⑸� 媛��� 留ㅽ��
	@RequestMapping("/recipe_list")
	public String getrecipelist(RedirectAttributes redirectAttribute, Model model, Recipe_infoVO vo) throws Exception {
		List<Recipe_infoVO> ss = recipeDAO.getRecipeList();
		redirectAttribute.addFlashAttribute("relist", ss);
		page_list = ss;
		return "redirect:/repage";
	}

	// ���댁�
	@RequestMapping("/repage") /* @RequestParam("cmem_no") int mem_no */
	public String repage(HttpServletRequest request, Model model, String page) {
		
		List<Recipe_infoVO> qq = (List) model.asMap().get("relist");
		if (qq != null) {
			System.out.println(qq.get(0).getRecipe_no());
		}

		List<Recipe_infoVO> setPage = new ArrayList<Recipe_infoVO>();
		int page_size = 5;
		// System.out.println("由щ�ㅼ�대���몃� 諛��� 媛� : " + oo.get(0).getNo());
		System.out.println("寃��� 湲� 媛��� : " + page_list.size());
		// System.out.println("BoardList 硫��������� ������ �곗�댄�� : " + qw.get(0).getNo());
		try {

			if (page == null) {
				for (int i = 0; i < page_size; i++) {
					Recipe_infoVO vo = page_list.get(i);
					System.out.println("���댁� 媛��� : "+ page_list.get(i));
					setPage.add(vo);
				}
			} else {

				int paramPage = Integer.parseInt(page);
				if (page_list.size() > page_size * paramPage) {
					for (int i = (page_size * paramPage - page_size); i < page_size * paramPage; i++) {
						Recipe_infoVO vo = page_list.get(i);
						setPage.add(vo);
					}
				} else {
					for (int i = (page_size * paramPage - page_size); i < page_list.size(); i++) {
						Recipe_infoVO vo = page_list.get(i);
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
		// 二쇨� 踰��ㅽ�� ������ 由ъ�ㅽ�몃� 戮�湲�
		List<Recipe_infoVO> thebest = recipeDAO.getBestRecipeList();
		model.addAttribute("best", thebest);
		// ��洹몃ぉ濡� 由ъ�ㅽ�몃� 戮�湲�
		List<KindTagVO> kind = recipeDAO.kindtaglist();
		List<MaterialTagVO> mate = recipeDAO.matetaglist();
		List<ThemeTagVO> theme = recipeDAO.themetaglist();
		//List<Recipe_infoVO> mem = recipeDAO.memrecipelist(mem_no);
		//model.addAttribute("mem", mem);
		model.addAttribute("kind", kind);
		model.addAttribute("mate", mate);
		model.addAttribute("theme", theme);
		

		model.addAttribute("recipe_list", setPage);
		model.addAttribute("p_num", p_num);

		return "tiles/recipe_list";
	}

	
	// ������ 寃��� 留��ㅺ린
	@RequestMapping("/recipeSearch")
	public String recipeSearch(HttpServletRequest request, HttpSession session) {
		
		String recipeSearch_Key = request.getParameter("recipeSearchKey");
		
		String recipeSearch_Keyword = request.getParameter("recipeSearch_Keyword");
		
		if(recipeSearch_Key.equals("재료")) {
			page_list=recipeDAO.recipeContentSearch(recipeSearch_Keyword);
		}else {
			page_list=recipeDAO.recipeSubjectSearch(recipeSearch_Keyword);
		}
		
		session.setAttribute("recipeSearch_Key", recipeSearch_Key);
		
		session.setAttribute("recipeSearch_Keyword", recipeSearch_Keyword);
		
		return "redirect:/repage";
		
	}
	
	
	// 由щ럭 �몄����
	@ResponseBody
	@RequestMapping(value = "/RecipeReviewInsert", produces="application/text; charset=UTF-8")
	public String recipeReviewInsert(RecipeReviewVO rvo, HttpServletRequest request) {
        System.out.println("Ajax濡� �몄���명�� ��湲��� �대�� 湲�踰��� : "+request.getParameter("recipe_no"));
        try{
        	        
            recipeService.recipeReviewInsert(rvo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
	}
	
	// 由щ럭 ����
	@ResponseBody
	@RequestMapping(value = "/reviewDelete", produces="application/text; charset=UTF-8")
	public String reviewDelete(@RequestParam int review_no) throws Exception {
		System.out.println("������ 由щ럭 踰��� : " + review_no);
		try{
	        
			recipeService.deleteReview(review_no);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
	}
	
	//���� 媛���
	@ResponseBody
	@RequestMapping("/classCounter")
	public HashMap<String,Object> classCounter() {
		HashMap<String,Object> classCnt = new HashMap<String,Object>();
		classCnt = recipeDAO.footerCnt();
		System.out.println("recipecnt : "+classCnt.get("recipecnt"));
		System.out.println("chefrecipecnt : "+classCnt.get("chefrecipecnt"));
		System.out.println("classcnt : "+classCnt.get("classcnt"));
		System.out.println("membercnt : "+classCnt.get("membercnt"));
		
		return classCnt;
	}
	
	// ������ kind ��洹몃� 寃���
	@RequestMapping("/kindTagSelect")
	public String kindTagSelect(@RequestParam int kind_tag_no, Recipe_infoVO vo) {
		page_list = recipeDAO.recipeKindTag(kind_tag_no);
		return "redirect:/repage";
	}
	
	// ������ material ��洹몃� 寃���
	@RequestMapping("/materialTagSelect")
	public String materialTagSelect(@RequestParam int material_tag_no, Recipe_infoVO vo) {
		page_list = recipeDAO.recipeMaterialTag(material_tag_no);
		return "redirect:/repage";
	}
	
	// ������ theme ��洹몃� 寃���
	@RequestMapping("/themeTagSelect")
	public String themeTagSelect(@RequestParam int theme_tag_no, Recipe_infoVO vo) {
		page_list = recipeDAO.recipeThemeTag(theme_tag_no);
		return "redirect:/repage";
	}
	
	// ���� 蹂�濡� 寃���
	@RequestMapping("/memTagSelect")
	public String memTagSelect(@RequestParam int mem_no, Recipe_infoVO vo) {
		System.out.println("媛� �ㅼ�댁��"+mem_no);
		page_list = recipeDAO.recipememTag(mem_no);
		return "redirect:/repage";
	}
	
	
	
	

}
