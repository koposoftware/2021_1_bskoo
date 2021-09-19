package kr.ac.kopo.dashboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.dashboard.service.DashboardService;
import kr.ac.kopo.dashboard.vo.DashboardVO;

@Controller
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;

	@RequestMapping("/")
	public ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView("index");
		DashboardVO totalMember = dashboardService.selectTotalMember();
		mav.addObject("totalMember", totalMember);

		DashboardVO totalTransaction = dashboardService.selectTotalTransaction();
		mav.addObject("totalTransaction", totalTransaction);

		DashboardVO totalAmount = dashboardService.selectTotalAmount();
		mav.addObject("totalAmount", totalAmount);

		DashboardVO totalCluster = dashboardService.selectTotalCluster();
		mav.addObject("totalCluster", totalCluster);

		List<DashboardVO> weelkyConsumption = dashboardService.selectWeelkyConsumption();
		mav.addObject("weelkyConsumption", weelkyConsumption);

		List<DashboardVO> monthlyConsumption = dashboardService.selectMonthlyConsumption();
		mav.addObject("monthlyConsumption", monthlyConsumption);

		List<DashboardVO> topTenCard = dashboardService.selectTopTenCard();
		mav.addObject("topTenCard", topTenCard);

		DashboardVO consumptionTimeSolt = dashboardService.selectConsumptionTimeSlot();
		mav.addObject("consumptionTimeSolt", consumptionTimeSolt);

		return mav;

	}

	@RequestMapping("/cluster")
	public ModelAndView memberCluster(HttpSession session) {
		ModelAndView mav = new ModelAndView("cluster");

		List<DashboardVO> memberCluster = dashboardService.selectMemberCluster();
		mav.addObject("memberCluster", memberCluster);
		
		List<DashboardVO> ageGroup = dashboardService.selectAgeGroup();
		mav.addObject("ageGroup", ageGroup);
		
		List<DashboardVO> consumptionCountDist = dashboardService.selectConsumptionCountDist();
		mav.addObject("consumptionCountDist", consumptionCountDist);
		
		List<DashboardVO> consumptionSumDist = dashboardService.selectConsumptionSumDist();
		mav.addObject("consumptionSumDist", consumptionSumDist);

		return mav;

	}

	@ResponseBody
	@GetMapping("/cluster/graph/{no}")
	public List<DashboardVO> graph(@PathVariable(value = "no", required = false) int no) {
		List<DashboardVO> clusterConsumption = dashboardService.selectClusterConsumption(no);
		return clusterConsumption;

	}

	@RequestMapping("/test")
	public ModelAndView test(HttpSession session) {
		ModelAndView mav = new ModelAndView("test");
		List<DashboardVO> monthlyConsumption = dashboardService.selectMonthlyConsumption();
		mav.addObject("monthlyConsumption", monthlyConsumption);
		return mav;
	}

	@RequestMapping("/test2")
	public String test2(HttpSession session) {

		return "chart2";
	}

	@RequestMapping("/test3")
	public String test3(HttpSession session) {

		return "chart3";
	}
}
