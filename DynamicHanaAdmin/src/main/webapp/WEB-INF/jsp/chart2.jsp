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

</head>

<body>

<table class="table_center" style="width: 1000px;">
	<tr>
		<td style="height: 80px;">
			&nbsp;
		</td>
	</tr>
	<tr>
		<td>
			<span style="font-size: 20px;"><b>김미미님의 2021년 7월 레포트</b></span>
		</td>
	</tr>
	<tr>
		<td style="height: 10px;"></td>
	</tr>
	<tr>
		<td>
		
			<table>
			
				<tr>
					<td rowspan="2">
						<div id="container1" style="width: 500px; height: 460px; margin: 0 auto"></div>
						<div style="margin: 0 auto; text-align: center; font-size: 14px;"><b>김미미 고객님의 8월 기준<br> 음식에 가장 많은 금액을 소비하고 있습니다.</b></div>
					</td>
					<td style="vertical-align: top;">
						<b>7월에 소비한 카테고리 영역 (거래금액 순)</b>
						<table class="table_center" style="width: 500px;">
							<tr style="height: 32px;">
								<td style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196); font-size: 14px;">NO</td>
								<td style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196); font-size: 14px;">카테고리</td>
								<td style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196); font-size: 14px;">거래금액</td>
								<td style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196); font-size: 14px;">거래건수</td>
								<td style="text-align: center; color: #ffffff; background-color: rgb(68, 114, 196); font-size: 14px;">거래당 평균<br>거래금액</td>
							</tr>
							<tr style="height: 32px;">
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">1</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234); font-size: 11px;">음식</td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">320,000원</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">14</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">10,000원</span></td>
							</tr>
							<tr style="height: 32px;">
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">2</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245); font-size: 11px;">의류</td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">160,000원</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">5</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">23,000원</span></td>
							</tr>
							<tr style="height: 32px;">
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">3</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234); font-size: 11px;">교통</td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">50,000원</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">14</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">6,000원</span></td>
							</tr>
							<tr style="height: 32px;">
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">4</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245); font-size: 11px;">통신</td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">40,000원</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">5</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(233,235,245);"><span style="font-size: 11px;">8,000원</span></td>
							</tr>
							<tr style="height: 32px;">
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">5</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234); font-size: 11px;">기타</td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">30,000원</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">6</span></td>
								<td style="text-align: center; color: #000000; background-color: rgb(207,213,234);"><span style="font-size: 11px;">5,000원</span></td>
							</tr>

						</table>
					</td>
				</tr>
				
				<tr>
					<td>	
						<br>
						<div id="container2" style="width: 500px; height: 300px; margin: 0 auto"></div>
					</td>
				</tr>
				
			</table>

		</td>
	</tr>
	
</table>



<script language="JavaScript">
$(document).ready(function() {

   Highcharts.chart('container1', {
		chart: {
			type: 'pie'
		},
		title: {
			text: '<b>거래금액 기준 카테고리 분포</b>',
			align: 'center',
			verticalAlign: 'top',
			y: 20
		},
		tooltip: {
			headerFormat: '',
			pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
				'거래금액 기준 카테고리 분포 : <b>{point.y}</b>%' +
				''
		},
		plotOptions: {
			pie: {
				dataLabels: {
					enabled: true,
					distance: -40,
					style: {
						fontWeight: 'bold',
						color: 'white'
					}
				},
				showInLegend: false
			}
		},
		series: [{
			minPointSize: 10,
			innerSize: '70%',
			zMin: 0,
			name: 'countries',
			data: [{
				name: '음식',
				y: 53
			}, {
				name: '기타',
				y: 5
			}, {
				name: '통신',
				y: 7
			}, {
				name: '교통',
				y: 8
			}, {
				name: '의류',
				y: 27
			}]
		}]
	});


   
   var chart = {
      type: 'column'
   };
   var title = {
      text: '<b>7월에 소비한 음식 거래</b>',
      align: 'left'
   };    
   var subtitle = {
      text: ''
   };
   var xAxis = {
      type: 'category',
      labels: {
         //rotation: -45,
         style: {
            fontSize: '13px',
            fontFamily: 'Verdana, sans-serif'
         }
      }
   };
   var yAxis ={
      min: 0,
      title: {
        text: ''
      }
   };  
   var tooltip = {
      pointFormat: '{point.y:.1f}'
   };   
   var credits = {
      enabled: false
   };
   var legend = {
      enabled: false,
      layout: 'vertical',
      align: 'right',
      verticalAlign: 'top',
      borderWidth: 0
   };
   var series= [{
            name: 'Project',
            data: [
                ['8월 1일', 14000],
                ['8월 4일', 50000],
                ['8월 14일', 60000],
                ['8월 18일', 10000]
            ],
            dataLabels: {
                enabled: true,
                // rotation: -90,
                // color: '#FFFFFF',
                // align: 'right',
                format: '{point.y:.1f}', // one decimal
                // y: 10, // 10 pixels down from the top
                style: {
                    // fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
   }];     
      
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



