package com.to.t1.member;

import com.to.t1.product.ProductVO;

public class MemberVO {

	// 멤버 아이디(기본키)
	private String userId;
	// 멤버 패스워드
	private String userPw;	
	// 멤버 이름
	private String name;
	// 멤버 성별
	private String gender;
	// 멤버 핸드폰
	private String phone;
	// 멤버 주소
	private String adress;
	// 멤버 이메일
	private String email;
	// 멤버 생년월일
	private long birth;
	// 멤버 사진저장하는 VO
	private JoinFileVO joinFileVO;
	// 상품 정보 VO  멤버에 상품정보를 넣고싶었지만 아직 하지 못했음 추후 예정
	private ProductVO productVO;
	
	//------------- getter and setter -------------------------
	
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getBirth() {
		return birth;
	}
	public void setBirth(long birth) {
		this.birth = birth;
	}
	public JoinFileVO getJoinFileVO() {
		return joinFileVO;
	}
	public void setJoinFileVO(JoinFileVO joinFileVO) {
		this.joinFileVO = joinFileVO;
	}
	
}
