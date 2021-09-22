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
		
		System.out.println(stmt);
		List<StmtVO> monthlyConsumption = stmtDAO.selectMonthlyConsumption(stmt);
		return monthlyConsumption;
	}
	
	
	
	
	
	
	

}
