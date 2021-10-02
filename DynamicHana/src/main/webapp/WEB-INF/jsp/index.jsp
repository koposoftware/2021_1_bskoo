<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>하나카드 다이나믹하나</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" type="image/x-icon"
	href="${ pageContext.request.contextPath }/resources/img/favicon.png">

</head>

<body>

	<header>
		<jsp:include page="./include/topMenu.jsp" />
	</header>

	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider  d-flex align-items-center slider_bg_1">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-7 col-md-6">
						<div class="slider_text">
							<h5 class="wow fadeInLeft" data-wow-duration="1s"
								data-wow-delay=".2s">하나카드 다이나믹하나에서</h5>
							<h3 class="wow fadeInLeft" data-wow-duration="1s"
								data-wow-delay=".3s">
								당신의 소비생활을<br>알아보세요!
							</h3>
							<p class="wow fadeInLeft" data-wow-duration="1s"
								data-wow-delay=".4s">하나카드 다이나믹하나는 한 눈에 알기 쉽게 카드내역을 알려드립니다.</p>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div
			class="ilstration_img wow fadeInRight d-none d-lg-block text-right"
			data-wow-duration="1s" data-wow-delay=".2s">
			<img
				src="${ pageContext.request.contextPath }/resources/img/banner/illustration.png"
				alt="">
		</div>
	</div>
	<!-- slider_area_end -->
	<div class="mg-top-30"></div>
	<div class="mg-top-30"></div>
	<div class="mg-top-30"></div>
	<div class="mg-top-30"></div>

	<footer>
		<jsp:include page="./include/bottom.jsp" />
	</footer>
</html>