
package com.to.t1.notice;

public class NoticeFileVO {
	
	// 공지사항 사진 파일번호(기본키)
	private Long fileNum;
	// 공지사항 번호
	private Long noNum;
	// 공지사항 파일이름(UUID로 랜덤생성)
	private String fileName;
	// 공지사항 본래 이름
	private String oriName;
	
	// ------------ getter and setter --------------- 
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public Long getNoNum() {
		return noNum;
	}
	public void setNoNum(Long noNum) {
		this.noNum = noNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	
}