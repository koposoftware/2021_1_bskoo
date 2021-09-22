package kr.ac.kopo.stmt.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.stmt.vo.StmtVO;


@Repository
public class StmtDAOImpl implements StmtDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String selectCardName(String cardNo) {
		String cardName = sqlSessionTemplate.selectOne("stmt.StmtDAO.selectCardName", cardNo);
		return cardName;
	}

	public StmtVO selectCardMainInfo(String cardNo) {
		StmtVO mainInfo = sqlSessionTemplate.selectOne("stmt.StmtDAO.selectCardMainInfo", cardNo);
		return mainInfo;
	}

	public StmtVO selectCardMainCategory(String cardNo) {
		StmtVO mainCategory = sqlSessionTemplate.selectOne("stmt.StmtDAO.selectCardMainCategory", cardNo);
		return mainCategory;
	}

	public List<StmtVO> selectTopFive(String cardNo) {
		List<StmtVO> topfive = sqlSessionTemplate.selectList("stmt.StmtDAO.selectTopFive", cardNo);
		return topfive;
	}

	public List<StmtVO> selectCategoryConsumption(String cardNo) {
		List<StmtVO> categoryConsumption = sqlSessionTemplate.selectList("stmt.StmtDAO.selectCategoryConsumption", cardNo);
		return categoryConsumption;
	}

	public List<StmtVO> selectWeeklyConsumption(String cardNo) {
		List<StmtVO> weeklyConsumption = sqlSessionTemplate.selectList("stmt.StmtDAO.selectWeeklyConsumption", cardNo);
		return weeklyConsumption;
	}

	
	public int selectMonthlyLength(String cardNo) {
		int monthlyLength = sqlSessionTemplate.selectOne("stmt.StmtDAO.selectMonthlyLength", cardNo);
		return monthlyLength;
	}

	public List<StmtVO> selectMonthlyConsumption(StmtVO stmt) {
		List<StmtVO> monthlyConsumption = sqlSessionTemplate.selectList("stmt.StmtDAO.selectMonthlyConsumption", stmt);
		return monthlyConsumption;
	}
	
	
	
	
	
	
	
	
	

}
