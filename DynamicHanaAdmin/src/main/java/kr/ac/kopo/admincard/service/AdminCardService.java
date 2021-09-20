package kr.ac.kopo.admincard.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.admincard.vo.AdminCardVO;

public interface AdminCardService {
	List<AdminCardVO> selectReccomendationCard(int no);
	
	List<AdminCardVO> selectCardList();
	
	List<AdminCardVO> selectCardInfo(int no);
	
	int selectMemberCount(Map<String, Object> param);
	
	void sendingMail(AdminCardVO vo);
}
