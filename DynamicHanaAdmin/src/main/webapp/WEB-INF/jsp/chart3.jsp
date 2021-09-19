<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>테스트</title>

<link rel="stylesheet" href="./common.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="./jquery-3.4.1.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>

</head>

<body>

	<table class="table_center" style="width: 1000px;">
		<tr>
			<td style="height: 80px;">&nbsp;</td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;">
					<tr>
						<td
							style="width: 120px; background-color: #eeeeee; text-align: center; font-size: 14px;">초회원
							수<br> 30만명
						</td>
						<td style="width: 20px;"></td>
						<td
							style="width: 120px; background-color: #eeeeee; text-align: center; font-size: 14px;">금일
							거래수<br> 3만 2천건
						</td>
						<td style="width: 20px;"></td>
						<td
							style="width: 120px; background-color: #eeeeee; text-align: center; font-size: 14px;">금일
							총 거래액<br> 32억 4천만원
						</td>
						<td style="width: 20px;"></td>
						<td
							style="width: 120px; background-color: #eeeeee; text-align: center; font-size: 14px;">금일
							총 거래액<br> 32억 4천만원
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="height: 10px;"></td>
		</tr>
		<tr>
			<td>
				<table style="width: 100%;">
					<tr>
						<td style="width: 50%;">
							<div id="container1"
								style="width: 500px; height: 460px; margin: 0 auto"></div>
						</td>
						<td style="width: 50%;">
							<div id="container2"
								style="width: 500px; height: 460px; margin: 0 auto"></div>
						</td>
					</tr>
					<tr>
						<td style="width: 50%;">
							<div id="container3"
								style="width: 500px; height: 460px; margin: 0 auto"></div>
						</td>
						<td style="width: 50%;">

							<table style="width: 100%;">
								<tr>
									<td style="width: 50%;">
										<div id="container4"
											style="width: 200px; height: 260px; margin: 0 auto"></div>
									</td>
									<td style="width: 50%;">
										<div id="container5"
											style="width: 200px; height: 260px; margin: 0 auto"></div>
									</td>
								</tr>
								<tr>
									<td style="width: 50%;">
										<div id="container6"
											style="width: 200px; height: 260px; margin: 0 auto"></div>
									</td>
									<td style="width: 50%;">
										<div id="container7"
											style="width: 200px; height: 260px; margin: 0 auto"></div>
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</td>
		</tr>

	</table>



	<script language="JavaScript">
		$(document)
				.ready(
						function() {

							var title = {
								text : '최근 일주일 거래량 변동',
								align : 'left'
							};
							var subtitle = {
								text : ''
							};
							var xAxis = {
								categories : [ '1', '2', '3', '4', '5', '6',
										'7', '8' ]
							};
							var yAxis = {
								title : {
									text : 'Temperature (\xB0C)'
								},
								plotLines : [ {
									value : 0,
									width : 1,
									color : '#808080'
								} ]
							};

							var tooltip = {
								valueSuffix : '\xB0C'
							}

							var legend = {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'middle',
								borderWidth : 0
							};

							var series = [
									{
										name : 'name1',
										data : [ 7.0, 6.9, 9.5, 14.5, 18.2,
												10.5, 25.2, 26.5 ]
									},
									{
										name : 'name12',
										data : [ -0.2, 0.8, 5.7, 11.3, 17.0,
												10.0, 24.8, 24.1 ]
									} ];

							var json = {};

							json.title = title;
							json.subtitle = subtitle;
							json.xAxis = xAxis;
							json.yAxis = yAxis;
							json.tooltip = tooltip;
							json.legend = legend;
							json.series = series;

							$('#container1').highcharts(json);

							var chart = {
								type : 'column',
								marginTop : 80,
								marginRight : 40
							};
							var title = {
								text : '성별/연령비'
							};
							var xAxis = {
								categories : [ '20대', '30대', '40대', '50대',
										'60대' ]
							};
							var yAxis = {
								allowDecimals : false,
								min : 0,
								title : {
									text : ''
								},
								stackLabels : {
									enabled : true,
									style : {
										fontWeight : 'bold',
										color : (Highcharts.defaultOptions.title.style && Highcharts.defaultOptions.title.style.color)
												|| 'gray'
									}
								}
							};
							var tooltip = {
								headerFormat : '<b>{point.key}</b><br>',
								pointFormat : '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
							};

							var plotOptions = {
								series : {
									dataLabels : {
										enabled : true
									}
								},
								column : {
									stacking : 'normal',
									dataLabels : {
										enabled : true
									}
								},
								dataLabels : {
									enabled : true
								}
							};
							var series = [ {
								name : '여자',
								data : [ 21.4, 19.2, 12.1, 3.2, 0.6 ],
								stack : 'male'
							}, {
								name : '남자',
								data : [ 13.4, 15.2, 8.1, 3.2, 0.6 ],
								stack : 'male'
							} ];

							var json = {};
							json.chart = chart;
							json.title = title;
							json.xAxis = xAxis;
							json.yAxis = yAxis;
							json.tooltip = tooltip;
							json.plotOptions = plotOptions;
							json.series = series;

							$('#container2').highcharts(json);

							Highcharts.chart('container3', {
								chart : {
									type : 'bar',
									marginLeft : 50
								},
								title : {
									text : '가입자 기준 카드 순위'
								},
								subtitle : {
									text : ''
								},
								xAxis : {
									type : 'category',
									title : {
										text : null
									},
									min : 0,
									max : 3,
									scrollbar : {
										enabled : false
									},
									tickLength : 0
								},
								yAxis : {
									min : 0,
									max : 1200,
									title : {
										text : '',
										align : 'high'
									}
								},
								plotOptions : {
									bar : {
										dataLabels : {
											enabled : false
										}
									}
								},
								legend : {
									enabled : false
								},
								credits : {
									enabled : false
								},
								series : [ {
									name : 'Card',
									data : [ [ "A카드", 1000 ], [ "B카드", 575 ],
											[ "C카드", 523 ], [ "D카드", 427 ] ]
								} ]
							});

							Highcharts
									.chart(
											'container4',
											{

												chart : {
													polar : true,
													type : 'line'
												},
												accessibility : {
													description : ''
												},

												title : {
													text : '제 1군집',
													x : -80
												},

												pane : {
													size : '80%'
												},

												xAxis : {
													categories : [ '쇼핑', '문화',
															'통신', '의료', '교통',
															'뷰티' ],
													tickmarkPlacement : 'on',
													lineWidth : 0
												},

												yAxis : {
													gridLineInterpolation : 'polygon',
													lineWidth : 0,
													min : 0
												},

												tooltip : {
													shared : true,
													pointFormat : '<span style="color:{series.color}">{series.name}: <b></b><br/>'
												},

												legend : {
													enabled : false,
													align : 'right',
													verticalAlign : 'middle',
													layout : 'vertical'
												},

												series : [ {
													name : '소비비중',
													data : [ 43000, 19000,
															60000, 35000,
															17000, 10000 ],
													pointPlacement : 'on'
												} ],

												responsive : {
													rules : [ {
														condition : {
															maxWidth : 500
														},
														chartOptions : {
															legend : {
																align : 'center',
																verticalAlign : 'bottom',
																layout : 'horizontal'
															},
															pane : {
																size : '70%'
															}
														}
													} ]
												}

											});

							Highcharts
									.chart(
											'container5',
											{

												chart : {
													polar : true,
													type : 'line'
												},
												accessibility : {
													description : ''
												},

												title : {
													text : '제 2군집',
													x : -80
												},

												pane : {
													size : '80%'
												},

												xAxis : {
													categories : [ '쇼핑', '문화',
															'통신', '의료', '교통',
															'뷰티' ],
													tickmarkPlacement : 'on',
													lineWidth : 0
												},

												yAxis : {
													gridLineInterpolation : 'polygon',
													lineWidth : 0,
													min : 0
												},

												tooltip : {
													shared : true,
													pointFormat : '<span style="color:{series.color}">{series.name}: <b></b><br/>'
												},

												legend : {
													enabled : false,
													align : 'right',
													verticalAlign : 'middle',
													layout : 'vertical'
												},

												series : [ {
													name : '소비비중',
													data : [ 43000, 19000,
															60000, 35000,
															17000, 10000 ],
													pointPlacement : 'on'
												} ],

												responsive : {
													rules : [ {
														condition : {
															maxWidth : 500
														},
														chartOptions : {
															legend : {
																align : 'center',
																verticalAlign : 'bottom',
																layout : 'horizontal'
															},
															pane : {
																size : '70%'
															}
														}
													} ]
												}

											});
							//////////////////////////////////

							Highcharts
									.chart(
											'container6',
											{

												chart : {
													polar : true,
													type : 'line'
												},
												accessibility : {
													description : ''
												},

												title : {
													text : '제 3군집',
													x : -80
												},

												pane : {
													size : '80%'
												},

												xAxis : {
													categories : [ '쇼핑', '문화',
															'통신', '의료', '교통',
															'뷰티' ],
													tickmarkPlacement : 'on',
													lineWidth : 0
												},

												yAxis : {
													gridLineInterpolation : 'polygon',
													lineWidth : 0,
													min : 0
												},

												tooltip : {
													shared : true,
													pointFormat : '<span style="color:{series.color}">{series.name}: <b></b><br/>'
												},

												legend : {
													enabled : false,
													align : 'right',
													verticalAlign : 'middle',
													layout : 'vertical'
												},

												series : [ {
													name : '소비비중',
													data : [ 43000, 19000,
															60000, 35000,
															17000, 10000 ],
													pointPlacement : 'on'
												} ],

												responsive : {
													rules : [ {
														condition : {
															maxWidth : 500
														},
														chartOptions : {
															legend : {
																align : 'center',
																verticalAlign : 'bottom',
																layout : 'horizontal'
															},
															pane : {
																size : '70%'
															}
														}
													} ]
												}

											});

							Highcharts
									.chart(
											'container7',
											{

												chart : {
													polar : true,
													type : 'line'
												},
												accessibility : {
													description : ''
												},

												title : {
													text : '제 4군집',
													x : -80
												},

												pane : {
													size : '80%'
												},

												xAxis : {
													categories : [ '쇼핑', '문화',
															'통신', '의료', '교통',
															'뷰티' ],
													tickmarkPlacement : 'on',
													lineWidth : 0
												},

												yAxis : {
													gridLineInterpolation : 'polygon',
													lineWidth : 0,
													min : 0
												},

												tooltip : {
													shared : true,
													pointFormat : '<span style="color:{series.color}">{series.name}: <b></b><br/>'
												},

												legend : {
													enabled : false,
													align : 'right',
													verticalAlign : 'middle',
													layout : 'vertical'
												},

												series : [ {
													name : '소비비중',
													data : [ 43000, 19000,
															60000, 35000,
															17000, 10000 ],
													pointPlacement : 'on'
												} ],

												responsive : {
													rules : [ {
														condition : {
															maxWidth : 500
														},
														chartOptions : {
															legend : {
																align : 'center',
																verticalAlign : 'bottom',
																layout : 'horizontal'
															},
															pane : {
																size : '70%'
															}
														}
													} ]
												}

											});

						});
	</script>


</body>

</html>





