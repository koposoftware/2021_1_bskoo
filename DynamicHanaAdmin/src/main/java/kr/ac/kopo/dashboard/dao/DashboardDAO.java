package kr.ac.kopo.dashboard.dao;

import java.util.List;

import kr.ac.kopo.dashboard.vo.DashboardVO;

public interface DashboardDAO {
	DashboardVO selectTotalMember();
	
	DashboardVO selectTotalTransaction();
	
	DashboardVO selectTotalAmount();
	
	DashboardVO selectTotalCluster();
	
	List<DashboardVO> selectWeelkyConsumption();
	
	List<DashboardVO> selectMonthlyConsumption();
	
	List<DashboardVO> selectMemberCluster();
	
	List<DashboardVO> selectTopTenCard();
	
	DashboardVO selectConsumptionTimeSlot();
	
	List<DashboardVO> selectClusterConsumption(int no);
	
	List<DashboardVO> selectAgeGroup();
	
	List<DashboardVO> selectConsumptionCountDist();
	
	List<DashboardVO> selectConsumptionSumDist();

}
