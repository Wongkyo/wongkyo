package com.to.t1.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping("proSearch")
	public ModelAndView proSearch(ProductVO productVO, Authentication auth2)throws Exception{
		ModelAndView mv = new ModelAndView();		
		List<ProductVO> search = productService.proSearch(productVO);
		mv.addObject("proSearch", search);
		mv.setViewName("product/proSearch");		
		return mv;
	}
	
	// 상품 등록
	@PostMapping("getProfiles")
	public void getProfiles(ProductVO productVO, Model model) throws Exception {
		model.addAttribute("pic", "pic");
	}
	
	@GetMapping("proInsert")
	public String setInsert(@ModelAttribute ProductVO productVO) throws Exception {
		return "product/proInsert";
	}
	
	@RequestMapping(value = "/proInsert2", method = RequestMethod.GET)
	public void proInsertGet() throws Exception {
		System.out.println("********GER Insert");
	}
	
	@RequestMapping(value = "/proInsert2", method = RequestMethod.POST)
	public String proInsert(ProductVO productVO, MultipartFile avatar, HttpSession session, Model model)throws Exception {
		int result = productService.proInsert(productVO, avatar, session);
		return "redirect:/";
	}
	
	// 상품 리스트
	@GetMapping("proList")
	public String proList(Model model, ProductVO productVO, HttpSession session, Authentication auth2)throws Exception {
		List<ProductVO> list = productService.proList(productVO);
		model.addAttribute("list", list);
		return "product/proList";
	}
	
	// 상품 카테고리 리스트
	@GetMapping("proCategory/proAppliances")
	public ModelAndView proAppliances(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		productVO.setProCategory("가전");
		List<ProductVO> appliances = productService.proAppliances(productVO);		
		mv.addObject("appliances", appliances);		
		mv.setViewName("product/proCategory/proAppliances");		
		return mv;
	}
	
	@GetMapping("proCategory/proClothing")
	public ModelAndView proClothing(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		productVO.setProCategory("의류");
		List<ProductVO> clothing = productService.proClothing(productVO);		
		mv.addObject("clothing", clothing);		
		mv.setViewName("product/proCategory/proClothing");		
		return mv;
	}
	
	@GetMapping("proCategory/proNecessity")
	public ModelAndView proNecessity(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		productVO.setProCategory("생필품");
		List<ProductVO> necessity = productService.proNecessity(productVO);		
		mv.addObject("necessity", necessity);		
		mv.setViewName("product/proCategory/proNecessity");		
		return mv;
	}
	
	@GetMapping("proCategory/proMerchandise")
	public ModelAndView proMerchandise(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		productVO.setProCategory("잡화");
		List<ProductVO> merchandise = productService.proMerchandise(productVO);		
		mv.addObject("merchandise", merchandise);		
		mv.setViewName("product/proCategory/proMerchandise");		
		return mv;
	}
	
	@GetMapping("proCategory/proFood")
	public ModelAndView proFood(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();		
		productVO.setProCategory("음식");
		List<ProductVO> food = productService.proFood(productVO);		
		mv.addObject("food", food);		
		mv.setViewName("product/proCategory/proFood");		
		return mv;
	}
	
	// 상품 선택
	@GetMapping("proSelect")
	public ModelAndView proSelect(ProductVO productVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productVO = productService.proSelect(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/proSelect");
		return mv;
	}
	
	// 상품 카테고리 선택
	@GetMapping("proCategory/cateSelect")
	public ModelAndView cateSelect(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = productService.cateSelect(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/proCategory/cateSelect");		
		return mv;
	}
	
	// 상품 업데이트
	@GetMapping("proUpdate") 
	public ModelAndView setUpdate(ProductVO productVO)throws Exception{ 
		ModelAndView mv = new ModelAndView();
		productVO = productService.proSelect(productVO);		  
		mv.addObject("vo", productVO);
		mv.addObject("product", "product");
		mv.setViewName("product/proUpdate");	  
		return mv; }
	
	@PostMapping("proUpdate") 
	public String proUpdate(ProductVO productVO,HttpSession session)throws Exception{
		int result = productService.proUpdate(productVO);	  
		if(result > 0) { session.setAttribute("product", productVO); }	  
		return "redirect:/proList";
	}
 
	// 상품 삭제
	@RequestMapping("proDelete")
	public String proDelete(ProductVO productVO) throws Exception {
		int result = productService.proDelete(productVO);
		return "redirect:/proList";
	}

}
