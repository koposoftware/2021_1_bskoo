<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Job Board</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/vendor/jquery-1.12.4.min.js"></script>

<script>

	window.onload = function() {
		pieChartDraw();
		pieChart2Draw();
	}

	let pieChartData = {
		labels : [ '남성', '여성' ],
		datasets : [ {
			data : [ '${userStat.male}', '${userStat.female}' ],
			backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)' ]
		} ]
	};

	let pieChartDraw = function() {
		let ctx = document.getElementById('pieChartCanvas').getContext('2d');

		window.pieChart = new Chart(ctx, {
			type : 'pie',
			data : pieChartData,
			options : {
				responsive : false,
				pieceLabel : {
					mode : "label",
					fontSize : 11,
					fontStyle : 'bold'
				}
			}
		});
	};

	let pieChart2Data = {
		labels : [ '20대', '30대', '40대', '50대', '60대 이상' ],
		datasets : [ {
			data : [ '${userStat.age20}', '${userStat.age30}',
					'${userStat.age40}', '${userStat.age50}',
					'${userStat.senior}' ],
			backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)',
					'rgb(255, 205, 86)', 'rgb(75, 192, 192)',
					'rgb(54, 162, 235)' ]
		} ]
	};

	let pieChart2Draw = function() {
		let ctx = document.getElementById('pieChartCanvas2').getContext('2d');

		window.pieChart = new Chart(ctx, {
			type : 'pie',
			data : pieChart2Data,
			options : {
				responsive : false,
				pieceLabel : {
					mode : "label",
					fontSize : 11,
					fontStyle : 'bold'
				}

			}
		});
	};
</script>

</head>

