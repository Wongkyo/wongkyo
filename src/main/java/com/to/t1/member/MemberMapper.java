package com.to.t1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {

	// 멤버 가입
	public int memberRegister(MemberVO memberVO) throws Exception;

	// 멤버 아이디 체크
	public int idCheck(String userId) throws Exception;	

	// 멤버 로그인
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	// 회원 사진 삽입
	public int setFileInsert(JoinFileVO joinFileVO)throws Exception;
	
	// 멤버 마이페이지
	public MemberVO membermyPage(MemberVO memberVO)throws Exception;
	
	// 멤버 정보 수정 
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	// 멤버 탈퇴
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	// 멤버 목록
	public List<MemberVO> getList()throws Exception;
		
}
