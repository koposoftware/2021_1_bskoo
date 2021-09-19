package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@SessionAttributes("memberVO") // 얘는 request 영역이 아니라 session영역에 등록됨
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/register")
	public String register(MemberVO member) {
		return "member/register";

	}

	@PostMapping("/register")
	public String registerFinish(MemberVO member) {

		memberService.register(member);

		System.out.println(member);
		return "redirect:/";

	}

	@PostMapping("/register/checkId")
	@ResponseBody
	public Boolean checkId(@RequestParam String id) {

		Boolean result = memberService.checkId(id);
		return result;
	}

	@PostMapping("/register/smsCertification")
	@ResponseBody
	public String smsCertification(@RequestParam("phone") String phone) {

		String randStr = memberService.sendMsg(phone);
		return randStr;
	}

	@GetMapping("/login")
	public String loginForm() {
		return "member/login";

	}

	@PostMapping("/login")
	public String login(MemberVO member, Model model, HttpSession session) {
		MemberVO userVO = memberService.login(member);
		System.out.println("userVO : " + userVO);

		if (userVO == null) {
			String msg = "아이디 또는 패스워드가 잘못되었습니다.";
			model.addAttribute("msg", msg);
			return "member/login";
		} // 로그인 성공

		session.setAttribute("userVO", userVO);
		String dest = (String) session.getAttribute("dest");

		if (dest != null) { // 로그인 인터셉터를 거쳐왔다면
			session.removeAttribute("dest");
			return "redirect:/" + dest;
		}

		return "redirect:/";

	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	
	@GetMapping("/test")
	public String test() {
		return "test";
	}
	

}