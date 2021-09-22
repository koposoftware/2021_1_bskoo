package kr.ac.kopo.admincard.DAO;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.admincard.vo.AdminCardVO;

public interface AdminCardDAO {
	List<AdminCardVO> selectReccomendationCard(int no);
	
	List<AdminCardVO> selectCardList();
	
	List<AdminCardVO> selectCardInfo(int no);
	
	int selectMemberCount(Map<String, Object> param);

	List<AdminCardVO> selectEmailAddress(AdminCardVO vo);
	
	void insertMailLog(AdminCardVO vo);
	
	List<AdminCardVO> selectMailLog();
}
