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
import org.springframework.test.context.web.WebAppConfiguration;

import kr.ac.kopo.admincard.service.AdminCardService;
import kr.ac.kopo.admincard.vo.AdminCardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })

@WebAppConfiguration
public class AdminCardTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private AdminCardService admincardService;

	
	@Ignore
	@Test
	public void 카드추천() throws Exception {
		List<AdminCardVO> card = admincardService.selectReccomendationCard(1);
		System.out.println(card);
		
		
	}
	
	@Test
	public void 조건카운트테스트() throws Exception {
		Map<String,Object> temp = new HashMap<String, Object>();
		temp.put("age", 30);
		temp.put("clusterNo", 1);
		temp.put("region", "강원도");
		temp.put("gender", "");
		
		int result = admincardService.selectMemberCount(temp);
		System.out.println(result);
		
		
	}
	

	

}
