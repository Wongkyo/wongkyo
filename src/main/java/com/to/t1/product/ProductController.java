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

	// productService 주입
	@Autowired
	private ProductService productService;

	// 상품 검색(미구현) -------------------------------------------------------------------------------
	@GetMapping("proSearch")
	public ModelAndView proSearch(ProductVO productVO, Authentication auth2)throws Exception{
		ModelAndView mv = new ModelAndView();		
		List<ProductVO> search = productService.proSearch(productVO);
		mv.addObject("proSearch", search);
		mv.setViewName("product/proSearch");		
		return mv;
	}
	
	// 상품 등록 -------------------------------------------------------------------------------------	
	// getMapping으로 proInsert페이지로 이동
	@GetMapping("proInsert")
	public String setInsert(@ModelAttribute ProductVO productVO) throws Exception {
		return "product/proInsert";
	}
	
	// postMapping으로 입력한 값을 보내기
	@SuppressWarnings("unused")
	@RequestMapping(value = "/proInsert2", method = RequestMethod.POST)
	public String proInsert(ProductVO productVO, MultipartFile avatar, HttpSession session, Model model)throws Exception {
		// 서비스에서 return 값으로 proInsert 가져오기
		int result = productService.proInsert(productVO, avatar, session);
		// 상품등록후 홈화면으로 이동
		return "redirect:/";
	}

	// 상품 리스트 -----------------------------------------------------------------------------------
	// 상품 전체 리스트 
	// getMapping으로 상품 리스트로 이동
	@GetMapping("proList")
	public String proList(Model model, ProductVO productVO, HttpSession session, Authentication auth2)throws Exception {
		// 리스트 형태로 proList 호출
		List<ProductVO> list = productService.proList(productVO);
		// model에 list 파라미터 담기
		model.addAttribute("list", list);
		return "product/proList";
	}
	
	// 상품 전자 리스트
	// getMapping으로 proCategory에 있는 proAppliaces 페이지 출력
	@GetMapping("proCategory/proAppliances")
	public ModelAndView proAppliances(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();		
		// productVO의 변수 proCategory에서 이름이 "가전"인 변수 호출
		productVO.setProCategory("가전");
		// appliances list를 호출하여 appliances 변수에 담기
		List<ProductVO> appliances = productService.proAppliances(productVO);		
		// 모델앤뷰에 appliances 주입
		mv.addObject("appliances", appliances);		
		// 이동할 파일 정보 입력
		mv.setViewName("product/proCategory/proAppliances");	
		// 모델앤뷰 리턴
		return mv;
	}

	// 상품 의류 리스트
	// getMapping으로 proCategory에 있는 proClothing 페이지 출력
	@GetMapping("proCategory/proClothing")
	public ModelAndView proClothing(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();	
		// productVO의 변수 proCategory에서 이름이 "의류"인 변수 호출
		productVO.setProCategory("의류");
		// clothing list를 호출하여 clothing 변수에 담기
		List<ProductVO> clothing = productService.proClothing(productVO);		
		// 모델앤뷰에 clothing 주입 
		mv.addObject("clothing", clothing);		
		// 이동할 파일 정보 입력
		mv.setViewName("product/proCategory/proClothing");		
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 생필품 리스트
	// getMapping으로 proCategory에 있는 proNecessity 페이지 출력
	@GetMapping("proCategory/proNecessity")
	public ModelAndView proNecessity(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();		
		// productVO의 변수 proCategory에서 이름이 "생필품"인 변수 호출
		productVO.setProCategory("생필품");
		// necessity list를 호출하여 necessity 변수에 담기
		List<ProductVO> necessity = productService.proNecessity(productVO);		
		// 모델앤뷰에 necessity 주입
		mv.addObject("necessity", necessity);		
		// 이동할 파일 정보 입력
		mv.setViewName("product/proCategory/proNecessity");		
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 생필품 리스트
	// getMapping으로 proCategory에 있는 proMerchandise 페이지 출력
	@GetMapping("proCategory/proMerchandise")
	public ModelAndView proMerchandise(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();		
		// productVO의 변수 proCategory에서 이름이 "잡화"인 변수 호출
		productVO.setProCategory("잡화");
		// merchandise list를 호출하여 merchandise 변수에 담기
		List<ProductVO> merchandise = productService.proMerchandise(productVO);		
		// 모델앤뷰에 merchandise 주입
		mv.addObject("merchandise", merchandise);		
		// 이동할 파일 정보 입력
		mv.setViewName("product/proCategory/proMerchandise");		
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 생필품 리스트
	// getMapping으로 proCategory에 있는 proFood 페이지 출력
	@GetMapping("proCategory/proFood")
	public ModelAndView proFood(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();		
		// productVO의 변수 proCategory에서 이름이 "음식"인 변수 호출
		productVO.setProCategory("음식");
		// food list를 호출하여 food 변수에 담기
		List<ProductVO> food = productService.proFood(productVO);		
		// 모델앤뷰에 food 주입
		mv.addObject("food", food);		
		// 이동할 파일 정보 입력
		mv.setViewName("product/proCategory/proFood");		
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 선택
	// getMapping으로 상품 선택 페이지로 이동
	@GetMapping("proSelect")
	public ModelAndView proSelect(ProductVO productVO) throws Exception {
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		// productVO의 service의 proSelect 주입
		productVO = productService.proSelect(productVO);
		// productVO를 vo에 담기
		mv.addObject("vo", productVO);
		// 이동할 파일 정보를 입력
		mv.setViewName("product/proSelect");
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 카테고리 선택
	// getMapping으로 상품 카테고리별 선택 페이지로 이동
	@GetMapping("proCategory/cateSelect")
	public ModelAndView cateSelect(ProductVO productVO)throws Exception{
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		// productVO의 service의 cateSelect 주입
		productVO = productService.cateSelect(productVO);
		// productVO를 vo에 담기
		mv.addObject("vo", productVO);
		// 이동할 파일 정보를 입력
		mv.setViewName("product/proCategory/cateSelect");		
		// 모델앤뷰 리턴
		return mv;
	}
	
	// 상품 업데이트
	// getMapping으로 상품 수정 페이지로 이동 
	@GetMapping("proUpdate") 
	public ModelAndView setUpdate(ProductVO productVO)throws Exception{ 
		// 모델앤뷰 생성
		ModelAndView mv = new ModelAndView();
		// productVO에 service의 proSelect 주입
		productVO = productService.proSelect(productVO);		  
		// productVO를 vo에 담기
		mv.addObject("vo", productVO);
		// 이동할 파일 정보를 입력
		mv.setViewName("product/proUpdate");	  
		// 모델앤뷰 리턴
		return mv; }
	
	// postMapping으로 업데이트할 정보 값 보내ㅣ
	@PostMapping("proUpdate") 
	public String proUpdate(ProductVO productVO,HttpSession session)throws Exception{
		// result에 proUpdate 매퍼 주입
		int result = productService.proUpdate(productVO);	  
		// result가 0보다 클때 즉 값이 존재하므로 업데이트 ㅅ행
		if(result > 0) { session.setAttribute("product", productVO); }	  
		// 업데이트 완료후 proList로 이동
		return "redirect:/proList";
	}
 
	// 상품 삭제
	// requestMapping으로 proDelete 값 받기
	@SuppressWarnings("unused")
	@RequestMapping("proDelete")
	public String proDelete(ProductVO productVO) throws Exception {
		// 서비스에 result값으로 proDelete 가져오기
		int result = productService.proDelete(productVO);
		// 삭제 완료후 proList로 이동
		return "redirect:/proList";
	}

}
