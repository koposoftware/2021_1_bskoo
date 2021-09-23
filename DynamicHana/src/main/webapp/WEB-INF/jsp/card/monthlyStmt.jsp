<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Job Board</title>
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
	$(document).ready(function() {
		$("#cntPerInput").change(function() {
			selChange(1)
		})
	})

	window.onload = function() {

		barChartDraw();
		pieChartDraw();

	}

	var color_list = [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)',
			'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)',
			'rgb(153, 102, 255)', 'rgb(201, 203, 207)' ]

	/* chart1 */

	var label_1 = []
	var data_1 = []

	var color_1 = []

	<c:forEach items="${requestScope.weeklyConsumption }" var="weeklyConsumption"
		varStatus="loop">
	data_1.push(parseFloat("${ weeklyConsumption.subTotal }"))
	label_1.push("${ weeklyConsumption.category }")
	</c:forEach>

	for (var i = 0; i < data_1.length; i++) {
		color_1.push(color_list[i])
	}

	var max_index = 0
	var max_value = data_1[0]

	for (var i = 0; i < data_1.length; i++) {
		if (max_value < data_1[i]) {
			max_value = data_1[i]
			max_index = i
		}
	}


	let barChartDraw = function() {
		$("#ch1_span1").text(label_1[max_index] + "에 ")
		$("#ch1_span1").append("<br>")
		$("#ch1_span2").text(
				data_1[max_index].toString().replace(
						/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
						+ "원으로 가장 많은 소비를 하셨습니다.")

		var ctx = document.getElementById("myChart1");

		ctx.height = 220;
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : label_1,
				datasets : [ {
					data : data_1,
					borderColor : "transparent",
					borderWidth : "0",
					backgroundColor : 'rgb(75, 192, 192)',
				} ]
			},
			options : {
				maintainAspectRatio : true,
				legend : {
					display : false
				},
				scales : {
					xAxes : [ {

						categoryPercentage : 1,
						barPercentage : 0.65
					} ],
					yAxes : [ {
						maxTicksLimit : 7
					} ]
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
		})
	};

	/* chart2 */

	var label_2 = []
	var data_2 = []

	var color_2 = []

	<c:forEach items="${requestScope.categoryConsumption }" var="categoryConsumption"
		varStatus="loop">
	data_2.push(parseFloat("${ categoryConsumption.subTotal }"))
	label_2.push("${ categoryConsumption.category }")
	</c:forEach>

	for (var i = 0; i < data_2.length; i++) {
		color_2.push(color_list[i])
	}

	let pieChartDraw = function() {
		var ctx = document.getElementById("myChart2");

		ctx.height = 280;
		var myChart = new Chart(
				ctx,
				{
					type : 'doughnut',
					data : {
						datasets : [ {
							label : "카테고리별 소비 분포",
							data : data_2,
							backgroundColor : color_2,
							hoverBackgroundColor : color_2,
							borderWidth : [ 0, 0 ],
							hoverBorderColor : [ 'transparent', 'transparent' ]
						} ],
						labels : label_2
					},
					options : {

						doughnutlabel : {
							labels : [ {
								text : '550',
								font : {
									size : 20,
									weight : 'bold'
								}
							}, {
								text : 'total'
							} ]
						},
						maintainAspectRatio : false,
						responsive : true,
						cutoutPercentage : 87,
						animation : {
							animateScale : true,
							animateRotate : true
						},
						legend : {
							display : true,
							position : 'bottom',
							labels : {
								fontSize : 14,
								fontFamily : "Poppins,sans-serif"
							}

						},
						tooltips : {
							callbacks : {
								label : function(tooltipItem, data) {
									var dataset = data.datasets[tooltipItem.datasetIndex];
									var total = dataset.data.reduce(function(
											previousValue, currentValue,
											currentIndex, array) {
										return previousValue + currentValue;
									});
									var label = label_2[tooltipItem.index]
									var data = data_2[tooltipItem.index]
									data = data.toString().replace(
											/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,
											",")
									var currentValue = dataset.data[tooltipItem.index];
									var percentage = Math
											.floor(((currentValue / total) * 100) + 0.5);

									return label + " " + data + "원 ("
											+ percentage + "%)";
								}
							},
							titleFontFamily : "Poppins",
							xPadding : 15,
							yPadding : 10,
							caretPadding : 0,
							bodyFontSize : 16,
						}
					}
				});
	}
