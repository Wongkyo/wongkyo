package com.to.t1.notice;

import java.sql.Date;

public class NoticeVO {
	
	// 공지사항 번호(기본키)
	private long noNum;
	// 공지사항 제목
	private String title;
	// 공지사항 내용
	private String contents;
	// 공지사항 등록 날짜
	private Date day;
	// 공지사항 조회수
	private long hit;
	// 공지사항 파일이름
	private String fileName;
	// 공지사항 파일 VO
	private NoticeFileVO noticeFileVO;
	
	// ------------ getter and setter ---------------
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public NoticeFileVO getNoticeFileVO() {
		return noticeFileVO;
	}
	public void setNoticeFileVO(NoticeFileVO noticeFileVO) {
		this.noticeFileVO = noticeFileVO;
	}
	public long getNoNum() {
		return noNum;
	}
	public void setNoNum(long noNum) {
		this.noNum = noNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	
	
	
}

