package com.to.t1.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception;
	
	public MemberVO membermyPage(MemberVO memberVO)throws Exception;
	
	public List<MemberVO> getList()throws Exception;
	
	public MemberVO getId(MemberVO memberVO)throws Exception;
	
	public void memberRegister(MemberVO memberVO) throws Exception;
	
//uygg
	// 유저체크
	public MemberVO userCheck(MemberVO memberVO) throws Exception;
	
	// 아이디체크
	public int idCheck(String userId) throws Exception;
	
	
	
}
