<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>하나카드 다이나믹하나</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

<%-- <!-- Fontfaces CSS-->
<link href="${pageContext.request.contextPath}/resources/vendor/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="${ pageContext.request.contextPath }/resources/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="${ pageContext.request.contextPath }/resources/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${ pageContext.request.contextPath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">
 --%>

<link
	href="${pageContext.request.contextPath}/resources/dashboard/theme.css"
	rel="stylesheet" media="all">
<script
	src="https://raw.githubusercontent.com/google/palette.js/master/palette.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-doughnutlabel/2.0.3/chartjs-plugin-doughnutlabel.js"></script>

<script>
	window.onload = function() {

		lineChartDraw();
		barChartDraw();
		barChartDraw2();
	}

	/* chart1 */

	var data_1 = []
	var label_1 = []

	<c:forEach items="${requestScope.timeslot }" var="timeslot"
			varStatus="loop">
	data_1.push(parseFloat("${ timeslot.subTotal }"))
	label_1.push("${ timeslot.historyDate }")
	</c:forEach>

	let lineChartDraw = function() {
		const brandProduct = 'rgba(0,181,233,0.8)'
		const brandService = 'rgba(0,173,95,0.8)'

		var elements = 24

		var ctx = document.getElementById("myChart1");
		ctx.height = 250;
		var myChart = new Chart(ctx, {
			type : 'line',
			data : {
				labels : label_1,
				datasets : [ {

					backgroundColor : brandService,
					borderColor : 'transparent',
					pointHoverBackgroundColor : '#fff',
					borderWidth : 0,
					data : data_1

				} ]
			},
			options : {
				maintainAspectRatio : true,
				legend : {
					display : false
				},
				responsive : true,
				scales : {
					xAxes : [ {
						gridLines : {
							drawOnChartArea : true,
							color : '#f2f2f2'
						},
						ticks : {
							fontFamily : "Poppins",
							fontSize : 12
						}
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							maxTicksLimit : 5,
							stepSize : 50,

							fontFamily : "Poppins",
							fontSize : 12
						},
						gridLines : {
							display : true,
							color : '#f2f2f2'

						}
					} ]
				},
				elements : {
					point : {
						radius : 0,
						hitRadius : 10,
						hoverRadius : 4,
						hoverBorderWidth : 3
					}
				},
				tooltips : {
					callbacks : {
						label : function(tooltipItem, data) {

							var data = data_1[tooltipItem.index]
							data = data.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")

							return data + " 원";
						}
					}
				}

			}
		});
	}
	/* chart2 */

	var data_2 = []
	var label_2 = []

	<c:forEach items="${requestScope.weekday }" var="weekday"
			varStatus="loop">
	data_2.push(parseFloat("${ weekday.subTotal }"))
	label_2.push("${ weekday.historyDate }")
	</c:forEach>

	let barChartDraw = function() {
		const brandProduct = 'rgba(0,181,233,0.8)'
		const brandService = 'rgba(0,173,95,0.8)'

		var elements = 7

		var ctx = document.getElementById("myChart2");
		ctx.height = 250;
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : label_2,
				datasets : [ {

					backgroundColor : brandService,
					borderColor : 'transparent',
					pointHoverBackgroundColor : '#fff',
					borderWidth : 0,
					data : data_2

				} ]
			},
			options : {
				maintainAspectRatio : true,
				legend : {
					display : false
				},
				responsive : true,
				scales : {
					xAxes : [ {
						gridLines : {
							drawOnChartArea : true,
							color : '#f2f2f2'
						},
						ticks : {
							fontFamily : "Poppins",
							fontSize : 12
						}
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							maxTicksLimit : 5,
							stepSize : 50,

							fontFamily : "Poppins",
							fontSize : 12
						},
						gridLines : {
							display : true,
							color : '#f2f2f2'

						}
					} ]
				},
				elements : {
					point : {
						radius : 0,
						hitRadius : 10,
						hoverRadius : 4,
						hoverBorderWidth : 3
					}
				},
				tooltips : {
					callbacks : {
						label : function(tooltipItem, data) {

							var data = data_2[tooltipItem.index]
							data = data.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")

							return data + " 원";
						}
					}
				}

			}
		});
	}

	/* chart3 */

	var data_3 = []
	var compare_3 = []
	var label_3 = []

	<c:forEach items="${requestScope.personalCategoryConsumption }" var="personalCategoryConsumption"
			varStatus="loop">
	<c:choose>
	<c:when test="${personalCategoryConsumption.chk eq 'my' }">
	data_3.push(parseFloat("${ personalCategoryConsumption.amount }"))
	label_3.push("${ personalCategoryConsumption.category }")
	</c:when>
	<c:otherwise>
	compare_3.push(parseFloat("${ personalCategoryConsumption.amount }"))
	</c:otherwise>
	</c:choose>

	</c:forEach>

	let barChartDraw2 = function() {

		var ctx = document.getElementById("myChart3");
		var myChart = new Chart(ctx, {
			type : 'bar',
			defaultFontFamily : 'Poppins',
			data : {
				labels : label_3,
				datasets : [ {
					label : "나의 소비 평균",
					data : data_3,
					borderColor : "rgba(0, 123, 255, 0.9)",
					borderWidth : "0",
					backgroundColor : "rgba(0, 123, 255, 0.5)",
					fontFamily : "Poppins"
				}, {
					label : "하나카드 고객 평균",
					data : compare_3,
					borderColor : "rgba(0,0,0,0.09)",
					borderWidth : "0",
					backgroundColor : "rgba(0,0,0,0.07)",
					fontFamily : "Poppins"
				} ]
			},
			options : {
				responsive : false,
				varValueSpacing : 20,
				legend : {
					position : 'top',
					labels : {
						fontFamily : 'Poppins'
					}

				},
				scales : {
					xAxes : [ {
						ticks : {
							fontFamily : "Poppins"

						}
					} ],
					yAxes : [ {
						ticks : {
							beginAtZero : true,
							fontFamily : "Poppins"
						}
					} ]
				},
				tooltips : {
					callbacks : {
						label : function(tooltipItem, data) {

							var data = data_3[tooltipItem.index]
							data = data.toString().replace(
									/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")

							return data + " 원";
						}
					}
				}
			}
		})
	}
</script>

</head>

<body>
	<header>
		<jsp:include page="../include/topMenu.jsp" />
	</header>
	<!-- header-end -->

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>월간 거래 레포트</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->
	<!-- ================ contact section start ================= -->
	<!-- WELCOME-->
	<div class="mt-30"></div>
	<section class="welcome p-t-10">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="title-4">
						<span>${ userVO.name }님의 <c:out value="${ mainInfo.month }" />월
							레포트
						</span>
					</h1>
					<hr class="line-seprate">
				</div>
			</div>
		</div>
	</section>
	<section class="statistic-chart">
		<div class="container">
			<div class="main-content" style="padding-top: 20px">
				<div class="section__content section__content--p30">
					<div class="container-fluid">


						<h3 class="title-5 m-b-35">
							주로
							<c:forEach items="${requestScope.personalCategory }"
								var="personalCategory" varStatus="loop">
								<c:out value="${ personalCategory.category }" />
								<c:if test="${!loop.last}">, </c:if>


							</c:forEach>
							에 소비가 주로 이루어지고 있습니다. 추천카드들을 확인해보세요!
						</h3>


						<div class="row">
							<div class="col-lg-6">
								<div class="au-card recent-report">
									<div class="au-card-inner">
										<h3 class="title-2">주요 카테고리 소비 비교</h3>
										<div class="chart-info"></div>
										<div class="recent-report__chart">
											<canvas id="myChart3"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<!-- TOP CAMPAIGN-->
								<div class="au-card recent-report" style="padding-bottom: 30px;">
									<div class="au-card-inner">
										<h3 class="title-3 m-b-30">주요 카테고리 기반 카드</h3>
										<div class="table-responsive">
											<table class="table table-top-campaign">
												<tbody>

													<c:forEach items="${requestScope.personalCard }"
														var="personalCard" varStatus="loop">
														<tr>
															<td><a
																href="${pageContext.request.contextPath}/detail/${ personalCard.cardCode }"><c:out
																		value="${ personalCard.cardName }" /></a></td>
															<td></td>
														</tr>


													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-lg-6">
								<div class="au-card recent-report">
									<div class="au-card-inner">
										<h3 class="title-2">시간대별 소비내역</h3>
										<div class="chart-info"></div>
										<div class="recent-report__chart">
											<canvas id="myChart1"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="au-card recent-report">
									<div class="au-card-inner">
										<h3 class="title-2">요일별 소비내역</h3>
										<div class="chart-info"></div>
										<div class="recent-report__chart">
											<canvas id="myChart2"></canvas>
										</div>
									</div>
								</div>
							</div>

						</div>


					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- END DATA TABLE-->
	<div class="mt-30"></div>
	<div style="text-align: center">
		<span> <a href="${pageContext.request.contextPath}/">
				<button class="au-btn au-btn-icon au-btn--green au-btn--small">
					<i class="zmdi zmdi-home"></i>돌아가기
				</button>
		</a>
		</span> <span> <a
			href="${pageContext.request.contextPath}/monthlyStmt">
				<button class="au-btn au-btn-icon au-btn--green au-btn--small">
					<i class="zmdi zmdi-play"></i>이전 페이지
				</button>
		</a></span>
	</div>
	<div class="mt-30"></div>






	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="../include/bottom.jsp" />
	</footer>
	<!--/ footer end  -->
</body>
</html>