package kr.ac.kopo.admincard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.admincard.service.AdminCardService;
import kr.ac.kopo.admincard.vo.AdminCardVO;
import kr.ac.kopo.dashboard.service.DashboardService;
import kr.ac.kopo.dashboard.vo.DashboardVO;

@Controller
public class AdminCardController {

	@Autowired
	private AdminCardService adminCardService;

	@Autowired
	private DashboardService dashboardService;

	@GetMapping("/mail")
	public ModelAndView mail() {
		ModelAndView mav = new ModelAndView("mail");

		List<DashboardVO> memberCluster = dashboardService.selectMemberCluster();
		mav.addObject("memberCluster", memberCluster);

		List<AdminCardVO> cardList = adminCardService.selectCardList();
		mav.addObject("cardList", cardList);

		mav.addObject("admincardVO", new AdminCardVO());
		
		return mav;

	}
	
	@PostMapping("/mail")
	public String sendingMail(@ModelAttribute("admincardVO") AdminCardVO admincardVO) {
		System.out.println(admincardVO);
		
		adminCardService.sendingMail(admincardVO);
		
		return "redirect:/";
		
	}

	@ResponseBody
	@GetMapping("/mail/recoCard/{no}")
	public List<AdminCardVO> recommendationCard(@PathVariable(value = "no", required = false) int no) {
		List<AdminCardVO> recommendationCard = adminCardService.selectReccomendationCard(no);
		return recommendationCard;

	}

	@ResponseBody
	@GetMapping("/mail/cardInfo/{no}")
	public List<AdminCardVO> cardInfo(@PathVariable(value = "no", required = false) int no) {
		List<AdminCardVO> cardInfo = adminCardService.selectCardInfo(no);
		return cardInfo;

	}
	
	@ResponseBody
	@PostMapping("/mail/memberCount")
	public int memberCount(@RequestBody Map<String, Object> param) {
		
		int memberCount = adminCardService.selectMemberCount(param);
		return memberCount;
		
	}

}
