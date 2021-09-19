<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<title>테스트</title>

<link rel="stylesheet" href="./common.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="./jquery-3.4.1.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

</head>
<jsp:include page="./include/assets.jsp" />
<body>
	<script>
		window.onload = function() {
			barChartDraw();

		}

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

	<canvas id="myChart" class="chart-canvas"></canvas>

</body>

</html>



