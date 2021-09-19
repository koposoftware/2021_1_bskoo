package kr.ac.kopo.card.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.card.vo.BenefitVO;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.card.vo.DemographyVO;
import kr.ac.kopo.card.vo.HistoryVO;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.util.PagingVO;

@Repository
public class CardDAOImpl implements CardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<UserCardVO> selectCardList(PagingVO vo) {
		List<UserCardVO> cardList = sqlSessionTemplate.selectList("card.CardDAO.selectAllCard", vo);
		return cardList;
	}

	public List<BenefitVO> selectBenefitList() {
		List<BenefitVO> list = sqlSessionTemplate.selectList("card.CardDAO.selectBenefitList");
		return list;
	}

	public List<CardBenefitVO> selectByFilter(Map<String, String> paramMap) {
		List<CardBenefitVO> cardList = sqlSessionTemplate.selectList("card.CardDAO.selectByFilter", paramMap);
		return cardList;
	}

	public int getLength() {
		int totalLength = sqlSessionTemplate.selectOne("card.CardDAO.getLength");
		return totalLength;
	}

	public CardBenefitVO selectByNo(int no) {
		CardBenefitVO card = sqlSessionTemplate.selectOne("card.CardDAO.selectByNo", no);
		return card;
	}

	public List<BenefitVO> selectNotice(int no) {
		List<BenefitVO> notice = sqlSessionTemplate.selectList("card.CardDAO.selectNotice", no);
		return notice;
	}

	public DemographyVO selectStatByNo(int no) {
		DemographyVO userStat = sqlSessionTemplate.selectOne("card.CardDAO.selectStatByNo", no);

		return userStat;
	}

	public CardBenefitVO selectUserConsumption(int memberNo) {
		CardBenefitVO userBenefit = sqlSessionTemplate.selectOne("card.CardDAO.selectUserConsumption", memberNo);

		return userBenefit;
	}

	public List<Map<String, Object>> selectBenefitMap() {
		List<Map<String, Object>> benefitMap = sqlSessionTemplate.selectList("card.CardDAO.selectBenefitMap");
		return benefitMap;
	}

	public List<UserCardVO> selectUserCardList(int memberNo) {
		List<UserCardVO> userCardList = sqlSessionTemplate.selectList("card.CardDAO.selectUserCardList", memberNo);
		return userCardList;
	}
	
	public int checkCardPassword(UserCardVO usercard) {
		int result = sqlSessionTemplate.selectOne("card.CardDAO.checkCardPassword", usercard);
		return result;
	}

	public List<HistoryVO> selectTransactionHistory(HistoryVO history) {
		System.out.println("DAO쪽" + history);
		List<HistoryVO> card = sqlSessionTemplate.selectList("card.CardDAO.selectTransactionHistory", history);
		return card;
	}

	public int getHistoryLength(HistoryVO vo) {
		int length = sqlSessionTemplate.selectOne("card.CardDAO.getHistoryLength", vo);
		return length;
	}

	public List<HistoryVO> selectTransactionCategory(String cardNo) {
		List<HistoryVO> category = sqlSessionTemplate.selectList("card.CardDAO.getTransactionCategory", cardNo);
		return category;
	}

	public List<HistoryVO> selectWeeklyConsumption(String cardNo) {
		List<HistoryVO> weeklyAmount = sqlSessionTemplate.selectList("card.CardDAO.selectWeeklyConsumption", cardNo);
		return weeklyAmount;
	}

	public List<HistoryVO> selectConsumptionRanking(String cardNo) {
		List<HistoryVO> consumptionRanking = sqlSessionTemplate.selectList("card.CardDAO.selectConsumptionRanking", cardNo);
		return consumptionRanking;
	}
	
	
	
	

	
	
	
	
	

}
