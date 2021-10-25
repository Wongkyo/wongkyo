package com.to.t1.notice;

import java.sql.Date;

public class NoticeVO {

	private long noNum;
	private String title;
	private String contents;
	private Date day;
	private long hit;	
	private String fileName;
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

