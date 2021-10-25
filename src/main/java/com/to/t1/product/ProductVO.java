package com.to.t1.product;

public class ProductVO {

	private long proNum;
	private String userId;
	private String proName;
	private String proCategory;
	private String proInfo;
	private long proPrice;
	private ProfilesVO profilesVO;
	private String fileName;
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
