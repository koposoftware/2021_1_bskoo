<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
	$(document).ready(
			function() {
				fruit_val = $('select.fruit').attr('data-type');
				$('select.fruit option[value=' + fruit_val + ']').attr(
						'selected', 'selected');
			});

	var clusterNo = [ "전 회원" ]
	var clusterName = [ "전 회원" ]
	var clusterCnt = [ "전 회원" ]
	var clusterCategory = [ "전 회원" ]
	var clusterRatio = [ "전 회원" ]

	var category = ''
	var code = ''

	<c:forEach items="${requestScope.memberCluster }" var="memberCluster"
	varStatus="loop">
	clusterNo.push(parseFloat("${ memberCluster.clusterNo }"))
	clusterName.push("${ memberCluster.clusterName }")
	clusterCnt.push("${ memberCluster.cnt }")
	clusterCategory.push("${ memberCluster.category }")
	clusterRatio.push("${ memberCluster.ratio }" + "%")
	</c:forEach>

	function changeClusterInfo() {
		var selectedCluster = document.getElementById("clusterSelect").value

		document.getElementById("clusterName").innerHTML = clusterName[selectedCluster]
		document.getElementById("clusterNo").innerHTML = clusterNo[selectedCluster]
		document.getElementById("clusterCnt").innerHTML = clusterCnt[selectedCluster]
		document.getElementById("clusterRatio").innerHTML = clusterRatio[selectedCluster]
		document.getElementById("clusterCategory").innerHTML = clusterCategory[selectedCluster]

		category = clusterCategory[selectedCluster]
		code = clusterNo[selectedCluster]

		if (selectedCluster == 0) {
			$("#recoCardDiv").empty()
			$("#recoCardDiv").css('text-align', 'center');
			$("#recoCardDiv")
					.html(
							'<i class="ni education_hat mr-2"></i>전 회원이 선택되어있습니다.<br>군집을 선택하세요')
		} else {
			$.ajax({
				'type' : 'get',
				'url' : '${pageContext.request.contextPath}/mail/recoCard/'
						+ selectedCluster,

				'success' : output,
				'error' : function() {
					console.log("실패")
				}
			})

			function output(resp) {
				console.log(resp)
				var card_name = []
				var card_code = []

				$("#recoCardDiv").empty()
				$("#recoCardDiv").append('<div style="text-align : left"><ul>')
				$.each(resp, function(index, item) {
					$("#recoCardDiv").append(
							'<li>' + item['cardName'] + '</li>')

				})
				$("#recoCardDiv").append('</div>')
				$("#recoCardDiv").css('text-align', 'left');

			}

		}
		memberCount();

	}

	var cardName = ''
	var cardCode = ''
	var benefit = []
	
	function changeCardInfo() {

		var no = document.getElementById("cardCode").value

		$.ajax({
			'type' : 'get',
			'url' : '${pageContext.request.contextPath}/mail/cardInfo/' + no,
			'success' : output2,
			'error' : function() {
				console.log("실패")
			}
		})

		function output2(resp) {
			cardName = ''
			cardCode = ''

			benefit = []

			$("#benefitDiv").empty()
			$("#benefitDiv").append('<div style="text-align : left"><ul>')
			$.each(resp, function(index, item) {
				$("#benefitDiv").append('<li>' + item['notice'] + '</li>')
				cardName = item['cardName']
				cardCode = item['cardCode']

				benefit.push(item['notice'])

			})
			$("#benefitDiv").append('</div>')
			$("#benefitDiv").css('text-align', 'left')

			$("#cardImg")
					.attr(
							"src",
							src = "${ pageContext.request.contextPath }/resources/img/card/"
									+ cardCode + ".png")
			document.getElementById("cardName").innerHTML = cardName

		}

	}

	function contentReset() {
		document.getElementById("mailContent").value = ''
	}

	function contentAuto() {
		var content = '고객님 안녕하세요. 항상 하나카드를 이용해주셔서 감사합니다.\n\n'
		if (code > 0) {
			content += '고객님은 지난달에 ' + category + '에 소비를 많이 하셨습니다. \n'
		}

		content += '고객님의 소비 생활에 더 큰 혜택을 드리기 위해 [' + cardName + ']을 추천드립니다.\n\n'
		content += cardName
		content += '은 다음과 같은 혜택을 제공합니다.\n\n'

		for (var i = 0; i < benefit.length; i++) {
			content += '• '
			content += benefit[i]
			content += '\n'
		}

		content += '\n'
		content += cardName + '의 자세한 정보는 다이나믹하나를 참조해주세요!\n'
		content += 'http://localhost:8080/DynamicHana/detail/' + cardCode
		document.getElementById("mailContent").value = content

	}

	var mailTarget = 0
	
	function memberCount() {
		

		if (code > 0) {
			var age = document.getElementById("age").value
			var gender = document.getElementById("gender").value
			var region = document.getElementById("region").value
			
			console.log("age : " + age)
			console.log("gender : " + gender)
			console.log("region : " + region)
			
			
			var param ={}
			param["age"]=age
			param["gender"]=gender
			param["region"]=region
			param["clusterNo"]=code
			
			
			$.ajax({
				contentType: "application/json; charset=UTF-8",
				dataType:'json',
				type : 'post',
				data : JSON.stringify(param),
				url : '${pageContext.request.contextPath}/mail/memberCount',
				success : function(result) {
					$('#memberCountSpan').text("발송 예정 인원 : " + result + "6 명")
					mailTarget = result
					console.log("석세스")
				},
				error : function() {
					console.log("실패")
				}
			})
		}else{
			$('#memberCountSpan').text("발송 예정 인원 : 전 회원")
		}

	}
	
	function sendingChk(){
		alert("안내 메일을 발송했습니다.")
		return true
	}
	
	
	