<body>
	<header>
		<jsp:include page="../include/topMenu.jsp" />
	</header>

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>
							<c:out value="${ card.cardName }" />
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->

	<div class="job_details_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="job_details_header">
						<div class="single_jobs white-bg d-flex justify-content-between">
							<div class="jobs_left d-flex align-items-center">
								<div class="thumb" style="width: 150px; padding: 0">
									<img style="width: 148px; height: 80px;"
										src="${ pageContext.request.contextPath }/resources/img/card/<c:out
														value="${ card.cardCode }" />.png"
										alt="" />
								</div>
								<div class="jobs_conetent">
									<h4 class="mg-bottom-10">
										<c:out value="${ card.cardName }" />
									</h4>
									<div class="links_locat d-flex align-items-center">
										<div class="location">
											<p>
												<i class="fa fa-map-marker"></i>
												<c:choose>
													<c:when test="${ card.cardType eq 'CREDIT' }">신용카드</c:when>
													<c:when test="${ card.cardType eq 'CHECK' }">체크카드</c:when>
												</c:choose>
											</p>
										</div>
										<div class="location">
											<p>
												<i class="fa fa-clock-o"></i> 연회비
												<c:out value="${ card.annualFee }" />
												원
											</p>
										</div>
									</div>
								</div>
							</div>
							<div class="jobs_right"></div>
						</div>
					</div>
					<div class="descript_wrap white-bg" style="height: 1000px">
						

						<div class="single_wrap">
							<c:set var="tempname" value="" />
							<c:forEach items="${requestScope.notice}" var="notice"
								varStatus="status">
								<c:if test="${notice.categoryKor ne tempname }">
									<h4 class="mg-bottom-10">
										<c:out value="${ notice.categoryKor }" />
									</h4>
								</c:if>
								<ul class="mg-bottom-10">
									<li style="margin-bottom: 5px;"><c:out
											value="${ notice.notice }" /></li>
								</ul>
								<c:set var="tempname" value="${notice.categoryKor}" />

							</c:forEach>



						</div>
						<hr>
						<div class="single_wrap">
							<h4>내가 이 카드를 사용하면? (지난달 소비 기준)</h4>
							<h5>아래 사항은 최대의 혜택을 나타냅니다.</h5>
							<ul id="customBenefit">
								<c:if
									test="${ (card.alwaysDiscount  * userConsumption.alwaysDiscount ) ne 0.0 }">
									<li>언제나 할인 : <fmt:formatNumber
											value="${userConsumption.alwaysDiscount  }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.alwaysDiscount  * (1-card.alwaysDiscount )  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.alwaysDiscount  * userConsumption.alwaysDiscount  }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.cvs * userConsumption.cvs) ne 0.0 }">
									<li>편의점 : <fmt:formatNumber
											value="${userConsumption.cvs }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.cvs * (1-card.cvs)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.cvs * userConsumption.cvs }" type="number" />원
										혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.airMileage * userConsumption.airMileage) ne 0.0 }">
									<li>항공(마일리지) : <fmt:formatNumber
											value="${userConsumption.airMileage }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.airMileage * (1-card.airMileage)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.airMileage * userConsumption.airMileage }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.beauty * userConsumption.beauty) ne 0.0 }">
									<li>뷰티 : <fmt:formatNumber
											value="${userConsumption.beauty }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.beauty * (1-card.beauty)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.beauty * userConsumption.beauty }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.communication * userConsumption.communication) ne 0.0 }">
									<li>대중교통 : <fmt:formatNumber
											value="${userConsumption.publicTransportation }"
											type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.publicTransportation * (1-card.publicTransportation)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.publicTransportation * userConsumption.publicTransportation }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.cafeBakery * userConsumption.cafeBakery) ne 0.0 }">
									<li>카페/베이커리 : <fmt:formatNumber
											value="${userConsumption.cafeBakery }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.cafeBakery * (1-card.cafeBakery)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.cafeBakery * userConsumption.cafeBakery }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.movie * userConsumption.movie) ne 0.0 }">
									<li>영화 : <fmt:formatNumber
											value="${userConsumption.movie }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.movie * (1-card.movie)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.movie * userConsumption.movie }" type="number" />원
										혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.hypermart * userConsumption.hypermart) ne 0.0 }">
									<li>대형마트 : <fmt:formatNumber
											value="${userConsumption.hypermart }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.hypermart * (1-card.hypermart)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.hypermart * userConsumption.hypermart }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.culture * userConsumption.culture) ne 0.0 }">
									<li>문화 : <fmt:formatNumber
											value="${userConsumption.culture }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.culture * (1-card.culture)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.culture * userConsumption.culture }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.education * userConsumption.education) ne 0.0 }">
									<li>교육 : <fmt:formatNumber
											value="${userConsumption.education }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.education * (1-card.education)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.education * userConsumption.education }"
											type="number" />원 혜택)
									</li>
								</c:if>


								<c:if
									test="${ (card.annualFeeSupport * userConsumption.annualFeeSupport) ne 0.0 }">
									<li>연회비지원 : <fmt:formatNumber
											value="${userConsumption.annualFeeSupport }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.annualFeeSupport * (1-card.annualFeeSupport)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.annualFeeSupport * userConsumption.annualFeeSupport }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.publicTransportation * userConsumption.publicTransportation) ne 0.0 }">
									<li>대중교통 : <fmt:formatNumber
											value="${userConsumption.publicTransportation }"
											type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.publicTransportation * (1-card.publicTransportation)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.publicTransportation * userConsumption.publicTransportation }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.rental * userConsumption.rental) ne 0.0 }">
									<li>렌탈 : <fmt:formatNumber
											value="${userConsumption.rental }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.rental * (1-card.rental)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.rental * userConsumption.rental }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.oil * userConsumption.oil) ne 0.0 }">
									<li>주유 : <fmt:formatNumber value="${userConsumption.oil }"
											type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.oil * (1-card.oil)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.oil * userConsumption.oil }" type="number" />원
										혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.shopping * userConsumption.shopping) ne 0.0 }">
									<li>쇼핑 : <fmt:formatNumber
											value="${userConsumption.shopping }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.shopping * (1-card.shopping)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.shopping * userConsumption.shopping }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.leisure * userConsumption.leisure) ne 0.0 }">
									<li>레저 : <fmt:formatNumber
											value="${userConsumption.leisure }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.leisure * (1-card.leisure)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.leisure * userConsumption.leisure }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.nationalVoucher * userConsumption.nationalVoucher) ne 0.0 }">
									<li>국민행복카드 : <fmt:formatNumber
											value="${userConsumption.nationalVoucher }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.nationalVoucher * (1-card.nationalVoucher)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.nationalVoucher * userConsumption.nationalVoucher }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.medical * userConsumption.medical) ne 0.0 }">
									<li>의료 : <fmt:formatNumber
											value="${userConsumption.medical }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.medical * (1-card.medical)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.medical * userConsumption.medical }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.pointCashback * userConsumption.pointCashback) ne 0.0 }">
									<li>포인트/캐시백 : <fmt:formatNumber
											value="${userConsumption.pointCashback }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.pointCashback * (1-card.pointCashback)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.pointCashback * userConsumption.pointCashback }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.automobiles * userConsumption.automobiles) ne 0.0 }">
									<li>오토 : <fmt:formatNumber
											value="${userConsumption.automobiles }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.automobiles * (1-card.automobiles)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.automobiles * userConsumption.automobiles }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.finance * userConsumption.finance) ne 0.0 }">
									<li>금융 : <fmt:formatNumber
											value="${userConsumption.finance }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.finance * (1-card.finance)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.finance * userConsumption.finance }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if test="${ (card.eatOut * userConsumption.eatOut) ne 0.0 }">
									<li>외식 : <fmt:formatNumber
											value="${userConsumption.eatOut }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.eatOut * (1-card.eatOut)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.eatOut * userConsumption.eatOut }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.easyPay * userConsumption.easyPay) ne 0.0 }">
									<li>간편결제 : <fmt:formatNumber
											value="${userConsumption.easyPay }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.easyPay * (1-card.easyPay)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.easyPay * userConsumption.easyPay }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.maintenance * userConsumption.maintenance) ne 0.0 }">
									<li>관리비 : <fmt:formatNumber
											value="${userConsumption.maintenance }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.maintenance * (1-card.maintenance)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.maintenance * userConsumption.maintenance }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.premium * userConsumption.premium) ne 0.0 }">
									<li>프리미엄 : <fmt:formatNumber
											value="${userConsumption.premium }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.premium * (1-card.premium)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.premium * userConsumption.premium }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.priorityPass * userConsumption.priorityPass) ne 0.0 }">
									<li>Priority Pass : <fmt:formatNumber
											value="${userConsumption.priorityPass }" type="number" />원에서
										<fmt:formatNumber
											value="${ userConsumption.priorityPass * (1-card.priorityPass)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.priorityPass * userConsumption.priorityPass }"
											type="number" />원 혜택)
									</li>
								</c:if>
								<c:if
									test="${ (card.voucher * userConsumption.voucher) ne 0.0 }">
									<li>바우처 : <fmt:formatNumber
											value="${userConsumption.voucher }" type="number" />원에서 <fmt:formatNumber
											value="${ userConsumption.voucher * (1-card.voucher)  }"
											type="number" />원으로 절감 (<fmt:formatNumber
											value="${ card.voucher * userConsumption.voucher }"
											type="number" />원 혜택)
									</li>
								</c:if>




							</ul>

						</div>
						<div class="single_wrap">
							<h4>
								<c:out value="${ card.cardName }" />
								가입자 정보
							</h4>
							<div style="float: left;">
								<canvas id="pieChartCanvas" width="170px" height="150px"></canvas>
							</div>
							<div style="float: left;">
								<canvas id="pieChartCanvas2" width="480px" height="150px"></canvas>
							</div>



						</div>
					</div>

				</div>
				<div class="col-lg-4">
					<div class="job_sumary">
						<div class="summery_header">
							<h3>카드 정보</h3>
						</div>
						<div class="job_content">
							<ul>
								<li>카드 종류 : <span><c:choose>
											<c:when test="${ card.cardType eq 'CREDIT' }">신용카드</c:when>
											<c:when test="${ card.cardType eq 'CHECK' }">체크카드</c:when>
										</c:choose></span></li>
								<li>연회비 : <span><c:out value="${ card.annualFee }" />
										원</span></li>
								<li>발급대상 : <span><c:choose>
											<c:when test="${ card.cardType eq 'CREDIT' }">전 고객</c:when>
											<c:when test="${ card.cardType eq 'CHECK' }">비교통 - 만 14세 이상 / 후불교통 - 만 18세 이상</c:when>
										</c:choose></span></li>
								<li>발급 신청 : <span>하나카드 홈페이지</span></li>
							</ul>
						</div>
					</div>
					<div class="mt-10">
						<div class="col-lg-12">
							<div class="single_field">
								<div class="reset_btn">
									<a
										href="https://www.hanacard.co.kr/OPIB0040000M.web?schID=ncd&mID=OPIB0040000M"><button
											type="button" class="boxed-btn3 w-100" id="enrollCard">카드
											신청</button></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../include/bottom.jsp" />
	</footer>
</body>


</html>