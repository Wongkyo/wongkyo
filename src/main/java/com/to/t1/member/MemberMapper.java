package com.to.t1.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.to.t1.util.Criteria;


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

	// 멤버 정보 수정 
	public int memberUpdate(MemberVO memberVO)throws Exception;
	
	// 멤버 탈퇴
	public int memberDelete(MemberVO memberVO)throws Exception;
	
	// 총 회원 리스트
	public List<Map<String, Object>> getList(Criteria cri) throws Exception;
		 
	// 총회원 수
	public int memListCnt() throws Exception;
		
}
