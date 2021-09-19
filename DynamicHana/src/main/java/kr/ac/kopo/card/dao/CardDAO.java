package kr.ac.kopo.card.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.ac.kopo.card.vo.BenefitVO;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.card.vo.DemographyVO;
import kr.ac.kopo.card.vo.HistoryVO;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.util.PagingVO;

public interface CardDAO {
	List<UserCardVO> selectCardList(PagingVO vo);

	List<BenefitVO> selectBenefitList();

	List<CardBenefitVO> selectByFilter(Map<String, String> paramMap);

	int getLength();

	CardBenefitVO selectByNo(int no);

	List<BenefitVO> selectNotice(int no);

	DemographyVO selectStatByNo(int no);

	CardBenefitVO selectUserConsumption(int memberNo);

	List<UserCardVO> selectUserCardList(int memberNo);

	int checkCardPassword(UserCardVO usercard);

	List<HistoryVO> selectTransactionHistory(HistoryVO history);

	int getHistoryLength(HistoryVO history);

	List<HistoryVO> selectTransactionCategory(String cardNo);
	
	List<HistoryVO> selectWeeklyConsumption(String cardNo);
	
	List<HistoryVO> selectConsumptionRanking(String cardNo);

}
