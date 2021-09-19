package kr.ac.kopo.card.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.card.dao.CardDAO;
import kr.ac.kopo.card.vo.BenefitVO;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.card.vo.DemographyVO;
import kr.ac.kopo.card.vo.HistoryVO;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.util.PagingVO;

@Service
public class CardServiceImpl implements CardService {

	@Autowired
	private CardDAO cardDAO;

	public List<UserCardVO> selectCardList(PagingVO vo) {
		List<UserCardVO> cardList = cardDAO.selectCardList(vo);
		return cardList;
	}

	public List<BenefitVO> selectBenefitList() {
		List<BenefitVO> list = cardDAO.selectBenefitList();
		return list;
	}

	public List<CardBenefitVO> selectByFilter(Map<String, String> paramMap) {

		HashMap<String, String> map = new HashMap<String, String>();

		for (String key : paramMap.keySet()) {
			if (key.equals("cardName")) {
				map.put("cardName", paramMap.get(key));
			} else if (key.equals("cardType")) {
				map.put("cardType", paramMap.get(key));
			} else if (key.equals("annualFeeType")) {
				map.put("annualFeeType", paramMap.get(key));
			} else if (key.equals("annualFeeRange")) {

				String temp = paramMap.get(key);
				String[] min_max = temp.replace("원", "").split(" - ");

				String min_value = min_max[0];
				String max_value = min_max[1];

				map.put("annualFeeRange_min", min_value);
				map.put("annualFeeRange_max", max_value);
			} else {
				String temp = paramMap.get(key);
				String[] min_max = temp.replace("%", "").replace(" ", "").split("-");

				String min_value = min_max[0];
				String max_value = min_max[1];

				Double min_double = (double) Integer.parseInt(min_value);
				Double max_double = (double) Integer.parseInt(max_value);

				map.put(key + "_min", Double.toString(min_double / 100));
				map.put(key + "_max", Double.toString(max_double / 100));

			}

		}

		List<CardBenefitVO> cardList = cardDAO.selectByFilter(map);
		return cardList;
	}

	public int getLength() {
		int totalLength = cardDAO.getLength();
		return totalLength;
	}

	public List<BenefitVO> selectNotice(int no) {
		List<BenefitVO> notice = cardDAO.selectNotice(no);
		return notice;
	}

	public DemographyVO selectStatByNo(int no) {
		DemographyVO userStat = cardDAO.selectStatByNo(no);
		return userStat;
	}

	public CardBenefitVO selectUserConsumption(int memberNo) {
		CardBenefitVO userBenefit = cardDAO.selectUserConsumption(memberNo);

		return userBenefit;
	}

	public CardBenefitVO selectByNo(int no) {
		CardBenefitVO card = cardDAO.selectByNo(no);
		return card;
	}

	public List<CardBenefitVO> selectCardAllInfo(int no, int memberNo) {
		List<CardBenefitVO> infoMap = new ArrayList<CardBenefitVO>();

		CardBenefitVO card = selectByNo(no);
		CardBenefitVO userConsumption = selectUserConsumption(memberNo);

		infoMap.add(card);
		infoMap.add(userConsumption);

		return infoMap;
	}

	public List<UserCardVO> selectUserCardList(int memberNo) {
		List<UserCardVO> userCarsList = cardDAO.selectUserCardList(memberNo);
		return userCarsList;
	}

	public int checkCardPassword(UserCardVO usercard) {
		int result = cardDAO.checkCardPassword(usercard);

		return result;
	}

	public List<HistoryVO> selectTransactionHistory(String cardNo, String category, String txt, PagingVO vo) {

		HistoryVO userhistory = new HistoryVO();

		userhistory.setCardNo(cardNo);
		userhistory.setStart(vo.getStart());
		userhistory.setEnd(vo.getEnd());
		userhistory.setCategory(category);
		userhistory.setTxt(txt);

		System.out.println(vo.getStart());
		System.out.println(vo.getEnd());
		List<HistoryVO> history = cardDAO.selectTransactionHistory(userhistory);

		return history;
	}

	public int getHistoryLength(String cardNo, String category, String txt) {
		HistoryVO history = new HistoryVO();
		history.setCardNo(cardNo);
		history.setCategory(category);
		history.setTxt(txt);
		int length = cardDAO.getHistoryLength(history);
		return length;
	}

	public List<HistoryVO> selectTransactionCategory(String cardNo) {
		List<HistoryVO> history = cardDAO.selectTransactionCategory(cardNo);

		return history;
	}

	public List<HistoryVO> selectWeeklyConsumption(String cardNo) {
		List<HistoryVO> weeklyAmount = cardDAO.selectWeeklyConsumption(cardNo);
		return weeklyAmount;
	}

	public List<HistoryVO> selectConsumptionRanking(String cardNo) {
		List<HistoryVO> consumptionRanking = cardDAO.selectConsumptionRanking(cardNo);
		return consumptionRanking;
	}
	
	
	

}
