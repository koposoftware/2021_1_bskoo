<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
						<h3>로그인</h3>
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
				<h3 class="mb-30 txt-center">로그인</h3>
				<form:form name="registerForm" method="post"
					modelAttrubute="memberVO">

					<div class="mt-10">
						<p class="txt-left">아이디</p>
						<input type="text" id="id" name="id" placeholder="ID"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'"
							class="single-input" value="test">
					</div>
					
					<div class="mt-10">
						<p class="txt-left">비밀번호</p>
						<input type="password" id="pw" name="pw" placeholder="PASSWORD"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Pw'" class="single-input"
							value="test">
					</div>

					<div class="mt-30">
						<div class="col-md-offset-3 col-md-9 align-center" align="center">
							<button id="btn-signup" type="submit"
								class="genric-btn info circle align-center txt-center">로그인</button>

						</div>
					</div>
					<div class="mt-30"></div>


				</form:form>
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