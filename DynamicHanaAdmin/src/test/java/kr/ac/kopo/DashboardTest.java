package kr.ac.kopo;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.ac.kopo.dashboard.service.DashboardService;
import kr.ac.kopo.dashboard.vo.DashboardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })

@WebAppConfiguration
public class DashboardTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private DashboardService dashboardService;

	@Ignore
	@Test
	public void 회원수() throws Exception {
		DashboardVO totalMember = dashboardService.selectTotalMember();
		

	}
	@Ignore
	@Test
	public void 거래수() throws Exception {
		List<DashboardVO> totalTran = dashboardService.selectMemberCluster();
		System.out.println(totalTran);
		
		
	}
	
	@Ignore
	@Test
	public void 일주일거래() throws Exception {
		List<DashboardVO> totalTran = dashboardService.selectClusterConsumption(1);
		System.out.println(totalTran);
		
		
	}
	
	@Ignore
	@Test
	public void 카드누적() throws Exception {
		List<DashboardVO> toptenCard = dashboardService.selectTopTenCard();
		System.out.println(toptenCard);
		
		
	}
	
	@Test
	public void 나이and성별() throws Exception {
		List<DashboardVO> toptenCard = dashboardService.selectAgeGroup();
		System.out.println(toptenCard);
		
		
	}
	

	

}
