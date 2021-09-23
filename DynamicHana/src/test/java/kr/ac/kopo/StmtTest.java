package kr.ac.kopo;

import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.card.dao.CardDAO;
import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.BenefitVO;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.card.vo.DemographyVO;
import kr.ac.kopo.card.vo.HistoryVO;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.stmt.service.StmtService;
import kr.ac.kopo.stmt.vo.StmtVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })

public class StmtTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private StmtService stmtService;

	@Autowired
	private CardDAO cardDAO;

	@Ignore
	@Test
	public void 카드리스트Test() throws Exception {
		//List<StmtVO> list = stmtService.selectMonthlyConsumption("1111-1111-2222-2222");

	}
	
	@Ignore
	@Test
	public void 타임슬롯Test() throws Exception {
		List<StmtVO> timeslot = stmtService.selectTimeSlot("1111-1111-2222-2222");
		System.out.println(timeslot);
		
	}
	
	@Ignore
	@Test
	public void PCA멤버Test() throws Exception {
		int timeslot = stmtService.checkPCAMember("1111-1111-2222-2222");
		System.out.println(timeslot);
		
	}
	
	@Ignore
	@Test
	public void PCA카테고리() throws Exception {
		List<StmtVO> list = stmtService.selectPersonalCategory("1111-1111-2222-2222");
		System.out.println(list);
		
		
	}
	
	@Ignore
	@Test
	public void PCA카테고리소비내역() throws Exception {
		List<StmtVO> list = stmtService.selectPersonalCategoryConsumption("1111-1111-2222-2222");
		System.out.println(list);
		
		
	}
	@Test
	public void PCA카드추천() throws Exception {
		List<StmtVO> list = stmtService.selectPersonalCard("1111-1111-2222-2222");
		System.out.println(list);
		
		
	}
	

}
