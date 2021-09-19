package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {
	Boolean checkId(String id);

	void register(MemberVO member);
	
	MemberVO login(MemberVO member);

	String sendMsg(String receiveNo);
	
	

}
