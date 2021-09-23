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

	public List<StmtVO> selectTimeSlot(String cardNo) {
		List<StmtVO> timeslot = sqlSessionTemplate.selectList("stmt.StmtDAO.selectTimeSlot", cardNo);
		return timeslot;
	}

	public List<StmtVO> selectWeekday(String cardNo) {
		List<StmtVO> weekday = sqlSessionTemplate.selectList("stmt.StmtDAO.selectWeekday", cardNo);
		return weekday;
	}

	public int checkPCAMember(String cardNo) {
		int result = sqlSessionTemplate.selectOne("stmt.StmtDAO.checkPCAMember", cardNo);
		return result;
	}

	public List<StmtVO> selectPersonalCategoryPCA(String cardNo) {
		List<StmtVO> personalCategory = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCategoryPCA", cardNo);
		return personalCategory;
	}

	public List<StmtVO> selectPersonalCategoryNonePCA(String cardNo) {
		List<StmtVO> personalCategory = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCategoryNonePCA", cardNo);
		return personalCategory;
	}

	public List<StmtVO> selectPersonalCategoryConsumptionPCA(String cardNo) {
		List<StmtVO> personalCategoryConsumptionPCA = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCategoryConsumptionPCA", cardNo);
		return personalCategoryConsumptionPCA;
	}

	public List<StmtVO> selectPersonalCategoryConsumptionNonePCA(String cardNo) {
		List<StmtVO> personalCategoryConsumptionPCA = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCategoryConsumptionNonePCA", cardNo);
		return personalCategoryConsumptionPCA;
	}

	public List<StmtVO> selectPersonalCardPCA(String cardNo) {
		List<StmtVO> personalCard = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCardPCA", cardNo);
		return personalCard;
	}

	public List<StmtVO> selectPersonalCardNonePCA(String cardNo) {
		List<StmtVO> personalCard = sqlSessionTemplate.selectList("stmt.StmtDAO.selectPersonalCardNonePCA", cardNo);
		return personalCard;
	}


	
	
	
	
	
	

}
