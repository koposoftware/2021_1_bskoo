<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>하나카드 다이나믹하나 관리자페이지</title>

<jsp:include page="./include/assets.jsp" />


<script>
	window.onload = function() {
		lineChartDraw();
		barChartDraw();

	}

	var label_1 = []
	var data_1 = []

	<c:forEach items="${requestScope.weelkyConsumption }" var="weelkyConsumption"
		varStatus="loop">
	data_1.push(parseInt("${ weelkyConsumption.subTotal }"))
	label_1.push("${ weelkyConsumption.historyDate }")
	</c:forEach>

	var max_value = Math.max.apply(null, data_1);

	lineChartData = {
		labels : label_1,
		datasets : [ {
			label : 'Performance',
			data : data_1
		} ]
	}

	let lineChartDraw = function() {
		var ctx = document.getElementById('myChart').getContext('2d');

		var lineChart = new Chart(
				ctx,
				{
					type : 'line',
					options : {
						scales : {
							yAxes : [ {

								gridLines : {
									lineWidth : 1,
									color : Charts.colors.gray[900],
									zeroLineColor : Charts.colors.gray[900]
								},
								ticks : {
									beginAtZero : false,
									userCallback : function(value, index,
											values) {
										value = value.toString();
										value = value.split(/(?=(?:...)*$)/);
										value = value.join(',');
										return value + "원";
									}

								}
							} ]
						},
						tooltips : {
							callbacks : {
								label : function(item, data) {
									var label = data.datasets[item.datasetIndex].label
											|| '';
									var yLabel = item.yLabel;
									var content = '';

									if (data.datasets.length > 1) {
										content += '<span class="popover-body-label mr-auto">'
												+ label + '</span>';
									}

									content += '<span class="popover-body-value">'
											+ yLabel + '원</span>';
									return content;
								}
							}
						}
					},
					data : lineChartData
				});

	};

	var label_2 = []
	var data_2 = []

	<c:forEach items="${requestScope.monthlyConsumption }" var="monthlyConsumption"
		varStatus="loop">
	data_2.push(parseFloat("${ monthlyConsumption.subTotalDouble }"))
	label_2.push("${ monthlyConsumption.historyDate }")
	</c:forEach>

	let barChartDraw = function() {
		var ctx = document.getElementById('myChart2').getContext('2d');

		var barChart = new Chart(
				ctx,
				{
					type : 'bar',
					options : {
						scales : {
							yAxes : [ {
								gridLines : {
									lineWidth : 1,
									color : '#dfe2e6',
									zeroLineColor : '#dfe2e6'
								},
								ticks : {
									callback : function(value) {
										if (!(value % 10)) {
											//return '$' + value + 'k'
											return value
										}
									}
								}
							} ]
						},
						tooltips : {
							callbacks : {
								label : function(item, data) {
									var label = data.datasets[item.datasetIndex].label
											|| '';
									var yLabel = item.yLabel;
									var content = '';

									if (data.datasets.length > 1) {
										content += '<span class="popover-body-label mr-auto">'
												+ label + '</span>';
									}

									content += '<span class="popover-body-value">'
											+ yLabel + '</span>';

									return content;
								}
							}
						}
					},
					data : {
						labels : label_2,
						datasets : [ {
							label : 'Sales',
							data : data_2
						} ]
					}
				})
	}
</script>


</head>

