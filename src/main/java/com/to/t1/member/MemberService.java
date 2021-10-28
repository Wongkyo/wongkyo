package com.to.t1.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.to.t1.util.Criteria;
import com.to.t1.util.FileManager;

@Service
public class MemberService {

	// memberMapper 주입
	@Autowired
	private MemberMapper memberMapper;
	
	// fileManager 주입
	@Autowired
	private FileManager fileManager;
	
	// 회원 가입 서비스
	public int memberRegister(MemberVO memberVO, MultipartFile avatar, HttpSession session) throws Exception {
		
		// 회원 아이디에 파일이름 추가시 파일이름 설정
		String fileName = fileManager.save("member", avatar, session); 		
		// joinFile 객체 가져오기
		JoinFileVO joinFileVO = new JoinFileVO();
		// member의 userId 가져오기
		joinFileVO.setUserId(memberVO.getUserId());
		// fileManager의 oriName 가져오기
		joinFileVO.setOriName(avatar.getOriginalFilename());
		// fileName에 저장
		joinFileVO.setFileName(fileName);			
		// 매퍼의 memberRegiter 가져오기
		int result = memberMapper.memberRegister(memberVO);
		// 매퍼의 setFileInsert 가져오기
		result = memberMapper.setFileInsert(joinFileVO);
		// 결과값 리턴 	
		return  result;
			
		}

	// 아이디 중복 검사 서비스
	public int idCheck(String userId) throws Exception {
		// 매퍼의 아이디 중복값체크 가져오기
		return memberMapper.idCheck(userId);
		}
	
	// 로그인 서비스
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		// 매퍼의 로그인 매퍼 가져오기
		return memberMapper.memberLogin(memberVO);
		}

	// 수정 서비스
	public int memberUpdate(MemberVO memberVO)throws Exception{
		// 매퍼의 회원정보수정 매퍼 가져오기
		return memberMapper.memberUpdate(memberVO);
		}
	
	// 삭제 서비스
	public int memberDelete(MemberVO memberVO,HttpSession session)throws Exception{
		// 매퍼의 회원정보삭제 매퍼 가져오기
		return memberMapper.memberDelete(memberVO);
		}

	// 회원 목록 서비스
	public List<Map<String, Object>> getList(Criteria cri)throws Exception {
		// 매퍼의 회원정보목록 매퍼 가져오기
		return memberMapper.getList(cri);
		}
	// 총 회원수
		public int memListCnt() throws Exception{
			return memberMapper.memListCnt();
		}
	
	
	
}
