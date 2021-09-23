package kr.ac.kopo.stmt.service;

import java.util.List;

import kr.ac.kopo.stmt.vo.StmtVO;
import kr.ac.kopo.util.PagingVO;

public interface StmtService {
	String selectCardName(String cardNo);
	
	StmtVO selectCardMainInfo(String cardNo);
	
	StmtVO selectCardMainCategory(String cardNo);
	
	List<StmtVO> selectTopFive(String cardNo);
	
	List<StmtVO> selectCategoryConsumption(String cardNo);
	
	List<StmtVO> selectWeeklyConsumption(String cardNo);
	
	int selectMonthlyLength(String cardNo);
	
	List<StmtVO> selectMonthlyConsumption(String cardNo, PagingVO vo);
	
	List<StmtVO> selectTimeSlot(String cardNo);
	
	List<StmtVO> selectWeekday(String cardNo);
	
	List<StmtVO> selectPersonalCategory(String cardNo);

	int checkPCAMember(String string);
	
	List<StmtVO> selectPersonalCategoryConsumption(String cardNo);
	
	List<StmtVO> selectPersonalCard(String cardNo);
}
