package kr.ac.kopo.stmt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.stmt.service.StmtService;
import kr.ac.kopo.stmt.vo.StmtVO;
import kr.ac.kopo.util.PagingVO;

@Controller
public class StmtController {

	@Autowired
	private CardService cardService;

	@Autowired
	private StmtService stmtService;

	@GetMapping("/cardAuth")
	public ModelAndView cardAuth(HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView("card/cardAuth");

		List<UserCardVO> usercard = cardService.selectUserCardList(user.getMemberNo());
		mav.addObject("usercard", usercard);

		return mav;
	}

	@PostMapping("/cardAuth")
	@ResponseBody
	public int checkCardAuth(UserCardVO usercard, HttpSession session) {

		int result = cardService.checkCardPassword(usercard);

		if (result == 1) {
			session.setAttribute("usercard", usercard);
			System.out.println(usercard);
		}

		return result;

	}

	@GetMapping("/monthlyStmt")
	public ModelAndView monthlyStmt(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView("card/monthlyStmt");

		MemberVO user = (MemberVO) session.getAttribute("userVO");
		UserCardVO usercard = (UserCardVO) session.getAttribute("usercard");

		// 카드명
		String cardName = stmtService.selectCardName(usercard.getCardNo());
		mav.addObject("cardName", cardName);

		// 거래금액, 거래건수
		StmtVO mainInfo = stmtService.selectCardMainInfo(usercard.getCardNo());
		mav.addObject("mainInfo", mainInfo);

		// 최다 카테고리
		StmtVO mainCategory = stmtService.selectCardMainCategory(usercard.getCardNo());
		mav.addObject("mainCategory", mainCategory);

		// TOP 5 소비
		List<StmtVO> topfive = stmtService.selectTopFive(usercard.getCardNo());
		mav.addObject("topfive", topfive);

		// 카테고리별 소비
		List<StmtVO> categoryConsumption = stmtService.selectCategoryConsumption(usercard.getCardNo());
		mav.addObject("categoryConsumption", categoryConsumption);

		// 주차별 소비
		List<StmtVO> weeklyConsumption = stmtService.selectWeeklyConsumption(usercard.getCardNo());
		mav.addObject("weeklyConsumption", weeklyConsumption);

		// 총 거래내역

		int total = stmtService.selectMonthlyLength(usercard.getCardNo());

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<StmtVO> monthlyConsumption = stmtService.selectMonthlyConsumption(usercard.getCardNo(), vo);
		mav.addObject("monthlyConsumption", monthlyConsumption);
		mav.addObject("paging", vo);
		mav.addObject("total", total);

		System.out.println(monthlyConsumption);
		/*
		 * // 총 거래내역 List<StmtVO> monthlyConsumption =
		 * stmtService.selectMonthlyConsumption(usercard.getCardNo());
		 * mav.addObject("monthlyConsumption", monthlyConsumption);
		 */

		return mav;
	}
	
	@GetMapping("/monthlyStmt/filterList")
	public ModelAndView monthlyStmt2(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session)
					throws Exception {
		ModelAndView mav = new ModelAndView("card/monthlyStmtFilter");
		
		MemberVO user = (MemberVO) session.getAttribute("userVO");
		UserCardVO usercard = (UserCardVO) session.getAttribute("usercard");
		
		// 총 거래내역
		
		int total = stmtService.selectMonthlyLength(usercard.getCardNo());
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<StmtVO> monthlyConsumption = stmtService.selectMonthlyConsumption(usercard.getCardNo(), vo);
		mav.addObject("monthlyConsumption", monthlyConsumption);
		mav.addObject("paging", vo);
		mav.addObject("total", total);
		
		System.out.println(monthlyConsumption);
		/*
		 * // 총 거래내역 List<StmtVO> monthlyConsumption =
		 * stmtService.selectMonthlyConsumption(usercard.getCardNo());
		 * mav.addObject("monthlyConsumption", monthlyConsumption);
		 */
		
		return mav;
	}

}