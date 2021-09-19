package kr.ac.kopo.dashboard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.dashboard.vo.DashboardVO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class DashboardDAOImpl implements DashboardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public DashboardVO selectTotalMember() {
		DashboardVO totalMember = sqlSessionTemplate.selectOne("dashboard.DashboardDAO.selectTotalMember");
		return totalMember;
	}

	public DashboardVO selectTotalTransaction() {
		DashboardVO totalTransaction = sqlSessionTemplate.selectOne("dashboard.DashboardDAO.selectTotalTransaction");
		return totalTransaction;
	}

	public DashboardVO selectTotalAmount() {
		DashboardVO totalAmount = sqlSessionTemplate.selectOne("dashboard.DashboardDAO.selectTotalAmount");
		return totalAmount;
	}

	public DashboardVO selectTotalCluster() {
		DashboardVO totalCluster = sqlSessionTemplate.selectOne("dashboard.DashboardDAO.selectTotalCluster");
		return totalCluster;
	}

	public List<DashboardVO> selectWeelkyConsumption() {
		List<DashboardVO> weelkyConsumption = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectWeelkyConsumption");
		return weelkyConsumption;
	}

	public List<DashboardVO> selectMonthlyConsumption() {
		List<DashboardVO> monthlyConsumption = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectMonthlyConsumption");
		return monthlyConsumption;
	}

	public List<DashboardVO> selectMemberCluster() {
		List<DashboardVO> memberCluster = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectMemberCluster");
		return memberCluster;
	}

	public List<DashboardVO> selectTopTenCard() {
		List<DashboardVO> topTenCard = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectTopTenCard");
		return topTenCard;
	}

	public DashboardVO selectConsumptionTimeSlot() {
		DashboardVO consumptionTimeSolt = sqlSessionTemplate.selectOne("dashboard.DashboardDAO.selectConsumptionTimeSlot");
		return consumptionTimeSolt;
	}

	
	public List<DashboardVO> selectClusterConsumption(int no) {
		List<DashboardVO> clusterConsumption = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectClusterConsumption", no);
		return clusterConsumption;
	}

	public List<DashboardVO> selectAgeGroup() {
		List<DashboardVO> ageGroup = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectAgeGroup");
		return ageGroup;
	}

	public List<DashboardVO> selectConsumptionCountDist() {
		List<DashboardVO> consumptionCountDist = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectConsumptionCountDist");
		return consumptionCountDist;
	}
	
	public List<DashboardVO> selectConsumptionSumDist() {
		List<DashboardVO> consumptionSumDist = sqlSessionTemplate.selectList("dashboard.DashboardDAO.selectConsumptionSumDist");
		return consumptionSumDist;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
