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

	// noticeMapper 주입
	@Autowired
	private NoticeMapper noticeMapper;
	
	// noFileManger 주입
	@Autowired
	private NoFileManager noFileManager;
	
	// 게시판 글 삽입
	public int insertNotice(NoticeVO noticeVO, MultipartFile avatar, HttpSession session)throws Exception{
		// 파일네임 설정	
		String fileName = noFileManager.save("notice", avatar, session);			
		// noticefileVO 가져오기
		NoticeFileVO noticeFileVO = new NoticeFileVO();
		// noticefileVO에 noticeVO의 noNum 주입
		noticeFileVO.setNoNum(noticeVO.getNoNum());
		// noticefileVO에 oriName 주입
		noticeFileVO.setOriName(avatar.getOriginalFilename());
		// noticefileVO에 fileName 생성
		noticeFileVO.setFileName(fileName);
		// insertNotice 매퍼문 가져오기
		int result = noticeMapper.insertNotice(noticeVO);
		// result에 noticeFile 주입
		result = noticeMapper.insertNoticeFiles(noticeFileVO);		
		// 결과값 삽입
		return result;
		}
		
	// 게시판 글 리스트 
	public List<NoticeVO>getList()throws Exception{
		// 매퍼의 noticeList 가져오기
		return noticeMapper.getList();
		}
	
	// 게시판 글 선택
	public NoticeVO noticeSelect(NoticeVO noticeVO)throws Exception{
		// 선택시 매퍼의 hitUpdate 가져와서 선택시마다 매퍼 발생
		noticeMapper.hitUpdate(noticeVO);		
		// 매퍼의 noticeSelect 가져오기
		return noticeMapper.noticeSelect(noticeVO);
		}
		
	// 게시판 글 수정
	public int updateNoitce(NoticeVO noticeVO)throws Exception {
		// 매퍼의 noticeUpdate 가져오기
		return noticeMapper.updateNoitce(noticeVO);
		}
		
	// 게시판 글 삭제
	public int deleteNoitce(NoticeVO noticeVO)throws Exception{
		// 매퍼의 noticeDelete 가져오기
		return noticeMapper.deleteNoitce(noticeVO);
		}
	
}