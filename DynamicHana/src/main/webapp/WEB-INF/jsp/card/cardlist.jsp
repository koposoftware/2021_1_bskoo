<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Job Board</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/custom/modal.css">

<script>
	$(document)
			.ready(
					function() {

						$('#modalBtn').click(function() {
							$('.index_modal').css('display', 'block')
							$('body').css("overflow", "hidden");
						})

						//모달 다시 숨기기
						$('.index_modal_cancel').click(function() {
							$('.index_modal').css('display', 'none')
							$('body').css("overflow", "scroll");
						})

						temp = []
						amount_temp = []

						$("input[class=form-check-input]").each(function(idx) {

							var value = $(this).val();
							temp.push("#" + value + "_slider-range");
							amount_temp.push("#" + value + "_amount");

						})

						for (var i = 0; i < temp.length; i++) {

							eval('$(function(){$(temp['
									+ i
									+ ']).slider({range:true,min:0,step:1,max:50,values:[0,50],slide:function(event,ui){$(amount_temp['
									+ i
									+ ']).val(ui.values[0]+" % - "+ui.values[1]+" %")}});$(amount_temp['
									+ i + ']).val($(temp[' + i
									+ ']).slider("values",0)+" % - "+$(temp['
									+ i + ']).slider("values",1)+" %")});')
						}

						$('#searchBtn').click(function() {
							getCardList();
						})

						function getCardList() {

							let benefitInputList = [];

							$("input[class=form-check-input]:checked").each(
									function(idx) {
										var value = $(this).val();
										benefitInputList.push(value);

									})

							console.log("benefitInputList : "
									+ benefitInputList)

							var json_data = {}

							json_data['cardName'] = $("#cardName").val();
							json_data['cardType'] = $("#cardType").val();
							json_data['annualFeeType'] = $("#annualFeeType")
									.val()
							json_data['annualFeeRange'] = $("#amount").val()

							console.log(json_data)

							for (var i = 0; i < benefitInputList.length; i++) {
								json_data[benefitInputList[i]] = document
										.getElementById(benefitInputList[i]
												+ "_amount").value
								console.log(json_data)
							}
							console.log(json_data)

							$
									.ajax({
										'type' : 'post',
										'contentType' : "application/json; charset=utf-8",
										'url' : '${pageContext.request.contextPath}/cardlist/filterList',
										'data' : JSON.stringify(json_data),

										'success' : function(data) {
											$('#cardListDiv').empty()
											$('#cardListDiv').html(data)
											console.log("석세스")

										},
										'error' : function() {
											console.log("실패")
										}
									})
						}

					})

	function annualFeeChange(e) {
		var div = document.getElementById('annualFeeRangeDiv');
		if ($("#annualFeeType").val() == 'Y') {
			div.style.display = 'block';
		} else {
			div.style.display = 'none';
		}

	}

	function getBenefitList() {
		let allBenefitList = [];
		let benefitInputList = [];

		$("input[class=form-check-input]").each(function(idx) {

			var value = $(this).val();
			allBenefitList.push(value);

		})

		$("input[class=form-check-input]:checked").each(function(idx) {

			var value = $(this).val();
			benefitInputList.push(value);

		})

		for (i = 0; i < benefitInputList.length; i++) {

			allBenefitList = allBenefitList.filter(function(item) {
				return item !== benefitInputList[i];

			});
		}

		for (i = 0; i < benefitInputList.length; i++) {
			document.getElementById(benefitInputList[i]).style.display = 'block'
		}

		for (i = 0; i < allBenefitList.length; i++) {
			document.getElementById(allBenefitList[i]).style.display = 'none'
		}

	}

	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${pageContext.request.contextPath}/cardlist?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
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
						<h3>나만의 카드</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->



	<!-- job_listing_area_start  -->
	<div class="job_listing_area plus_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="job_filter white-bg">
						<form name="benefitInputForm">
							<div class="form_inner white-bg">
								<h3>카드 검색 필터</h3>
								<div class="row">
									<div class="col-lg-12">
										<div class="single_field">
											<input type="text" id="cardName" name="cardName"
												placeholder="카드 이름 입력">
										</div>
									</div>
									<div class="col-lg-12">
										<div class="single_field">

											<select class="wide" id="cardType" name="cardType">
												<option value="" data-display="카드 종류 선택">카드 종류 선택</option>
												<option value="CREDIT">신용카드</option>
												<option value="CHECK">체크카드</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="single_field">
											<select class="wide" id="annualFeeType"
												onchange="annualFeeChange(this)" name="annualFeeType">
												<option data-display="연회비 유무 선택">연회비 유무 선택</option>
												<option value="Y">연회비 있음</option>
												<option value="N">연회비 없음</option>
											</select>
										</div>
									</div>
									<div class="col-lg-12" id="annualFeeRangeDiv"
										style="display: none">
										<div class="range_wrap">
											<label for="amount">연회비 범위 : </label>
											<div id="slider-range"></div>
											<p>
												<input type="text" id="amount" readonly
													style="border: 0; color: #7A838B; font-size: 14px; font-weight: 400;"
													name="annualFeeRange">
											</p>
										</div>
									</div>

									<div class="col-lg-12" align="center">
										<div class="single_field">
											<button type="button" class="genric-btn success medium"
												id="modalBtn">혜택 추가/변경</button>
										</div>
									</div>




									<c:forEach items="${requestScope.benefitList }"
										var="benefitList" varStatus="loop">

										<div class="col-lg-12" id="${ benefitList.category }"
											style="display: none">
											<div class="range_wrap">
												<label for="${ benefitList.category }_amount"><c:out
														value="${ benefitList.categoryKor }" /> 범위 : </label>
												<div id="${ benefitList.category }_slider-range"></div>
												<p>
													<input type="text" name="${ benefitList.category }"
														id="${ benefitList.category }_amount" readonly
														style="border: 0; color: #7A838B; font-size: 14px; font-weight: 400;">
												</p>
											</div>
										</div>

									</c:forEach>

								</div>
							</div>
							<div class="mt-10">
								<div class="col-lg-12">
									<div class="single_field">
										<div class="reset_btn">
											<button type="button" class="boxed-btn3 w-100" id="searchBtn">검색</button>
										</div>
									</div>
								</div>
							</div>
							<div class="mt-10">
								<div class="col-lg-12">
									<div class="single_field">
										<div class="reset_btn">
											<a href="cardlist"><button type="button"
													class="boxed-btn3 w-100">RESET</button></a>
										</div>
									</div>
								</div>
							</div>
						</form>


					</div>
				</div>
				<div class="col-lg-9">
					<div class="recent_joblist_wrap">
						<div class="recent_joblist white-bg ">
							<div class="row align-items-center">
								<div class="col-md-6">
									<h4>하나카드 카드목록</h4>
								</div>
								<div class="col-md-6">
									<div class="serch_cat d-flex justify-content-end">
										<select id="cntPerPage" name="sel" onchange="selChange()">
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
					</div>




					<div id="cardListDiv">
						<div class="job_lists m-0">
							<div class="row">


								<table class="paginated">
									<c:forEach items="${requestScope.cardList }" var="cardList"
										varStatus="loop">
										<tr>
											<td>
												<div class="col-lg-12 col-md-12">
													<div
														class="single_jobs white-bg d-flex justify-content-between"
														style="width: 827px">
														<div class="jobs_left d-flex align-items-center">
															<div class="thumb" style="width: 150px; padding: 0">
																<a href="detail/${ cardList.cardCode }"><img
																	style="width: 148px; height: 80px;"
																	src="${ pageContext.request.contextPath }/resources/img/card/<c:out
														value="${ cardList.cardCode }" />.png"
																	alt="" /></a>
															</div>
															<div class="jobs_conetent">
																<c:choose>
																	<c:when test="${fn:length(cardList.cardName) gt 20}">
																		<h5>
																			<a href="detail/${ cardList.cardCode }"> <c:out
																					value="${ cardList.cardName }" />
																			</a>
																		</h5>
																	</c:when>
																	<c:otherwise>
																		<h4>
																			<a href="detail/${ cardList.cardCode }"> <c:out
																					value="${ cardList.cardName }" />
																			</a>
																		</h4>
																	</c:otherwise>
																</c:choose>

																<div class="links_locat d-flex align-items-center">
																	<div class="location">
																		<p>
																			<i class="fa fa-map-marker"></i>
																			<c:choose>
																				<c:when test="${ cardList.cardType eq 'CREDIT' }">신용카드</c:when>
																				<c:when test="${ cardList.cardType eq 'CHECK' }">체크카드</c:when>
																			</c:choose>
																		</p>
																	</div>
																	<div class="location">
																		<p>
																			<i class="fa fa-clock-o"></i> 연회비
																			<c:out value="${ cardList.annualFee }" />
																			원
																		</p>
																	</div>
																</div>
															</div>
														</div>
														<div class="jobs_right">
															<div class="apply_now" align="center">
																<!-- <a class="heart_mark" href="#"> <i
																	class="fa fa-heart"></i>
																</a> -->
																<a href="detail/${ cardList.cardCode }"
																	class="boxed-btn3">상세 혜택</a>
															</div>
															<div class="date">
																<p>n명의 선택을 받은 카드!</p>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>


									</c:forEach>
								</table>



							</div>



						</div>
						<div style="display: block; text-align: center;">
							<c:if test="${paging.startPage != 1 }">
								<a
									href="${pageContext.request.contextPath}/cardlist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
								var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<b>${p }</b>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<a
											href="${pageContext.request.contextPath}/cardlist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<a
									href="${pageContext.request.contextPath}/cardlist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- job_listing_area_end  -->

	<!-- footer start -->

	<!--/ footer end  -->

	<!-- link that opens popup -->


	<script>
		$(function() {
			$("#slider-range")
					.slider(
							{
								range : true,
								min : 0,
								step : 10000,
								max : 250000,
								values : [ 0, 250000 ],
								slide : function(event, ui) {
									$("#amount").val(
											ui.values[0] + "원 - "
													+ ui.values[1] + "원");
								}
							});

			$("#amount").val(
					$("#slider-range").slider("values", 0) + "원 - "
							+ $("#slider-range").slider("values", 1) + "원");
		});

		/* 여기서부터 시작 */

		/* temp = [ '#CAFE_BAKERY_slider-range', '#FINANCE_slider-range' ]
		amount_temp = [ '#CAFE_BAKERY_amount', '#FINANCE_amount' ] */

		/* $(function() {
			$(temp[0]).slider(
					{
						range : true,
						min : 0,
						step : 1000,
						max : 24600,
						values : [ 750, 24600 ],
						slide : function(event, ui) {
							$(amount_temp[0]).val(
									"$" + ui.values[0] + " - $" + ui.values[1]
											+ "/ Year");
						}
					});

			$(amount_temp[0])
					.val(
							"$" + $(temp[0]).slider("values", 0)
									+ " - $"
									+ $(temp[0]).slider("values", 1)
									+ "/ Year");
		});
		 */
		/* 	for (var i = 0; i < temp.length; i++) {

				eval('$(function(){$(temp['
						+ i
						+ ']).slider({range:true,min:0,step:1000,max:24600,values:[750,24600],slide:function(event,ui){$(amount_temp['
						+ i
						+ ']).val("$"+ui.values[0]+" - $"+ui.values[1]+"/ Year")}});$(amount_temp['
						+ i + ']).val("$"+$(temp[' + i
						+ ']).slider("values",0)+" - $"+$(temp[' + i
						+ ']).slider("values",1)+"/ Year")});')
			} */

		/* $(function() {
			$(temp[1]).slider(
					{
						range : true,
						min : 0,
						step : 1000,
						max : 24600,
						values : [ 750, 24600 ],
						slide : function(event, ui) {
							$(amount_temp[1]).val(
									"$" + ui.values[0] + " - $" + ui.values[1]
											+ "/ Year");
						}
					});

			$(amount_temp[1])
					.val(
							"$" + $(temp[1]).slider("values", 0)
									+ " - $"
									+ $(temp[1]).slider("values", 1)
									+ "/ Year");
		}); 
		 */
	</script>

	<script>
		/* 	let benefitList = [];

		 $("input[class=form-check-input]").each(function(idx) {

		 var value = $(this).val();
		 benefitList.push(value);

		 }) */

		/* let benefitList = [ "CAFE_BAKERY", "FINANCE" ];

		sliderVarList = []
		amountVarList = []

		for (var i = 0; i < benefitList.length; i++) {
			sliderVarList.push("#" + benefitList[i] + "_slider_range")
			amountVarList.push("#" + benefitList[i] + "_amount")
		}

		console.log(sliderVarList)
		console.log(amountVarList)

		for (var i = 0; i < sliderVarList.length; i++) {

			$(function() {
				$(sliderVarList[i]).slider(
						{
							range : true,
							min : 0,
							step : 1000,
							max : 24600,
							values : [ 750, 24600 ],
							slide : function(event, ui) {
								$(amountVarList[i]).val(
										"$" + ui.values[0] + " - $"
												+ ui.values[1] + "/ Year");
							}
						});

				$(amountVarList[i]).val(
						"$" + $(sliderVarList[i]).slider("values", 0) + " - $"
								+ $(sliderVarList[i]).slider("values", 1)
								+ "/ Year");
			});

		} */
	</script>


	<div class="index_modal">
		<div class="index_body">
			<h4 class="txt-center">혜택 리스트</h4>
			<h6 class="txt-center">원하는 혜택을 선택하세요</h6>
			<div class="content"></div>
			<hr>

			<div class="select single_field .align-center">

				<div class="single_field">
					<c:set var="i" value="0" />
					<c:set var="j" value="3" />
					<table class="align-center">
						<c:forEach items="${requestScope.benefitList }" var="benefitList">
							<c:if test="${i%j == 0 }">
								<tr>
							</c:if>
							<td class="td_input"><input class="form-check-input"
								name="form-check-input" type="checkbox"
								value="${ benefitList.category }" id="flexCheckDefault">
								<c:out value="${ benefitList.categoryKor }" /></td>
							<c:if test="${i%j == j-1 }">
								<tr>
							</c:if>
							<c:set var="i" value="${i+1 }" />
						</c:forEach>
					</table>

				</div>
				<div class="mt-30"></div>
				<button type="button" class="boxed-btn3 index_modal_cancel"
					onclick="getBenefitList()">확인</button>
			</div>
		</div>
	</div>
</body>
</html>