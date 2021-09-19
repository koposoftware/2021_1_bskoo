package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {
	MemberVO login(MemberVO member);
	
	String checkId(String id);
	
	void register(MemberVO member);
	
	
}