</script>
<script>
	function selChange(p) { //p : 현재페이지 번호
		/* location.href = "${pageContext.request.contextPath}/cardstmt?nowPage=${paging.nowPage}&cntPerPage="
				+ sel; */
		$.ajax({
			'type' : 'get',
			async: false,
			'contentType' : "application/json; charset=utf-8",
			'url' : '${pageContext.request.contextPath}/monthlyStmt/filterList',
			'data' : {
				nowPage : p,
				cntPerPage : $("#cntPerInput").val(),
				
	
			},
	
			'success' : function(data) {
				nowPage = p
				cntPerPage=$("#cntPerInput").val()
				
				$('#historyTable').empty()
				$('#historyTable').html(data)
				
				console.log("nowPage : " + nowPage)
				console.log("cntPerPage : " + cntPerPage) 
				console.log("석세스")
				
				 /* "pagingGroup" id= "page_${p}" */
	
				/* #('.number').css("color","black"); */
	
			},
			'error' : function() {
				console.log("실패")
	
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
	<!-- END WELCOME-->

	<!-- STATISTIC-->
	<section class="statistic statistic2">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="statistic__item statistic__item--green">
						<span class="desc">총 거래금액</span>
						<h2 class="number">
							<fmt:formatNumber value="${mainInfo.subTotal }" pattern="#,###" />
							원
						</h2>
						<div class="icon">
							<i class="zmdi zmdi-money"></i>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="statistic__item statistic__item--orange">
						<span class="desc">총 거래건수</span>
						<h2 class="number">
							<c:out value="${ mainInfo.cnt }" />
							건
						</h2>
						<div class="icon">
							<i class="zmdi zmdi-calendar-notezmdi zmdi-shopping-cart"></i>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="statistic__item statistic__item--blue">
						<span class="desc">최다 거래 카테고리</span>
						<h2 class="number">
							<c:out value="${ mainCategory.category }" />
						</h2>
						<div class="icon">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="statistic__item statistic__item--red">
						<span class="desc">거래카드명</span>
						<h2 class="number" style="color: white">
							<c:out value="${ cardName }" />
						</h2>
						<div class="icon">
							<i class="zmdi zmdi-card"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END STATISTIC-->

	<!-- STATISTIC CHART-->
	<section class="statistic-chart">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title-5 m-b-35">
						<c:out value="${ mainInfo.month }" />
						월의 거래 요약
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<!-- CHART-->
					<div class="statistic-chart-1">
						<h3 class="title-3 m-b-30">주차별 거래내역</h3>
						<div class="chart-wrap">
							<canvas id="myChart1"></canvas>
						</div>
						<div class="statistic-chart-1-note">
							<span class="big" id="ch1_span1"></span> <span id="ch1_span2"></span>
						</div>
					</div>
					<!-- END CHART-->
				</div>
				<div class="col-md-6 col-lg-4">
					<!-- TOP CAMPAIGN-->
					<div class="top-campaign">
						<h3 class="title-3 m-b-30">Top 5 소비내역</h3>
						<div class="table-responsive">
							<table class="table table-top-campaign">
								<tbody>

									<c:forEach items="${requestScope.topfive}" var="topfive"
										varStatus="status">
										<tr>
											<td><c:out value="${ topfive.category }" /></td>
											<td><fmt:formatNumber value="${topfive.subTotal }"
													pattern="#,###" /> 원</td>
										</tr>

									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
					<!-- END TOP CAMPAIGN-->
				</div>
				<div class="col-md-6 col-lg-4">
					<!-- CHART PERCENT-->
					<div class="chart-percent-2">
						<h3 class="title-3 m-b-30">카테고리 분포</h3>
						<div class="chart-wrap">
							<canvas id="myChart2"></canvas>

						</div>

					</div>
					<!-- END CHART PERCENT-->
				</div>
			</div>
		</div>
	</section>
	<!-- END STATISTIC CHART-->

	<!-- DATA TABLE-->
	<section class="p-t-20">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="title-5 m-b-35">
						<c:out value="${ mainInfo.month }" />
						월 상세 거래내역
					</h3>
					<div class="filters" style="float: right">

						<div class="serch_cat d-flex justify-content-end">

							<select id="cntPerInput" name="sel">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개씩
									보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩
									보기</option>
								<option value="15"
									<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개씩
									보기</option>
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩
									보기</option>
							</select>


						</div>

					</div>



					<div id="historyTable"
						class="table-responsive table-responsive-data2 paginated">
						<table class="table table-data2" style="font-size: 18px">
							<thead>
								<tr>

									<th class="txt-center" style="font-size: 20px">NO</th>
									<th class="txt-center" style="font-size: 20px">일자</th>
									<th class="txt-center" style="font-size: 20px">가맹점</th>
									<th class="txt-center" style="font-size: 20px">금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.monthlyConsumption}"
									var="monthlyConsumption" varStatus="status">
									<tr class="tr-shadow">

										<td class="txt-center" style="font-size: 20px"><c:out
												value="${ monthlyConsumption.no }" /></td>
										<td class="txt-center" style="font-size: 20px"><c:out
												value="${ monthlyConsumption.historyDate }" /></td>
										<td class="txt-center" style="font-size: 20px"><c:out
												value="${ monthlyConsumption.store }" /></td>
										<td class="txt-center" style="font-size: 20px"><fmt:formatNumber
												value="${monthlyConsumption.amount }" pattern="#,###" /> 원</td>


									</tr>
									<tr class="spacer"></tr>
								</c:forEach>

							</tbody>
						</table>
						<div style="display: block; text-align: center;">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="${pageContext.request.contextPath}/monthlyStmt?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a class="pagingGroup cursor_pointer" id="page_${p}"
											onclick="selChange(${p})"<%-- href="${pageContext.request.contextPath}/cardstmt?nowPage=${p }&cntPerPage=${paging.cntPerPage}" --%>>${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="${pageContext.request.contextPath}/monthlyStmt?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
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
		</span> <span> <a href="${pageContext.request.contextPath}/monthlyStmt2">
				<button class="au-btn au-btn-icon au-btn--green au-btn--small">
					<i class="zmdi zmdi-play"></i>다음 페이지
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