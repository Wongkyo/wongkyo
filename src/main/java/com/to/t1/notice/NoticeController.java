package com.to.t1.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
		// 게시판 글 삽입	
		@PostMapping("gerNoticeFiles")
		public void getProfiles(NoticeVO noticeVO,Model model) throws Exception{
			model.addAttribute("pic", "pic");
		}
		
		@GetMapping("insertNotice")
		public String setInsert(NoticeVO noticeVO)throws Exception{
			return "notice/insertNotice";
		}
		
		@RequestMapping(value = "/insertNotice2", method = RequestMethod.GET)
		public void noticeInsertGet()throws Exception{
			System.out.println("*******notice Insert");
		}
		
		@RequestMapping(value = "/insertNotice2", method = RequestMethod.POST)
		public String noticeInsert(NoticeVO noticeVO, MultipartFile avatar, HttpSession session)throws Exception{
			int result = noticeService.insertNotice(noticeVO, avatar, session);			
			return "redirect:/";		
		}
		
		// 게시판 글 목록
		@GetMapping("noticeList")
		public String getList(Model model)throws Exception{
			List<NoticeVO> list = noticeService.getList();
			model.addAttribute("list", list);		
			return "notice/noticeList";
		}
		
		// 게시판 글 선택
		@GetMapping("noticeSelect")
		public ModelAndView noticeSelect(NoticeVO noticeVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			noticeVO = noticeService.noticeSelect(noticeVO);
			mv.addObject("vo", noticeVO);
			mv.setViewName("notice/noticeSelect");
			return mv;
		}

		// 게시판 글 수정
		@GetMapping("updateNotice")
		public ModelAndView updateNoitce(NoticeVO noticeVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			noticeVO = noticeService.noticeSelect(noticeVO);		
			mv.addObject("vo", noticeVO);
			mv.addObject("notice", "notice");
			mv.setViewName("notice/updateNotice");
			return mv;
		}
	
		@PostMapping("updateNotice")
		public String updateNoitce(NoticeVO noticeVO, HttpSession session) throws Exception{
			int result = noticeService.updateNoitce(noticeVO);			
			if(result > 0 ) {
				session.setAttribute("notice", noticeVO);
			}			
			return "redirect:/noticeList";
		}
	
		@RequestMapping("deleteNotice")
		public String deleteNotice(NoticeVO noticeVO)throws Exception{
			int result = noticeService.deleteNoitce(noticeVO);
			return "redirect:/noticeList";
		}
	
	
}