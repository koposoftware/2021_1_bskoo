package kr.ac.kopo.admincard.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.admincard.vo.AdminCardVO;
import kr.ac.kopo.dashboard.vo.DashboardVO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class AdminCardDAOImpl implements AdminCardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public List<AdminCardVO> selectReccomendationCard(int no) {
		List<AdminCardVO> recommendationCard = sqlSessionTemplate.selectList("admincard.AdminCardDAO.selectReccomendationCard", no);
		return recommendationCard;
	}


	public List<AdminCardVO> selectCardList() {
		List<AdminCardVO> cardList = sqlSessionTemplate.selectList("admincard.AdminCardDAO.selectCardList");
		return cardList;
	}


	public List<AdminCardVO> selectCardInfo(int no) {
		List<AdminCardVO> cardInfo = sqlSessionTemplate.selectList("admincard.AdminCardDAO.selectCardInfo", no);
		return cardInfo;
	}


	public int selectMemberCount(Map<String, Object> param) {
		int memberCount = sqlSessionTemplate.selectOne("admincard.AdminCardDAO.selectMemberCount", param);
		return memberCount;
	}


	public List<AdminCardVO> selectEmailAddress(AdminCardVO vo) {
		List<AdminCardVO> emailList = sqlSessionTemplate.selectList("admincard.AdminCardDAO.selectEmailAddress", vo);
		return emailList;
	}
	
	public void insertMailLog(AdminCardVO vo) {
		sqlSessionTemplate.insert("admincard.AdminCardDAO.insertMailLog", vo);
	}


	public List<AdminCardVO> selectMailLog() {
		List<AdminCardVO> mailLog = sqlSessionTemplate.selectList("admincard.AdminCardDAO.selectMailLog");
		return mailLog;
	}

	
	
	
	
	
}
