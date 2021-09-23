package kr.ac.kopo.stmt.dao;

import java.util.List;

import kr.ac.kopo.stmt.vo.StmtVO;

public interface StmtDAO {
	
	String selectCardName(String cardNo);

	StmtVO selectCardMainInfo(String cardNo);
	
	StmtVO selectCardMainCategory(String cardNo);
	
	List<StmtVO> selectTopFive(String cardNo);
	
	List<StmtVO> selectCategoryConsumption(String cardNo);
	
	List<StmtVO> selectWeeklyConsumption(String cardNo);
	
	int selectMonthlyLength(String cardNo);
	
	List<StmtVO> selectMonthlyConsumption(StmtVO stmt);
	
	List<StmtVO> selectTimeSlot(String cardNo);
	
	List<StmtVO> selectWeekday(String cardNo);
	
	int checkPCAMember(String cardNo);
	
	List<StmtVO> selectPersonalCategoryPCA(String cardNo);
	
	List<StmtVO> selectPersonalCategoryNonePCA(String cardNo);
	
	List<StmtVO> selectPersonalCategoryConsumptionPCA(String cardNo);
	
	List<StmtVO> selectPersonalCategoryConsumptionNonePCA(String cardNo);
	
	List<StmtVO> selectPersonalCardPCA(String cardNo);
	
	List<StmtVO> selectPersonalCardNonePCA(String cardNo);
}

