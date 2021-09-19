package kr.ac.kopo.member.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public MemberVO login(MemberVO member) {
		MemberVO userVO = memberDAO.login(member);
		return userVO;
	}

	/**
	 * 아이디 중복체크 후 반환값 리턴 T/F
	 */
	public Boolean checkId(String id) {

		String userId = memberDAO.checkId(id);
		Boolean result;
		if (userId == null) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}


	/**
	 * 휴대전화 인증시 문자를 보내줌
	 * @return : 랜덤문자
	 */
	public String sendMsg(String receiveNo) {
		Random rand = new Random();
		String certificationKey = "";
		for (int i = 0; i < 4; i++) {
			certificationKey += rand.nextInt(10);
		}
		
		
		/* String api_key = "NCSMUJQPHZZ5W304"; */
		String api_key = "sample";
		
		String api_secret = "XWU0PNMWLTK6UAMCAKIRMLKIWKIUC3WR";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", receiveNo);
		params.put("from", "01047739853"); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "인증번호는 " + certificationKey + "입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		return certificationKey;
	}

	public void register(MemberVO member) {
		String birth = member.getBirthday();
		int age = getAmericanAge(birth);
		member.setAge(age);;
		
		String rrn = member.getRrn();
		String new_rrn = rrn.substring(0,6) + "-" + rrn.substring(6,rrn.length());
		
		member.setRrn(new_rrn);

		memberDAO.register(member);
	}
	

	 
	public int getAmericanAge(String birthDate) {
		LocalDate now = LocalDate.now();
		LocalDate parsedBirthDate = LocalDate.parse(birthDate, DateTimeFormatter.ofPattern("yyyyMMdd"));
	 
		int americanAge = now.minusYears(parsedBirthDate.getYear()).getYear(); // (1)
	 

		if (parsedBirthDate.plusYears(americanAge).isAfter(now)) { 
			americanAge = americanAge -1;
		}
	 
		return americanAge;    
	}
	
	
	


}
