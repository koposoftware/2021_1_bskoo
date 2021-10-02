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

<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

	$(document).ready(function() {

		$("#cntPerInput").change(function() {
			selChange(1)
		})
		
		$(".category_group").click(function() {
			selChange(1)

			
			
		})
		
		$(".filteringSearchBtn").click(function(){
			selChange(1)
			txt = $("#filteringTxt").val();
			console.log(txt)
		})
	})
	
	window.onload = function() {
		barChartDraw();
		lineChartDraw();
		
	}
	
	
	
	var label_1=[]
	var data_1=[]
	
	<c:forEach items="${requestScope.category }" var="category"
		varStatus="loop">
		data_1.push(parseInt("${ category.subTotal }"))
		label_1.push("${ category.category }")
	</c:forEach>
	
		var max_value = Math.max.apply(null, data_1);
		
	barChartData ={
			labels: label_1,
			datasets: [{
				labels: '카테고리 당 소비금액',
				backgroundColor: 'rgb(0, 165, 255)',
				borderColor: 'rgb(0, 165, 255)',
				data: data_1,
				borderWidth: 1
			}]
	}
	

	
	let barChartDraw = function(){
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			type: 'bar',
			data: barChartData,
			options : {
	               responsive: false,
	               title : {
	                  display : false,
	                  fontSize : 20
	               },
	               legend : {
	                  display : false,
	               },
	               scales : {
	                   xAxes: [{
	                           barPercentage: 0.4,
	                           gridLines: {
	                               color: "rgba(0, 0, 0, 0)"
	                           },
	                           ticks : {
	                           fontSize : 12
	                        }
	                       }],
	                  yAxes : [{
	                     
	                     ticks : {
	                    	max : max_value+50000,
	                        stepSize: 40000,
	                        beginAtZero: true,
	                        maxTicksLimit : 7,
	                        fontSize : 14,
	                        userCallback:function(value, index, values){
	                        	value=value.toString();
	                        	value=value.split(/(?=(?:...)*$)/);
	                        	value=value.join(',');
	                        	return value+"원";
	                        }
	                     }
	                  }]
	                  
	               },
	               animation: {
	                  duration: 1,
	                  onComplete: function () {
	                     var chartInstance = this.chart,
	                        ctx = chartInstance.ctx;
	                     ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
	                     ctx.fillStyle = 'black';
	                     ctx.textAlign = 'center';
	                     ctx.textBaseline = 'bottom';

	                     this.data.datasets.forEach(function (dataset, i) {
	                        var meta = chartInstance.controller.getDatasetMeta(i);
	                        meta.data.forEach(function (bar, index) {
	                           var data = numberWithCommas(dataset.data[index]) + '원';                     
	                           ctx.fillText(data, bar._model.x, bar._model.y - 5);
	                        });
	                     });
	                  }
	               }
	               
	            }
		});
	}
		
		
		
		
	var label_2=[]
	var data_2=[]
	
	<c:forEach items="${requestScope.weeklyConsumption }" var="weeklyConsumption" varStatus="loop">
	label_2.push("${ weeklyConsumption.week }")
		data_2.push(parseInt("${ weeklyConsumption.subTotal }"))
		
	</c:forEach>
	
		var max_value2 = Math.max.apply(null, data_2);
		console.log(data_2)
		
		
	lineChartData ={
			labels: label_2,
			datasets: [{
				labels: '주차별 소비금액',
				lineTension: 0,
				fill:false,
				borderColor: 'rgb(0, 165, 255)',
				data: data_2,
				borderWidth: 2
			}]
	}
	
	let lineChartDraw = function(){
		var ctx = document.getElementById('myChart2').getContext('2d');
		var chart = new Chart(ctx, {
			type: 'line',
			data: lineChartData,
			options : {
					bezierCurve : false,
	               responsive: false,
	               title : {
	                  display : false,
	                  text : '주차별 소비금액',
	                  fontSize : 20
	               },
	               legend : {
	                  display : false,
	               },
	               scales : {
	                   xAxes: [{
	                	   maxTick:7,
	                           barPercentage: 0.4,
	                           gridLines: {
	                               color: "rgba(0, 0, 0, 0)"
	                           },
	                           ticks : {
	                           fontSize : 12
	                        }
	                       }],
	                  yAxes : [{
	                     
	                     ticks : {
	                    	max : max_value2+50000,
	                        stepSize: 40000,
	                        maxTicksLimit : 7,
	                        beginAtZero: true,
	                        fontSize : 14,
	                        userCallback:function(value, index, values){
	                        	value=value.toString();
	                        	value=value.split(/(?=(?:...)*$)/);
	                        	value=value.join(',');
	                        	return value+"원";
	                        }
	                     }
	                  }]
	                  
	               },
	               animation: {
	                  duration: 1,
	                  onComplete: function () {
	                     var chartInstance = this.chart,
	                        ctx = chartInstance.ctx;
	                     ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
	                     ctx.fillStyle = 'black';
	                     ctx.textAlign = 'center';
	                     ctx.textBaseline = 'bottom';

	                     this.data.datasets.forEach(function (dataset, i) {
	                        var meta = chartInstance.controller.getDatasetMeta(i);
	                        meta.data.forEach(function (bar, index) {
	                           var data = numberWithCommas(dataset.data[index]) + '원';                     
	                           ctx.fillText(data, bar._model.x, bar._model.y - 5);
	                        });
	                     });
	                  }
	               }
	               
	            }
		});
	}
	
			
	var txt;
	var nowPage;
	var cntPerPage; 
	var category;
	
	function categoryClick(ths){
        var category_chg = $(ths).text();
        category_chg = category_chg.trim()
      	category = category_chg.split('(')[0]
      	console.log(category)
      	selChange(1)
        }
        
	function selChange(p) { //p : 현재페이지 번호
		/* location.href = "${pageContext.request.contextPath}/cardstmt?nowPage=${paging.nowPage}&cntPerPage="
				+ sel; */
		console.log("category : " + category)
		console.log("txt" + txt)
		$.ajax({
			'type' : 'get',
			async: false,
			'contentType' : "application/json; charset=utf-8",
			'url' : '${pageContext.request.contextPath}/cardstmt/filterList',
			'data' : {
				txt: $("#filteringTxt").val(),
				nowPage : p,
				cntPerPage : $("#cntPerInput").val(),
				category : category
				

			},

			'success' : function(data) {
				nowPage = p
				cntPerPage=$("#cntPerInput").val()
				$('#historyTable').empty()
				$('#historyTable').html(data)
				

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
						<h3>실시간 카드 내역서</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->


	<!--================Blog Area =================-->
	<section class="blog_area section-padding">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">
						<div class="section-top-border">
							<div class="recent_joblist white-bg ">
								<div class="row align-items-center">
									<div class="col-md-6">
										<h4>최근 90일 거래 내역</h4>

										<h5 id="totalLength">
											<br> 총
											<c:out value="${ total }" />
											건의 거래가 조회되었습니다.
										</h5>

									</div>

									<div class="col-md-6">
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
								</div>
							</div>

							<div id="historyTable">
								<table border="1" class="table table-bordered paginated">
									<tr>
										<th width="30%" class="txt-center">일시</th>
										<th width="15%" class="txt-center">카테고리</th>
										<th width="40%" class="txt-center">항목</th>
										<th width="15%" class="txt-center">금액</th>

									</tr>
									<c:forEach items="${requestScope.history }" var="history"
										varStatus="loop">
										<tr>
											<td class="txt-center"><c:out
													value="${ history.historyDate }" /></td>
											<td class="txt-center"><c:out
													value="${ history.category }" /></td>
											<td class="txt-center"><c:out value="${ history.store }" /></td>
											<td class="txt-center"><fmt:formatNumber
													value="${ history.amount }" pattern="#,###" />원</td>
										</tr>
									</c:forEach>
								</table>



								<div style="display: block; text-align: center;">
									<c:if test="${paging.startPage != 1 }">
										<a
											href="${pageContext.request.contextPath}/cardstmt?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
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
											href="${pageContext.request.contextPath}/cardstmt?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
									</c:if>
								</div>
							</div>
						</div>

						<div class="mg-top-30">
							<h5>카테고리 별 소비금액 합계</h5>
						</div>
						<div class="mg-top-30">
							<canvas id="myChart" width="700px" height="250px"></canvas>
						</div>
						<div class="mg-top-30">
							<h5 class="mg-top-30">최근 6주간 소비금액 합계 변화</h5>
						</div>
						<div class="mg-top-30">
							<canvas id="myChart2" width="700px" height="250px"></canvas>
						</div>

					</div>
				</div>


				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget mg-top-30">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input id="filteringTxt" type="text" class="form-control"
											placeholder='항목을 입력하세요' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Keyword'">
										<div class="input-group-append">
											<button class="btn filteringSearchBtn" type="button">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn filteringSearchBtn">검색</button>
							</form>

						</aside>

						<aside class="single_sidebar_widget search_widget">
							<div class="apply_now mg-right-30" align="center">
								<!-- <a class="heart_mark" href="#"> <i
																	class="fa fa-heart"></i>
																</a> -->


							</div>
							<a href="cardstmt">
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn filteringSearchBtn">필터
									초기화</button>
							</a>
						</aside>


						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">카테고리 필터링</h4>
							<ul class="list cat-list">

								<c:forEach items="${ requestScope.category }" var="category"
									varStatus="loop">

									<li><a onclick="categoryClick(this)"
										class="d-flex category_group cursor_pointer"
										id="group_${category.category}"> <c:out
												value="${ category.category }" /> (<c:out
												value="${ category.cnt }" />)
									</a></li>

								</c:forEach>
							</ul>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">90일 내 최다 지출 TOP 5</h3>
							<c:forEach items="${ requestScope.consumptionRanking }"
								var="ranking" varStatus="loop">
								<div class="media post_item">
									<div class="media-body">
										<a href="single-blog.html">
											<h3>
												<c:out value="${ ranking.store }" />
												<fmt:formatNumber value="${ ranking.amount }"
													pattern="#,###" />
												원
											</h3>
										</a>
										<p>
											<c:out value="${ ranking.historyDate }" />
										</p>
									</div>
								</div>
							</c:forEach>

						</aside>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="../include/bottom.jsp" />
	</footer>
	<!--/ footer end  -->



	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
	</script>
</body>
</html>