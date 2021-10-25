package com.to.t1.member;

public class JoinFileVO {
	
	// 멤버 저장 파일번호(기본키- auto_increment)
	public Long fileNum;
	// 멤버 아이디
	public String userId;
	// 멤버 사진 파일이름 생성(UUID)
	public String fileName;
	// 멤버 사진 파일 기본이름
	public String oriName;
	
	//------------- getter and setter -------------------------
	public Long getFileNum() {
		return fileNum;
	}
	public void setFileNum(Long fileNum) {
		this.fileNum = fileNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
