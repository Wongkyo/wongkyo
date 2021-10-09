package com.to.t1.member;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;

	
	
	// 관리자 ---------------------------------------------------
	@GetMapping("memberAdmin")
	public String memberAdmin(MemberVO memberVO)throws Exception{

		return "member/memberAdmin";
	}
	
	// 멤버 업데이트 -----------------------------------------------
	
	@RequestMapping("memberUpdate")
	public String memberUpdate()throws Exception{

	return "member/memberUpdate";
	}

	@PostMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVO,HttpSession session)throws Exception{
		int result = memberService.memberUpdate(memberVO);
		
		if(result>0) {
			session.setAttribute("member", memberVO);
		}
		return "member/membermyPage";
	}
	
	
	
	// 멤버 딜리트 ------------------------------------------------
	
	@RequestMapping("memberDelete") // MemberDelete
	public String memberDelete(HttpSession session)throws Exception{
		MemberVO memberVO =(MemberVO)session.getAttribute("member");
		int result = memberService.memberDelete(memberVO, session);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	// 마이페이지 ------------------------------------------------
	
	@GetMapping("membermyPage") 
	public String myPage(MemberVO memberVO, HttpSession session, Authentication auth2, Model model)throws Exception{
		return  "member/membermyPage";
	}
		
	
	// 멤버 로그인 ------------------------------------------------

	@GetMapping("memberLogin")
	public String getLogin()throws Exception{
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLogin", method= {RequestMethod.POST})
	public String memberLogin(MemberVO memberVO,HttpServletRequest req,RedirectAttributes rttr)throws Exception{
		
		HttpSession session = req.getSession();
		MemberVO member = memberService.memberLogin(memberVO);
		
		if(member == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			System.out.println("비밀번호 불일치");
			
		}else {
			session.setAttribute("member", member);
			System.out.println("로그인성공");
		}

		return "redirect:/";
	}

	
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	
	
	
	
	// 멤버 로그인 ------------------------------------------------
	
	
	// 멤버 리스트 -------------------------------------------------
	@GetMapping("memberList")
	public String getList(Model model)throws Exception{
		List<MemberVO> list =memberService.getList();
		model.addAttribute("list", list);
		
		return "member/memberList";
	}
	// 멤버 리스트 -------------------------------------------------

	
	
	//멤버 조인----------------------------------------------------
	
	@GetMapping("memberJoin")
	public String setJoin(@ModelAttribute MemberVO memberVO)throws Exception{

		return "member/memberJoin";
	}
	
    @RequestMapping(value="/register", method=RequestMethod.GET) 
    public void registerGet() throws Exception {
        
        System.out.println("******GET register");
    }
    
 
    @RequestMapping(value="/register", method=RequestMethod.POST)
    public String memberRegister(MemberVO memberVO) throws Exception {
 
            logger.info("***********register POST");
        
        int count = memberService.idCheck(memberVO.getUserId());
        
        try {
            if(count == 0) memberService.memberRegister(memberVO);                
        } catch (Exception e) {
                logger.info("*****존재 하는 아이디");
        }
        return "redirect:/";
    }
 
 
    @ResponseBody
    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
    public int IdCheck(@RequestBody String userId) throws Exception {
        
        int count = 0;
        if(userId != null) count = memberService.idCheck(userId);
 
        return count;    
    }
    //멤버 조인----------------------------------------------------
	
}
