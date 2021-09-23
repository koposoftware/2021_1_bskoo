package kr.ac.kopo.stmt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.stmt.dao.StmtDAO;
import kr.ac.kopo.stmt.vo.StmtVO;
import kr.ac.kopo.util.PagingVO;

@Service
public class StmtServiceImpl implements StmtService {

	@Autowired
	private StmtDAO stmtDAO;

	public String selectCardName(String cardNo) {
		String cardName = stmtDAO.selectCardName(cardNo);
		return cardName;
	}

	public StmtVO selectCardMainInfo(String cardNo) {
		StmtVO mainInfo = stmtDAO.selectCardMainInfo(cardNo);
		return mainInfo;
	}

	public StmtVO selectCardMainCategory(String cardNo) {
		StmtVO mainCategory = stmtDAO.selectCardMainCategory(cardNo);
		return mainCategory;
	}

	public List<StmtVO> selectTopFive(String cardNo) {
		List<StmtVO> topfive = stmtDAO.selectTopFive(cardNo);
		return topfive;
	}

	public List<StmtVO> selectCategoryConsumption(String cardNo) {
		List<StmtVO> categoryConsumption = stmtDAO.selectCategoryConsumption(cardNo);
		return categoryConsumption;
	}

	public List<StmtVO> selectWeeklyConsumption(String cardNo) {
		List<StmtVO> weeklyConsumption = stmtDAO.selectWeeklyConsumption(cardNo);
		return weeklyConsumption;
	}

	
	public int selectMonthlyLength(String cardNo) {
		int monthlyLength = stmtDAO.selectMonthlyLength(cardNo);
		return monthlyLength;
	}

	public List<StmtVO> selectMonthlyConsumption(String cardNo, PagingVO vo) {
		
		StmtVO stmt = new StmtVO();
		
		stmt.setCardNo(cardNo);
		stmt.setStart(vo.getStart());
		stmt.setEnd(vo.getEnd());
		
		List<StmtVO> monthlyConsumption = stmtDAO.selectMonthlyConsumption(stmt);
		return monthlyConsumption;
	}

	public List<StmtVO> selectTimeSlot(String cardNo) {

		List<StmtVO> timeslot = stmtDAO.selectTimeSlot(cardNo);
		return timeslot;
	}

	public List<StmtVO> selectWeekday(String cardNo) {
		List<StmtVO>  weekday = stmtDAO.selectWeekday(cardNo);
		return weekday;
	}

	public int checkPCAMember(String cardNo) {
		int result = stmtDAO.checkPCAMember(cardNo);
		return result;
		
	}
	
	public List<StmtVO> selectPersonalCategory(String cardNo) {
		int result = checkPCAMember(cardNo);
		if(result==1) { // 주성분 분석이 완료된 유저라면 클러스터링된 군집의 특성 가져오기
			List<StmtVO> personalCategory = stmtDAO.selectPersonalCategoryPCA(cardNo);
			return personalCategory;
		}else { // 그렇지 않으면 가장 많이 소비한 카테고리 3개 가져오기
			List<StmtVO> personalCategory = stmtDAO.selectPersonalCategoryNonePCA(cardNo);
			return personalCategory;
		} 
		
	}

	public List<StmtVO> selectPersonalCategoryConsumption(String cardNo) {
		int result = checkPCAMember(cardNo);
		if(result==1) { 
			List<StmtVO> personalCategoryConsumption = stmtDAO.selectPersonalCategoryConsumptionPCA(cardNo);
			return personalCategoryConsumption;
		}else {
			List<StmtVO> personalCategoryConsumption = stmtDAO.selectPersonalCategoryConsumptionNonePCA(cardNo);
			return personalCategoryConsumption;
		}
		
	}

	public List<StmtVO> selectPersonalCard(String cardNo) {
		int result = checkPCAMember(cardNo);
		if(result==1) { 
			List<StmtVO> personalCard = stmtDAO.selectPersonalCardPCA(cardNo);
			return personalCard;
		}else {
			List<StmtVO> personalCard = stmtDAO.selectPersonalCardNonePCA(cardNo);
			return personalCard;
		}
	}
	
	
	
	
	
	
	
	
	

}
