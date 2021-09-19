package kr.ac.kopo;

import java.util.HashMap;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })

public class CardTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private CardService cardService;

	@Autowired
	private CardDAO cardDAO;

	@Ignore
	@Test
	public void 카드리스트Test() throws Exception {
		List<BenefitVO> list = cardService.selectBenefitList();

		System.out.println(list);

	}

	@Ignore
	@Test
	public void 문자자르기Test() throws Exception {

		String temp2 = "0 % - 50 %";
		String[] bb = temp2.replace("%", "").replace(" ", "").split("-");

	}

	/*
	 * @Test
	 * 
	 * public void 카드핕터링Test() throws Exception {
	 * 
	 * List<UserBenefitVO> benefitList = new ArrayList<>();
	 * 
	 * UserBenefitVO vo = new UserBenefitVO(); vo.setParamName("cardName");
	 * vo.setParamValue("SK"); benefitList.add(vo);
	 * 
	 * UserBenefitVO vo2 = new UserBenefitVO(); vo2.setParamName("cardType");
	 * vo2.setParamValue("CHECK"); benefitList.add(vo2);
	 * 
	 * System.out.println(benefitList); List<CardVO> list =
	 * cardDAO.selectByFilter(benefitList);
	 * 
	 * System.out.println(list);
	 * 
	 * }
	 */

	@Ignore
	@Test
	public void 숫자() throws Exception {

		String temp = "30";
		Double a = (double) Integer.parseInt(temp);

		String aaa = Double.toString(a / 100);
		System.out.println(aaa);

	}

	@Ignore
	@Test
	public void LengthTest() throws Exception {
		int result = cardService.getLength();

		System.out.println(result);
	}

	@Ignore
	@Test
	public void mapTest() throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();

		paramMap.put("cardName", "MULTI");
		paramMap.put("cardType", "");
		paramMap.put("annualFeeType", "연회비 유무 선택");
		paramMap.put("annualFeeRange", "0원 - 250000원");

		System.out.println(paramMap);
		List<CardBenefitVO> cardFilterList = cardService.selectByFilter(paramMap);
		System.out.println("cardList : " + cardFilterList);

	}

	@Ignore
	@Test
	public void 인구통계학Test() throws Exception {
		DemographyVO temp = cardService.selectStatByNo(1001);
		System.out.println(temp);
	}

	@Ignore
	@Test
	public void 카드List() throws Exception {
		List<UserCardVO> usercard = cardService.selectUserCardList(1);
		System.out.println(usercard);
	}

	@Ignore
	@Test
	public void 카드비밀번호() throws Exception {
		UserCardVO user = new UserCardVO();
		user.setCardNo("2222-2222-2222-2222");
		user.setCardPassword("12342");
		
		int pwcheck = cardService.checkCardPassword(user);
		System.out.println(pwcheck);
		
	}
	
	@Ignore
	@Test
	public void 카드내역() throws Exception {
		//List<HistoryVO> history = cardService.selectTransactionHistory("1111-1111-2222-2222");
		
		//System.out.println(history);
		
	}
	
	@Ignore
	@Test
	public void 페이징카드내역() throws Exception {
		int total = cardService.getHistoryLength("1111-1111-2222-2222", null, null);
		
		System.out.println(total);
		
	}
	
	@Ignore
	@Test
	public void 카드카테고리() throws Exception {
		HistoryVO history = new HistoryVO();
		history.setCardNo("1111-1111-2222-2222");
		history.setCategory("뷰티");
		List<HistoryVO> historylist = cardDAO.selectTransactionHistory(history);
		
		System.out.println(historylist);
		
	}
	
	@Test
	public void 카드주차별() throws Exception {
		
		List<HistoryVO> historylist = cardDAO.selectWeeklyConsumption("1111-1111-2222-2222");
		
		System.out.println(historylist);
		
	}
	
	

}