</script>


<body>
	<jsp:include page="./include/sidebar.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<jsp:include page="./include/header.jsp" />
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
		<div class="container-fluid mt--7">
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<div class="row">
					<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
						<div class="card card-profile shadow">


							<div class="card-body pt-0 pt-md-4">

								<div class="text-center">
									<h2>선택한 군집정보</h2>

								</div>
								<div class="text-center">
									<h3 id="clusterName">전 회원</h3>
								</div>
								<div class="row">

									<div class="col">

										<div class="card-profile-stats d-flex justify-content-center">

											<div>
												<span class="description">군집 번호</span> <span class="heading"
													id="clusterNo">전 회원</span>
											</div>
											<div>
												<span class="description">회원 수</span> <span class="heading"
													id="clusterCnt">전 회원</span>
											</div>
											<div>
												<span class="description">회원 비율</span> <span class="heading"
													id="clusterRatio">전 회원</span>
											</div>
										</div>
									</div>
								</div>
								<div class="text-center">
									<div class="h5 font-weight-300">
										<i class="ni location_pin mr-2"></i>군집 주요 소비처
									</div>
									<h3 id="clusterCategory">전 회원</h3>
									<hr class="my-4" />

									<div class="h5 mt-4">
										<i class="ni business_
										briefcase-24 mr-2"></i>추천 카드
									</div>
									<div id="recoCardDiv">

										<i class="ni education_hat mr-2"></i>전 회원이 선택되어있습니다.<br>
										군집을 선택하세요
									</div>
									<hr class="my-4" />
									<div class="h5 mt-4">
										<i class="ni business_briefcase-24 mr-2"></i>선택된 카드
									</div>
									<h3 id="cardName">모두의 신세계 하나카드</h3>
									<div class="row justify-content-center">
										<img id="cardImg"
											src="${ pageContext.request.contextPath }/resources/img/card/1001.png">

									</div>
									<hr class="my-4" />
									<div class="h5 mt-4">
										<i class="ni business_briefcase-24 mr-2"></i>선택된 카드의 주요 혜택
									</div>
									<div id="benefitDiv" style="text-align: left">
										<ul>
											<li>페이결제 5% 청구할인 제공</li>
											<li>백화점, 아카데미 5% 청구 할인</li>
											<li>시코르닷컴 5% 청구 할인</li>
											<li>놀이공원, 워터파크 30% 청구 할인</li>
											<li>프로야구, 프로축구 30% 청구 할인</li>
											<li>카페 20% 청구 할인</li>
											<li>베이커리 20% 청구 할인</li>
											<li>택시 20% 청구 할인</li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 order-xl-1">
						<div class="card bg-secondary shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">안내 메일 발신</h3>
									</div>

								</div>
							</div>
							<div class="card-body">
								<form:form modelAttribute="admincardVO" method="post" onsubmit="return sendingChk()">
									<h6 class="heading-small text-muted mb-4">고객 군집 및 카드 정보</h6>
									<div class="pl-lg-4">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group">
													<label class="form-control-label" for="input-username">사용자
														군집</label> <form:select class="form-control" data-toggle="select"
														title="Simple select" data-placeholder="Select a state" path="clusterNo"
														id="clusterSelect" onchange="changeClusterInfo()">
														<option value="0">전 회원</option>
														<c:forEach items="${ requestScope.memberCluster }"
															var="memberCluster" varStatus="loop">


															<option value="${ memberCluster.clusterNo }"><c:out
																	value="${ memberCluster.clusterName }" /></option>

														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group">
													<label class="form-control-label" for="input-email">카드
														선택</label> <form:select class="form-control" data-toggle="select"
														title="Simple select" data-placeholder="Select a state" path="cardCode"
														id="cardCode" onchange="changeCardInfo()">
														<c:forEach items="${ requestScope.cardList }"
															var="cardList" varStatus="loop">
															<option value="${ cardList.cardCode }"><c:out
																	value="${ cardList.cardName }" /></option>

														</c:forEach>
													</form:select>
												</div>
											</div>
										</div>

									</div>
									<hr class="my-4" />
									<!-- Address -->
									<h6 class="heading-small text-muted mb-4">기타 고객 정보</h6>
									<div class="pl-lg-4">

										<div class="row">
											<div class="col-lg-4">
												<div class="form-group">
													<label class="form-control-label" for="input-city">연령대</label>
													<form:select class="form-control" data-toggle="select"
														title="Simple select" id="age" path="age"
														onchange="memberCount()">

														<option value="">전체</option>
														<option value="20">20대</option>
														<option value="30">30대</option>
														<option value="40">40대</option>
														<option value="50">50대</option>
														<option value="60">60대</option>
														<option value="70">70대 이상</option>


													</form:select>
												</div>
											</div>
											<div class="col-lg-4">
												<div class="form-group">
													<label class="form-control-label" for="input-country">성별</label>
													<form:select class="form-control" data-toggle="select"
														title="Simple select" id="gender" path="gender"
														onchange="memberCount()">

														<option value="">전체</option>
														<option value="M">남성</option>
														<option value="F">여성</option>



													</form:select>
												</div>
											</div>
											<div class="col-lg-4">
												<div class="form-group">
													<label class="form-control-label" for="input-country">지역</label>
													<form:select class="form-control" data-toggle="select"
														title="Simple select" id="region" path="region"
														onchange="memberCount()">
														<option value="">전체</option>
														<option value="서울특별시">서울특별시</option>
														<option value="부산광역시">부산광역시</option>
														<option value="대구광역시">대구광역시</option>
														<option value="인천광역시">인천광역시</option>
														<option value="광주광역시">광주광역시</option>
														<option value="대전광역시">대전광역시</option>
														<option value="울산광역시">울산광역시</option>
														<option value="세종특별자치시">세종특별자치시</option>
														<option value="경기도">경기도</option>
														<option value="강원도">강원도</option>
														<option value="충청남도">충청남도</option>
														<option value="충청북도">충청북도</option>
														<option value="전라남도">서울특별시</option>
														<option value="전라북도">전라북도</option>
														<option value="경상남도">경상남도</option>
														<option value="경상북도">경상북도</option>
														<option value="제주특별자치도">제주특별자치도</option>
													</form:select>
												</div>
											</div>
										</div>
									</div>
									<hr class="my-4" />
									<!-- Description -->
									<h6 class="heading-small text-muted mb-4">내용</h6>
									<div class="pl-lg-4">
										<div class="form-group">
											<span><label>내용 작성</label></span> <span style="float: right">

												<button type="button" class="btn btn-sm btn-primary"
													onclick="helloAuto()">인사말 작성</button>
												<button type="button" class="btn btn-sm btn-primary"
													onclick="contentAuto()">내용 자동 작성</button>
												<button type="button" class="btn btn-sm btn-primary"
													onclick="contentReset()">초기화</button>
											</span>
											<form:textarea rows="8"
												class="form-control form-control-alternative" path="mailContent"
												id="mailContent"></form:textarea>
											<div style="float: right" id ="memberCountSpan">발송 예정 인원 : 전 회원</div><br>
											<div><button style="float: right"  class="btn btn-info" >발송하기</button></div>
										</div>
									</div>
								</form:form>
							</div>
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