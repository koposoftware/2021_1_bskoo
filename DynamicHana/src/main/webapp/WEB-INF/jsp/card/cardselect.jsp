<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	$(document).ready(function() {

		$('#btn-commit').click(function() {
			checkPw();
		})

		function checkPw() {
			$.ajax({
				'type' : 'post',
				'url' : '${pageContext.request.contextPath}/cardSelect',
				'data' : {

					cardNo : $("#cardNo").val(),
					cardPassword : $("#cardPassword").val()

				},
				'error' : function() {
					console.log('에러')
				},
				'success' : function(data) {

					if (data == 1) {
						console.log('로그인성공')
						location.href="${pageContext.request.contextPath}/cardstmt"
					}else{
						alert('비밀번호가 일치하지 않습니다.')
						location.href="${pageContext.request.contextPath}/cardSelect"
					}

				}
			})
		}

	})
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


	<div class="container box_1170">
		<div class="" id="loginBox">
			<div class="col-lg-8 col-md-8 align-center">
				<br>
				<h3 class="mb-30 txt-center">원하는 카드와 비밀번호를 입력해주세요</h3>
				<form method="post">

					<div class="mt-10">
						<div class="form-select">
							<p class="txt-left">카드</p>
							<select id="cardNo" name="cardNo">
								<c:forEach items="${ requestScope.usercard }" var="usercard"
									varStatus="loop">
									<option value="${ usercard.cardNo }">
										<c:out value="${ usercard.cardName } ${ usercard.cardNo }" />
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="mt-30"></div>
					<div class="mt-10">
						<p class="txt-left">카드 비밀번호</p>
						<input type="password" id="cardPassword" name="cardPassword"
							placeholder="cardPassword" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'cardPassword'" class="single-input"
							value="1234">
					</div>

					<div class="mt-30">
						<div class="col-md-offset-3 col-md-9 align-center" align="center">
							<button id="btn-commit"
								class="genric-btn info circle align-center txt-center">확인</button>
							<a href="${ pageContext.request.contextPath }/"><button
									type="button"
									class="genric-btn info circle align-center txt-center">이전화면</button>
							</a>

						</div>
					</div>
					<div class="mt-30"></div>
				</form>
			</div>
		</div>
	</div>



	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="../include/bottom.jsp" />
	</footer>
	<!--/ footer end  -->

</body>
</html>