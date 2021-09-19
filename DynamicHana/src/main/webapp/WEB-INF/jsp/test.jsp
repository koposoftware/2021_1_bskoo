<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>테스트</title>

<link rel="stylesheet" href="./common.css">

<script src="./jquery-3.4.1.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

</head>

<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.table_center {
	margin-left: auto;
	margin-right: auto;
}

.table_td_image {
	width: 100%;
}
</style>
<body>

	<table class="table_center" style="width: 1000px;">
		<tr>
			<td style="height: 80px;">&nbsp;</td>
		</tr>
		<tr>
			<td><span style="font-size: 20px;"><b>김미미님의 2021년 7월
						레포트</b></span></td>
		</tr>
		<tr>
			<td style="height: 10px;"></td>
		</tr>
		<tr>
			<td>
				<table style="width: 900px;">
					<tr style="height: 40px;">
						<td></td>
						<td><span style="font-size: 16px;"><b>총 거래금액</b></span></td>
						<td><span style="font-size: 16px;"><b>총 거래 건수</b></span></td>
						<td><span style="font-size: 16px;"><b>사용카드</b></span></td>
						<td><span style="font-size: 16px;"><b>보유포인트</b></span></td>
					</tr>
					<tr style="height: 40px;">
						<td></td>
						<td><span style="font-size: 16px;"><b>321,000원</b></span></td>
						<td><span style="font-size: 16px;"><b>45건</b></span></td>
						<td><span style="font-size: 16px;"><b>하나 AAA카드</b></span></td>
						<td><span style="font-size: 16px;"><b>46,400점</b></span></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="height: 10px;"><hr></td>
		</tr>
		<tr>
			<td style="height: 300px;">

				<table class="table_center" style="width: 900px;">
					<tr>
						<td>
							<div id="container1"
								style="width: 450px; height: 300px; margin: 0 auto"></div>
						</td>
						<td rowspan='2' style="width: 450px; vertical-align: top;">
							상세 거래 항목
							<table class="table_center" style="width: 450px;">
								<tr>
									<td
										style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196);">NO</td>
									<td
										style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196);">거래일시</td>
									<td
										style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196);">카테고리</td>
									<td
										style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196);">항목명</td>
									<td
										style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196);">금액</td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">1</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">2021-08-14<br>19:32:14
									</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">음식</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">신전떡</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">32,000원</td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">2</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">2021-08-14<br>19:32:14
									</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">음식</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">신전떡</td>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">32,000원</td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">3</td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">4</td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(207, 213, 234);">5</td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
									<td
										style="color: #000000; background-color: rgb(207, 213, 234);"></td>
								</tr>
								<tr>
									<td
										style="text-align: center; color: #000000; background-color: rgb(233, 235, 245);">&nbsp;</td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
									<td
										style="color: #000000; background-color: rgb(233, 235, 245);"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<div id="container2"
								style="width: 450px; height: 300px; margin: 0 auto"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>



	<script language="JavaScript">
		$(document).ready(
				function() {

					var chart = {
						type : 'column'
					};
					var title = {
						text : '주간 거래 분석',
						align : 'left'
					};
					var subtitle = {
						text : ''
					};
					var xAxis = {
						type : 'category',
						labels : {
							rotation : -45,
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					};
					var yAxis = {
						min : 0,
						title : {
							text : ''
						}
					};
					var tooltip = {
						pointFormat : '{point.y:.1f}'
					};
					var credits = {
						enabled : false
					};
					var legend = {
						enabled : false,
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'top',
						borderWidth : 0
					};
					var series = [ {
						name : 'Project',
						data : [ [ '7월 1주', 170000 ], [ '7월 2주', 150000 ],
								[ '7월 3주', 80000 ], [ '7월 4주', 160000 ],
								[ '7월 5주', 250000 ] ],
						dataLabels : {
							enabled : true,
							// rotation: -90,
							// color: '#FFFFFF',
							// align: 'right',
							format : '{point.y:.1f}', // one decimal
							// y: 10, // 10 pixels down from the top
							style : {
								// fontSize: '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					} ];

					var json = {};
					json.chart = chart;
					json.title = title;
					json.subtitle = subtitle;
					json.xAxis = xAxis;
					json.yAxis = yAxis;
					json.tooltip = tooltip;
					json.legend = legend;
					json.credits = credits;
					json.series = series;

					$('#container1').highcharts(json);

					var chart = {
						type : 'column'
					};
					var title = {
						text : '요일별 거래 분석',
						align : 'left'
					};
					var subtitle = {
						text : ''
					};
					var xAxis = {
						type : 'category',
						labels : {
							rotation : -45,
							style : {
								fontSize : '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					};
					var yAxis = {
						min : 0,
						title : {
							text : ''
						}
					};
					var tooltip = {
						pointFormat : '{point.y:.1f}'
					};
					var credits = {
						enabled : false
					};
					var legend = {
						enabled : false,
						layout : 'vertical',
						align : 'right',
						verticalAlign : 'top',
						borderWidth : 0
					};
					var series = [ {
						name : 'Project',
						data : [ [ '일요일', 170000 ], [ '월요일', 150000 ],
								[ '화요일', 80000 ], [ '수요일', 160000 ],
								[ '목요일', 250000 ], [ '금요일', 190000 ],
								[ '토요일', 360000 ] ],
						dataLabels : {
							enabled : true,
							// rotation: -90,
							// color: '#FFFFFF',
							// align: 'right',
							format : '{point.y:.1f}', // one decimal
							// y: 10, // 10 pixels down from the top
							style : {
								// fontSize: '13px',
								fontFamily : 'Verdana, sans-serif'
							}
						}
					} ];

					var json = {};
					json.chart = chart;
					json.title = title;
					json.subtitle = subtitle;
					json.xAxis = xAxis;
					json.yAxis = yAxis;
					json.tooltip = tooltip;
					json.legend = legend;
					json.credits = credits;
					json.series = series;

					$('#container2').highcharts(json);

				});
	</script>


</body>

</html>






