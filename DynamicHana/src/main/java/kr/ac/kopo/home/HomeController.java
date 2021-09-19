package kr.ac.kopo.home;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home(HttpSession session) {
		MemberVO userVO = new MemberVO();
		userVO.setId("test");
		userVO.setPw("test");
		userVO.setName("구본성");
		userVO.setMemberNo(1);
		session.setAttribute("userVO", userVO);
		return "index";
	}
}
