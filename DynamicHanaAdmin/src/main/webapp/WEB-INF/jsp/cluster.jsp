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
</head>
<script>
	$(document).ready(function() {

	})

	window.onload = function() {
		
		barChartDraw2();

	}
	
	/* barChart 1 ()*/
	
	function showGraph(no) {
		var no = no;
		console.log(no)
		$.ajax({
			'type' : 'get',
			'url' : '${pageContext.request.contextPath}/cluster/graph/' + no,

			'success' : output,
			'error' : function() {
				console.log("실패")
			}
		})

	}

	function output(resp) {
		
		console.log(resp)
		var category = []
		var cluster_value = []
		var compare_value = []
		var cluster_name
		var compare_name
		
		$.each(resp, function(index, item) {
			if (item['clusterNo'] != 0) {
				category.push(item['category'])
				cluster_value.push(item['subTotal'])
				cluster_name = item['clusterName']
			} else {
				compare_value.push(item['subTotal'])
				compare_name = item['clusterName']
			}

		})
		
		if(window.barChart!=undefined){
			window.barChart.destroy();
		}
		
		if(cluster_value.length==0){
			if(window.barChart!=undefined){
				window.barChart.destroy();
			}
			var temp="<h3>데이터가 부족합니다</h3><br><h5>데이터가 더 집계된 후 이용하실 수 있습니다</h5>"
			$('#nodata').html(temp)
		}else{
			$('#nodata').empty()
		
			
			var ctx = document.getElementById('myChart1').getContext('2d');
				
			window.barChart = new Chart(
					ctx,
					{
						type : 'bar',
						options : {
							labels: [cluster_name,compare_name],
					        name: [cluster_name,compare_name],
							legend:{
								display:true,
								legendText:[cluster_name,compare_name]
							},
							varValueSpacing:20,
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
							
						},
						data : {
							labels : category,
							datasets : [ {
								label : cluster_name,
								backgroundColor : "green",						    
								data : cluster_value
							},{
								label : compare_name,
								backgroundColor: "orange",
								data : compare_value
	
							}
							]
						}
					})
			}
		
		
		
		
	}

	

	/* barChart2 */
	
	var label_2 = []
	var data_2 = []
	
	<c:forEach items="${requestScope.ageGroup }" var="ageGroup"
		varStatus="loop">
	data_2.push(parseFloat("${ ageGroup.subTotal }"))
	label_2.push("${ ageGroup.clusterName }")
	</c:forEach>

	let barChartDraw2 = function() {
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
<body class="">
	<jsp:include page="./include/sidebar.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<jsp:include page="./include/header.jsp" />
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header border-0">
							<h3 class="mb-0">회원 소비특성별 군집</h3>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col" class="text-center">군집</th>
										<th scope="col" class="text-center">소속회원 수</th>
										<th scope="col" class="text-center">주요소비처</th>
										<th scope="col" class="text-center">군집 비율</th>
										<th scope="col" class="text-center">군집 특성</th>
										<th scope="col" class="text-center">전체메일 보내기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.memberCluster }"
										var="memberCluster" varStatus="loop">
										<tr>
											<th scope="row" class="text-center">

												<div class="media-body">
													<span class="mb-0 text-sm"><c:out
															value="${ memberCluster.clusterName }" /></span>
												</div>
											</th>
											<td class="text-center"><c:out
													value="${ memberCluster.cnt }" /> 명</td>
											<td><c:out value="${ memberCluster.category }" /></td>
											<td>
												<div class="d-flex align-items-center">
													<span class="mr-2"><c:out
															value="${ memberCluster.ratio }" />%</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-warning" role="progressbar"
																aria-valuenow="${ memberCluster.ratio*1.3 }"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${ memberCluster.ratio*1.3 }%;"></div>
														</div>
													</div>
												</div>
											</td>
											<td class="text-center"><button type="button"
													class="btn btn-sm btn-primary" data-toggle="modal"
													data-target="#modal-default"
													onclick="showGraph(${ memberCluster.clusterNo })">
													<c:out value="${ memberCluster.clusterName }" />
													그래프
												</button></td>
											<td class="text-center"><div class="text-center" class="col-4 text-right">
													<a href="${ pageContext.request.contextPath }/mail" class="btn btn-sm btn-primary">메일보내기</a>
												</div></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>

			<!-- modal -->
			<div class="row">
				<div class="col-md-4">

					<div class="modal fade" id="modal-default" tabindex="-1"
						role="dialog" aria-labelledby="modal-default" aria-hidden="true">
						<div class="modal-dialog modal- modal-dialog-centered modal-"
							role="document">
							<div class="modal-content">

								<div class="modal-header">
									<h6 class="modal-title" id="modal-title-default">군집 비교</h6>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>

								<div class="modal-body">

									<div class="chart" id="chartDiv">
										<div id="nodata"></div>
										<canvas id="myChart1"></canvas>
									</div>

								</div>

								<div class="modal-footer">

									<button type="button" class="btn btn-link  ml-auto"
										data-dismiss="modal">닫기</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-5">

				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header bg-transparent">
							<div class="row align-items-center">
								<div class="col">
									<h6 class="text-uppercase text-muted ls-1 mb-1">하나카드 회원</h6>
									<h2 class="mb-0">연령별 회원 분포</h2>

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






				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">최근 3개월 거래건수 분포</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">거래건수</th>
										<th scope="col">회원 수</th>
										<th scope="col" class="text-center">회원 수 비율</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.consumptionCountDist }"
										var="consumptionCountDist" varStatus="loop">
										<tr>
											<th scope="row"><c:out
													value="${ consumptionCountDist.clusterName }" /></th>
											<td><fmt:formatNumber
													value="${ consumptionCountDist.cnt }" pattern="#,###" /> 명</td>
											<td>
												<div class="d-flex align-items-center">
													<span class="mr-2"><fmt:formatNumber
															value="${ consumptionCountDist.ratio }" pattern="##" />
														%</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-gradient-danger"
																role="progressbar"
																aria-valuenow="${ consumptionCountDist.ratio*1.3 }"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${ consumptionCountDist.ratio*1.3 }%;"></div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>


								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-xl-4">
					<div class="card shadow">
						<div class="card-header border-0">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">최근 3개월 평균거래금액 분포</h3>
								</div>

							</div>
						</div>
						<div class="table-responsive">
							<!-- Projects table -->
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">거래금액</th>
										<th scope="col">회원 수</th>
										<th scope="col" class="text-center">회원 수 비율</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.consumptionSumDist }"
										var="consumptionSumDist" varStatus="loop">
										<tr>
											<th scope="row"><c:out
													value="${ consumptionSumDist.clusterName }" /></th>
											<td><fmt:formatNumber
													value="${ consumptionSumDist.cnt }" pattern="#,###" /> 명</td>
											<td>
												<div class="d-flex align-items-center">
													<span class="mr-2"><fmt:formatNumber
															value="${ consumptionSumDist.ratio }" pattern="##" /> %</span>
													<div>
														<div class="progress">
															<div class="progress-bar bg-gradient-danger"
																role="progressbar"
																aria-valuenow="${ consumptionSumDist.ratio*1.3 }"
																aria-valuemin="0" aria-valuemax="100"
																style="width: ${ consumptionSumDist.ratio*1.3 }%;"></div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>


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