package kr.ac.kopo;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.service.MemberServiceImpl;
import kr.ac.kopo.member.vo.MemberVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/spring/spring-mvc.xml" })

public class MemberTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDAO memberDAO;

	@Ignore
	@Test
	public void 중복확인Test() throws Exception {
		Boolean result = memberService.checkId("test31");

		System.out.println("test result : " + result);

	}

	@Ignore
	@Test
	public void sendMsg() throws Exception{
		String api_key = "NCSMUJQPHZZ5W304";
		String api_secret = "XWU0PNMWLTK6UAMCAKIRMLKIWKIUC3WR";
		Message coolsms = new Message(api_key, api_secret);

		int randInt = 1234;
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01047739853");
		params.put("from", "01047739853"); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "인증번호는 " + randInt + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
	@Ignore
	@Test
	public void SMS테스트() {
		String msg = memberService.sendMsg("01047739853");
		System.out.println(msg);
		
	}
	
	@Ignore
	@Test
	public void registerTest() {
		MemberVO member = new MemberVO();
		
		member.setId("aaa");
		member.setPw("1234");
		member.setName("가가가");
		member.setMobileNo("01001010101");
		member.setRrn("9501011111115");
		member.setBirthday("19950602");
		member.setGender("F");
		member.setIsNative("N");
		member.setAddress("test");
		member.setAddressDetail("test");

		
		memberService.register(member);
		
	}
	
	@Ignore
	@Test
	public void ageTest() {
		MemberServiceImpl serviceimpl = new MemberServiceImpl();
		int temp = serviceimpl.getAmericanAge("19950602");
		System.out.println(temp);
		
	}
	
	@Test
	public void TestDataInput() {
		
	}


}