<body>
	<jsp:include page="./include/sidebar.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<jsp:include page="./include/header.jsp" />
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body">
					<!-- Card stats -->
					<div class="row">
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">총
												회원 수</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalMember.cnt }" /> 명</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-yellow text-white rounded-circle shadow">
												<i class="fas fa-users"></i>
											</div>
										</div>

									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if test="${ totalMember.ratio +0 >= 0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalMember.ratio }" />%</span>
											<span class="text-nowrap">지난달 대비 <c:out
													value="${ totalMember.compareValue }" /> 명 증가
											</span>
										</c:if>
										<c:if test="${ totalMember.ratio +0 < 0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalMember.ratio }" />%</span>
											<span class="text-nowrap">지난달 대비 <c:out
													value="${ totalMember.compareValue }" /> 명 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">금일
												거래수</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalTransaction.cnt }" /> 건</span>
										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-warning text-white rounded-circle shadow">
												<i class="fas fa-chart-pie"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalTransaction.cnt +0 >= totalTransaction.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <c:out
													value="${ totalTransaction.cnt +0 - totalTransaction.compareValue+0  }" />
												건 증가
											</span>
										</c:if>
										<c:if
											test="${ totalTransaction.cnt +0 < totalTransaction.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <c:out
													value="${ totalTransaction.compareValue+0- totalTransaction.cnt +0  }" />
												건 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>


						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">금일
												총 거래액</h5>
											<span class="h2 font-weight-bold mb-0"> <fmt:formatNumber
													value="${ totalAmount.cnt }" pattern="#,###" /> 원
											</span>


										</div>
										<div class="col-auto">
											<div class="icon icon-shape bg-danger text-white rounded-circle shadow">
												<i class="fas fa-chart-bar"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalAmount.cnt +0 >= totalAmount.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalTransaction.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <fmt:formatNumber
													value="${ totalAmount.cnt +0 - totalAmount.compareValue+0 }"
													pattern="#,###" /> 원 증가
											</span>
										</c:if>
										<c:if
											test="${ totalAmount.cnt +0 < totalAmount.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalAmount.ratio }" />%</span>
											<span class="text-nowrap">하루 전 대비 <fmt:formatNumber
													value="${ totalAmount.compareValue+0- totalAmount.cnt +0 }"
													pattern="#,###" /> 원 감소
											</span>
										</c:if>

									</p>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-lg-6">
							<div class="card card-stats mb-4 mb-xl-0">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title text-uppercase text-muted mb-0">형성된
												고객 군집</h5>
											<span class="h2 font-weight-bold mb-0"><c:out
													value="${ totalCluster.cnt }" /> 개</span>

										</div>
										<div class="col-auto">
											<div
												class="icon icon-shape bg-info text-white rounded-circle shadow">
												<i class="fas fa-percent"></i>
											</div>
										</div>
									</div>
									<p class="mt-3 mb-0 text-muted text-sm">
										<c:if
											test="${ totalCluster.cnt +0 >= totalCluster.compareValue+0}">


											<span class="text-success mr-2"><i
												class="fa fa-arrow-up"></i> <c:out
													value="${ totalCluster.cnt+0 - totalCluster.compareValue+0  }" />
												개</span>
											<span class="text-nowrap">지난달 대비 </span>
										</c:if>
										<c:if
											test="${ totalCluster.cnt +0 < totalCluster.compareValue+0}">


											<span class="text-danger mr-2"><i
												class="fas fa-arrow-down"></i> <c:out
													value="${ totalCluster.compareValue+0 - totalCluster.cnt+0  }" />
												개</span>
											<span class="text-nowrap">지난달 대비 </span>
										</c:if>

									</p>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid mt--7">

			<div class="row">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card bg-gradient-default shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-light ls-1 mb-1">하나카드 회원</h6>
									<h2 class="text-white mb-0">최근 7일 거래액</h2>
								</div>

							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<!-- Chart wrapper -->
								<canvas id="myChart" class="chart-canvas"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">하나카드 회원</h6>
									<h2 class="mb-0">최근 6개월 거래액</h2>
									<h6 class="mb-0">(단위 : 억)</h6>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- Chart -->
							<div class="chart">
								<canvas id="myChart2" class="chart-canvas"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-5">
				<div class="col-xl-8 mb-5 mb-xl-0">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">TOP 10 카드</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">카드명</th>
										<th scope="col" class="text-center">총 회원</th>
										<th scope="col" class="text-center">이번달 가입 회원</th>
										<th scope="col" class="text-center">지난달 대비 가입자</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${requestScope.topTenCard }" var="topTenCard"
										varStatus="loop">
										<tr>
											<td scope="row"><c:out value="${ topTenCard.cardName }" /></td>
											<td class="text-center"><c:out
													value="${ topTenCard.cnt }" /></td>
											<td class="text-center"><c:out
													value="${ topTenCard.thisMonth }" /></td>

											<c:choose>
												<c:when
													test="${ topTenCard.thisMonth+0 >= topTenCard.lastMonth+0}">
													<td class="text-center"><i
														class="fas fa-arrow-up text-success mr-3"></i> <c:out
															value="${ topTenCard.ratio }" /> %</td>
												</c:when>
												<c:when
													test="${ topTenCard.thisMonth+0 < topTenCard.lastMonth+0}">
													<td class="text-center"><i
														class="fas fa-arrow-down text-warning mr-3"></i> <c:out
															value="${ topTenCard.ratio }" /> %</td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>

								</tbody>
								<%-- <tbody>
									<c:forEach items="${requestScope.memberCluster }"
										var="memberCluster" varStatus="loop">
										<tr>
											<td scope="row"><c:out
													value="${ memberCluster.clusterNo }" /></td>
											<td><c:out value="${ memberCluster.cnt }" /></td>
											<td><c:out value="${ memberCluster.category }" /></td>
											<td>링크</td>
										</tr>
									</c:forEach>

								</tbody> --%>
							</table>
						</div>
					</div>
				</div>
				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">이번달 시간대별 소비</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">시간대</th>
										<th scope="col" class="text-center">소비 건수</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" class="text-center">아침</th>
										<td class="text-center"><fmt:formatNumber
												value="${ consumptionTimeSolt.morning }" pattern="#,###" />
											건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.morning * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-danger"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.morning * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.morning * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="text-center">점심</th>
										<td class="text-center"><fmt:formatNumber
												value="${ consumptionTimeSolt.lunch }" pattern="#,###" /> 건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.lunch * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-success"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.lunch * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.lunch * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>

									<tr>
										<th scope="row" class="text-center">저녁</th>
										<td class="text-center"><fmt:formatNumber
												value="${ consumptionTimeSolt.dinner }" pattern="#,###" />
											건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.dinner * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-primary"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.dinner * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.dinner * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" class="text-center">야간</th>
										<td class="text-center"><fmt:formatNumber
												value="${ consumptionTimeSolt.night }" pattern="#,###" /> 건</td>
										<td>
											<div class="d-flex align-items-center">
												<span class="mr-2"><fmt:formatNumber
														value="${ consumptionTimeSolt.night * 100 / consumptionTimeSolt.subTotal }"
														pattern="##" /> %</span>
												<div>
													<div class="progress">
														<div class="progress-bar bg-gradient-info"
															role="progressbar"
															aria-valuenow="${ consumptionTimeSolt.night * 200 / consumptionTimeSolt.subTotal }"
															aria-valuemin="0" aria-valuemax="100"
															style="width: ${ consumptionTimeSolt.night * 200 / consumptionTimeSolt.subTotal }%;"></div>
													</div>
												</div>
											</div>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="./include/bottom.jsp" />
		</div>
	</div>

</body>

</html>

