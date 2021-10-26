package com.to.t1.product;

public class ProfilesVO {
	
	// 상품 사진 파일번호(기본키)
	private long fileNum;
	// 상품 번호
	private long proNum;
	// 상품 파일이름(UUID로 랜덤생성)
	private String fileName;
	// 공지사항 본래 이름
	private String oriName;
	
	// ------------ getter and setter ----------------------
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public long getProNum() {
		return proNum;
	}
	public void setProNum(long proNum) {
		this.proNum = proNum;
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
