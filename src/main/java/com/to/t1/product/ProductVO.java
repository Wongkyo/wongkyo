package com.to.t1.product;

public class ProductVO {

	// 상품 번호(기본키)
	private long proNum;
	// 유저 아이디
	private String userId;
	// 상품 이름
	private String proName;
	// 상품 카테고리 분류
	private String proCategory;
	// 상품 정보
	private String proInfo;
	// 상품 가격
	private long proPrice;
	// 상품 사진파일 VO
	private ProfilesVO profilesVO;
	// 상품 파일 이름
	private String fileName;
	// 상품 검색
	private String search;
	
	// product getter and setter -----------------------------
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public ProfilesVO getProfilesVO() {
		return profilesVO;
	}
	public void setProfilesVO(ProfilesVO profilesVO) {
		this.profilesVO = profilesVO;
	}
	public long getProNum() {
		return proNum;
	}
	public void setProNum(long proNum) {
		this.proNum = proNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProCategory() {
		return proCategory;
	}
	public void setProCategory(String proCategory) {
		this.proCategory = proCategory;
	}
	public String getProInfo() {
		return proInfo;
	}
	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
	}
	public long getProPrice() {
		return proPrice;
	}
	public void setProPrice(long proPrice) {
		this.proPrice = proPrice;
	}
	
	
}
