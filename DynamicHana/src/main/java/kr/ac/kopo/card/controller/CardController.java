package kr.ac.kopo.card.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.card.service.CardService;
import kr.ac.kopo.card.vo.BenefitVO;
import kr.ac.kopo.card.vo.CardBenefitVO;
import kr.ac.kopo.card.vo.DemographyVO;
import kr.ac.kopo.card.vo.HistoryVO;
import kr.ac.kopo.card.vo.UserCardVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.PagingVO;

@Controller
public class CardController {

	@Autowired
	private CardService cardService;

	@GetMapping("/cardlist")
	public ModelAndView cardList(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		ModelAndView mav = new ModelAndView("card/cardlist");
		int total = cardService.getLength();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<UserCardVO> cardList = cardService.selectCardList(vo);

		mav.addObject("paging", vo);
		mav.addObject("cardList", cardList);

		List<BenefitVO> benefitList = cardService.selectBenefitList();
		mav.addObject("benefitList", benefitList);
		return mav;

	}

	@ResponseBody
	@PostMapping("/cardlist")
	public List<CardBenefitVO> benefitSearch(@RequestBody Map<String, String> paramMap) {
		ModelAndView mav = new ModelAndView("card/cardlist");

		List<CardBenefitVO> cardFilterList = cardService.selectByFilter(paramMap);
		mav.addObject("cardFilterList", cardFilterList);

		List<BenefitVO> benefitList = cardService.selectBenefitList();
		mav.addObject("benefitList", benefitList);

		return cardFilterList;
	}

	@PostMapping("/cardlist/filterList")
	public ModelAndView benefitFiltering(@RequestBody Map<String, String> paramMap) {

		ModelAndView mav = new ModelAndView("card/filterList");

		List<CardBenefitVO> cardFilterList = cardService.selectByFilter(paramMap);
		mav.addObject("cardFilterList", cardFilterList);
		List<BenefitVO> benefitList = cardService.selectBenefitList();
		mav.addObject("benefitList", benefitList);

		return mav;
	}

	@GetMapping("/detail/{no}")
	public ModelAndView detail(@PathVariable("no") int no, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("card/detail");

		List<BenefitVO> notice = cardService.selectNotice(no);
		mav.addObject("notice", notice); // 카드에 대한 공지

		DemographyVO userStat = cardService.selectStatByNo(no);
		mav.addObject("userStat", userStat); // 카드에 대한 인구통계학 정보

		MemberVO user = (MemberVO) session.getAttribute("userVO");

		List<CardBenefitVO> cardInfoList = cardService.selectCardAllInfo(no, user.getMemberNo());

		CardBenefitVO card = cardInfoList.get(0);
		mav.addObject("card", card);

		CardBenefitVO userConsumption = cardInfoList.get(1);
		mav.addObject("userConsumption", userConsumption);

		return mav;
	}

	@GetMapping("/cardSelect")
	public ModelAndView cardSelect(HttpSession session) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("userVO");
		ModelAndView mav = new ModelAndView("card/cardselect");

		List<UserCardVO> usercard = cardService.selectUserCardList(user.getMemberNo());
		mav.addObject("usercard", usercard);

		return mav;
	}

	@PostMapping("/cardSelect")
	@ResponseBody
	public int checkCardPassword(UserCardVO usercard, HttpSession session) {

		int result = cardService.checkCardPassword(usercard);

		if (result == 1) {
			session.setAttribute("usercard", usercard);
		}

		return result;

	}

	@GetMapping("/cardstmt")
	public ModelAndView cardstmt(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session)
			throws Exception {
		ModelAndView mav = new ModelAndView("card/cardstmt");
		UserCardVO card = (UserCardVO) session.getAttribute("usercard");

		int total = cardService.getHistoryLength(card.getCardNo(), null, null);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<HistoryVO> history = cardService.selectTransactionHistory(card.getCardNo(), null, null, vo);

		mav.addObject("total", total);
		mav.addObject("paging", vo);
		mav.addObject("history", history);

		List<HistoryVO> category = cardService.selectTransactionCategory(card.getCardNo());
		
		mav.addObject("category", category);
		
		List<HistoryVO> weeklyConsumption = cardService.selectWeeklyConsumption(card.getCardNo());
		mav.addObject("weeklyConsumption", weeklyConsumption);
		
		List<HistoryVO> consumptionRanking = cardService.selectConsumptionRanking(card.getCardNo());
		mav.addObject("consumptionRanking",consumptionRanking);

		return mav;
	}

	@GetMapping("/cardstmt/filterList")
	public ModelAndView cardstmt2(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "txt", required = false) String txt, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView("card/cardstmtFilter");

		UserCardVO card = (UserCardVO) session.getAttribute("usercard");

		int total_chg = cardService.getHistoryLength(card.getCardNo(), category, txt);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new PagingVO(total_chg, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<HistoryVO> history = cardService.selectTransactionHistory(card.getCardNo(), category, txt, vo);
		
		session.setAttribute("total_chg", total_chg);
		mav.addObject("paging", vo);
		mav.addObject("history", history);

		return mav;
	}

}