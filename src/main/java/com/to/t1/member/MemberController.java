package com.to.t1.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	
	// 로그관리
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 주입
	@Autowired
	private MemberService memberService;

		// 관리자 페이지 ------------------------------------------------------------------------------------------------------
		// 멤버중 관리자 아이디를 만들어 관리자아이디만 들어갈수 있는 페이지를 생성, 추후 관리자 기능 추가예정
		@GetMapping("memberAdmin")
		public String memberAdmin(MemberVO memberVO)throws Exception{
			return "member/memberAdmin";
		}
	
		//멤버 조인 -------------------------------------------------------------------------------------------------------
	
		// getMapping으로 join페이지로 이동
		@GetMapping("memberJoin")
		public String setJoin(@ModelAttribute MemberVO memberVO)throws Exception{
			return "member/memberJoin";
		}
	 
		// 멤버 정보입력을 위한 postMapping
	    @SuppressWarnings("unused")
		@RequestMapping(value="/register", method=RequestMethod.POST)
	    public String memberRegister(MemberVO memberVO, MultipartFile avatar, HttpSession session, Model model) throws Exception {	 
	    	// 서비스에 result값으로 회원가입 서비스 가져오기
	    	int result = memberService.memberRegister(memberVO, avatar, session);	
	    	    logger.info("***********register POST");
	    	// 회원가입시 아이디 중복 방지를 위해 idCheck 서비스 가져오기    
	        int count = memberService.idCheck(memberVO.getUserId());	        
	        try {
	        	// 멤버의 매퍼에서 카운트가 0일시 회원정보가 없는 것으로 판단 회원가입 진행
	            if(count == 0) memberService.memberRegister(memberVO, avatar, session);          
	        } 	// 멤버의 매퍼에서 카운트가 0이 아닐시 회원정보가 존재하는 것으로 판단 회원가입 불가능 "존재하는 아이디" 출력
	        	catch (Exception e) {	        	
	            logger.info("존재 하는 아이디");
	        }
	        // 회원가입 완료시 홈화면으로 이동
	        return "redirect:/";
	    }
	    
	    // 아이디 체크를 위한 id체크 컨트롤러
	    @ResponseBody
	    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
	    public int IdCheck(@RequestBody String userId) throws Exception {	        
	    	// count가 0일시 참
	    	int count = 0;
	        // userId가 null이 아닐시 즉 회원정보가 존재할시 idCheck 서비스 진행
	    	if(userId != null) count = memberService.idCheck(userId);	
	    	// count로 리턴 
	        return count;    
	    }
	
	    // 멤버 로그인 ---------------------------------------------------------------------------------------------------
	    
	    // getMapping으로 멤버 로그인 페이지 이동
		@GetMapping("memberLogin")
		public String getLogin()throws Exception{
			return "member/memberLogin";
		}
		
		// postMapping으로 멤버 아이디 비밀번호 값 전송
		@RequestMapping(value="/memberLogin", method= {RequestMethod.POST})
		public String memberLogin(MemberVO memberVO,HttpServletRequest req,RedirectAttributes rttr,HttpServletResponse response)throws Exception{			
			// session 파리미터 생성
			HttpSession session = req.getSession();
			// member 파리미터 생성
			MemberVO member = memberService.memberLogin(memberVO);	
			// 1.  매퍼의 로그인 메소드 호출, session에 저장해둘것
			// 2. 호출 결과를 가지고 로그인 성공하면 main.jsp
			// 3. 실패하면 memberLogin.jsp로
			response.setContentType("text/html; charset=utf-8");
			
			// alert 창 띄우기위해 선언
			PrintWriter out = response.getWriter(); 
			
			//멤버가 존재할때 
			if(member == null) {
				// 멤버 매퍼에서 비교한 멤버아이디와 비밀번호가 일치하지 않을시
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
				// 아이디 비밀번호 불일치 스크립트 발생 alert창 
				out.println("<script> alert('아이디 또는 비밀번호가 틀립니다.');");
				// 스크립트 발생후 이전페이지로 이동(로그인페이지)
				out.println("history.go(-1); </script>");
				out.close();
				System.out.println("비밀번호 불일치");				
			}else {
				// 멤버 매퍼에서 비교한 멤버아이디와 비밀번호가 일치할 시
				session.setAttribute("member", member);
				System.out.println("로그인성공");
			}
			// 로그인 완료후 홈화면으로 이동
			return "redirect:/";
		}
		
		// 로그아웃
		@GetMapping("memberLogout")
		public String memberLogout(HttpSession session)throws Exception{
			//로그인 세션 무효화 
			session.invalidate();
			//로그아웃시 홈화면으로 이동
			return "redirect:/";
		}
		
		// 마이페이지 ---------------------------------------------------------------------------------------------------
		// 마이페이지 getMapping으로 멤버 마이페이지로 이동
		@GetMapping("membermyPage") 
		public String myPage(MemberVO memberVO, HttpSession session, Authentication auth2, Model model)throws Exception{
			return  "member/membermyPage";
		}
		
		// 멤버 업데이트 --------------------------------------------------------------------------------------------------	
		// 업데이트 getMapping으로 멤버 업데이트로 이동
		@RequestMapping("memberUpdate")
		public String memberUpdate()throws Exception{
			return "member/memberUpdate";
		}
	
		// 멤버 정보수정을 위한 postMapping 
		@PostMapping("memberUpdate")
		public String memberUpdate(MemberVO memberVO,HttpSession session, MultipartFile avatar)throws Exception{
			// 서비스 가져오기!
			int result = memberService.memberUpdate(memberVO);			
			// result 에 값이 들어가면 멤버 정보 입력!
			if(result>0) {
				session.setAttribute("member", memberVO);
			}
			// 수정후 자동 로그아웃
			session.invalidate();
			// 정보수정후 홈화면로 이동!
			return "redirect:/";
		}
		
		// 멤버 딜리트 ------------------------------------------------	---------------------------------------------------
		@RequestMapping("memberDelete") // MemberDelete
		public String memberDelete(HttpSession session)throws Exception{
			// 멤버 파리미터 생성
			MemberVO memberVO =(MemberVO)session.getAttribute("member");
			
			@SuppressWarnings("unused")
			// 멤버 세션 삭제  
			int result = memberService.memberDelete(memberVO, session);			
			session.invalidate();		
			// 삭제후 홈화면으로 이동!
			return "redirect:/";
		}
	
		// 멤버 리스트 ----------------------------------------------------------------------------------------------------
		@GetMapping("memberList")
		public String getList(Model model)throws Exception{
			// 리스트형태로 멤버 서비스 호출
			List<MemberVO> list =memberService.getList();
			// list로 value추가!
			model.addAttribute("list", list);			
			return "member/memberList";
		}
	
}
