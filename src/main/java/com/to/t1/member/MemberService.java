package com.to.t1.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.memberUpdate(memberVO);
	}
	
	public int memberDelete(MemberVO memberVO,HttpSession session)throws Exception{
		return memberMapper.memberDelete(memberVO);
	}

	public MemberVO membermyPage(MemberVO memberVO)throws Exception{
		return memberMapper.membermyPage(memberVO);
	}
	
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return memberMapper.memberLogin(memberVO);
	}
	
	public MemberVO getId(MemberVO memberVO)throws Exception{
		return memberMapper.getId(memberVO);
	}
	
	
	public List<MemberVO> getList()throws Exception {
		return memberMapper.getList();
	}
	
	public void memberRegister(MemberVO memberVO) throws Exception {
		memberMapper.memberRegister(memberVO);
	}
	
	public int idCheck(String userId) throws Exception {
		return memberMapper.idCheck(userId);
	}
	
	
	
}
