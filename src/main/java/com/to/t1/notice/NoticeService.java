package com.to.t1.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.to.t1.util.NoFileManager;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	@Autowired
	private NoFileManager noFileManager;
	
	// 게시판 글 삽입
	public int insertNotice(NoticeVO noticeVO, MultipartFile avatar, HttpSession session)throws Exception{
		String fileName = noFileManager.save("notice", avatar, session);			
		NoticeFileVO noticeFileVO = new NoticeFileVO();
		noticeFileVO.setNoNum(noticeVO.getNoNum());
		noticeFileVO.setOriName(avatar.getOriginalFilename());
		noticeFileVO.setFileName(fileName);		
		int result = noticeMapper.insertNotice(noticeVO);
		result = noticeMapper.insertNoticeFiles(noticeFileVO);
			
		return result;
		}
		
	// 게시판 글 리스트 
	public List<NoticeVO>getList()throws Exception{
		return noticeMapper.getList();
		}
	
	// 게시판 글 선택
	public NoticeVO noticeSelect(NoticeVO noticeVO)throws Exception{
		noticeMapper.hitUpdate(noticeVO);		
		return noticeMapper.noticeSelect(noticeVO);
		}
		
	// 게시판 글 수정
	public int updateNoitce(NoticeVO noticeVO)throws Exception {
		return noticeMapper.updateNoitce(noticeVO);
		}
		
	// 게시판 글 삭제
	public int deleteNoitce(NoticeVO noticeVO)throws Exception{
		return noticeMapper.deleteNoitce(noticeVO);
		}
	
}