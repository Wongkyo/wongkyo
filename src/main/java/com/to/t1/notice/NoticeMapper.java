
package com.to.t1.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeMapper {

	// 게시판 글 삽입
	public int insertNotice(NoticeVO noticeVO)throws Exception;

	// 게시판 글 이미지 삽입
	public int insertNoticeFiles(NoticeFileVO noticeFileVO)throws Exception;

	// 게시판 사진 선택
	public NoticeFileVO fileSelect(NoticeFileVO noticeFileVO)throws Exception;
	
	// 게시판 사진 삭제
	public int fileDelete(NoticeFileVO noticeFileVO)throws Exception;

	// 게시판 글 리스트
	public List<NoticeVO>getList()throws Exception;
	
	// 게시판 글 선택
	public NoticeVO noticeSelect(NoticeVO noticeVO)throws Exception;	
	
	// 게시판 글 수정
	public int updateNoitce(NoticeVO noticeVO)throws Exception;
	
	// 게시판 글 삭제 
	public int deleteNoitce(NoticeVO noticeVO)throws Exception;
		
	// 게시판 조회수 상승
	public int hitUpdate(NoticeVO noticeVO)throws Exception;
}
