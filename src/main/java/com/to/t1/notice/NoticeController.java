package com.to.t1.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.to.t1.util.Criteria;
import com.to.t1.util.Paging;

@Controller
public class NoticeController {

	// noticeServiec 주입
	@Autowired
	private NoticeService noticeService;
		
		// 공지사항 작성 -------------------------------------------------------------------------------
		// getMapping으로 insertNotice페이지로 이동
		@GetMapping("insertNotice")
		public String setInsert(NoticeVO noticeVO)throws Exception{
			return "notice/insertNotice";
		}
		
		// postMapping으로 입력한 값을 보내기
		@SuppressWarnings("unused")
		@RequestMapping(value = "/insertNotice2", method = RequestMethod.POST)
		public String noticeInsert(NoticeVO noticeVO, MultipartFile avatar, HttpSession session)throws Exception{
			// 서비스에서 return값으로 insertNotiece 가져오기
			int result = noticeService.insertNotice(noticeVO, avatar, session);			
			// 공지사항 작성 후 홈화면으로 이동
			return "redirect:/memberAdmin";		
		}
		
		// 게시판 글 목록 -------------------------------------------------------------------------------
		@GetMapping("noticeList")
		public String getList(Model model, Criteria cri)throws Exception{
			
			// 전체 글 갯수 조회
			int noListCnt = noticeService.noListCnt();
			
			// 페이징 객체 선언
			Paging paging = new Paging();
			paging.setCri(cri);
			paging.setTotalCount(noListCnt);
			
			// 게시글 리스트 담기
			List<Map<String, Object>> list = noticeService.getList(cri);
			
			// list model에 담기
			model.addAttribute("list", list);
			// 페이징 선언
			model.addAttribute("paging", paging);  

			return "notice/noticeList";
		}
				
		// 게시판 글 선택 -------------------------------------------------------------------------------
		// getMapping으로 게시판 글 내용 페이지로 이동
		@GetMapping("noticeSelect")
		public ModelAndView noticeSelect(NoticeVO noticeVO)throws Exception{
			// 모델앤뷰로 파라미터 생성
			ModelAndView mv = new ModelAndView();
			// noticeVO에 service의 noticeSelete 주입
			noticeVO = noticeService.noticeSelect(noticeVO);
			// noticeVO를 vo에 담기
			mv.addObject("vo", noticeVO);
			// 이동할 파일 정보를 입력
			mv.setViewName("notice/noticeSelect");
			return mv;
		}

		// 게시판 글 수정 -------------------------------------------------------------------------------
		// getMapping으로 게시판 수정 페이지로 이동
		@GetMapping("updateNotice")
		public ModelAndView updateNoitce(NoticeVO noticeVO)throws Exception{
			// 모델앤뷰로 파라미터 생성
			ModelAndView mv = new ModelAndView();
			// noticeVO에 service의 noticeSelete 주입
			noticeVO = noticeService.noticeSelect(noticeVO);	
			// noticeVO를 vo에 담기
			mv.addObject("vo", noticeVO);
			// 이동할 파일 정보를 입력
			mv.setViewName("notice/updateNotice");
			return mv;
		}
	
		// postMapping으로 업데이트할 정보 값 보내기
		@PostMapping("updateNotice")
		public String updateNoitce(NoticeVO noticeVO, HttpSession session) throws Exception{
			// result에 updateNotice 매퍼 주입
			int result = noticeService.updateNoitce(noticeVO);			
			// result가 0보다 클때 즉 값이 존재하므로 업데이트 실행
			if(result > 0 ) {
				// 세선에 noticeVO를 notice로 저장
				session.setAttribute("notice", noticeVO);
			}			
			// 업데이트 완료후 noticeList로 이동
			return "redirect:/noticeList";
		}
	
		// 게시판 글 삭제 -------------------------------------------------------------------------------
		// requestMapping으로 deleteNotice값 받기
		@SuppressWarnings("unused")
		@RequestMapping("deleteNotice")
		public String deleteNotice(NoticeVO noticeVO)throws Exception{
			// 서비스에 result값으로 noticeDelete 가져오기
			int result = noticeService.deleteNoitce(noticeVO);
			// 삭제완료후 noticeList로 이동
			return "redirect:/noticeList";
		}
	
	
}