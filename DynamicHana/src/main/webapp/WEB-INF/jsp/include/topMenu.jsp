<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>



<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/themify-icons.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/nice-select.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/gijgo.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/animate.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/slicknav.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.css">
<%-- <link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/responsive.css"> --%>
<!-- JS here -->
<script
	src="${ pageContext.request.contextPath }/resources/js/vendor/modernizr-3.5.0.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/vendor/jquery-1.12.4.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/ajax-form.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/waypoints.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.counterup.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/scrollIt.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.scrollUp.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/wow.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/nice-select.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.slicknav.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/plugins.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/gijgo.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/range.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/contact.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.ajaxchimp.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
<script
	src="${ pageContext.request.contextPath }/resources/js/mail-script.js"></script>

<script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

</head>




<div class="header-area ">
	<div id="sticky-header" class="main-header-area">
		<div class="container-fluid ">
			<div class="header_bottom_border">
				<div class="row align-items-center">
					<div class="col-xl-3 col-lg-2">
						<div class="logo">
							<a href="${ pageContext.request.contextPath }/"> <img
								src="${ pageContext.request.contextPath }/resources/img/logo.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-xl-6 col-lg-7">
						<div class="main-menu  d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a
										href="${ pageContext.request.contextPath }/cardlist">나만의
											카드</a></li>
									<li><a href="${ pageContext.request.contextPath }/cardSelect">실시간
											카드 내역서</a></li>
									<li><a href="${ pageContext.request.contextPath }/">월간
											거래 리포트</a></li>
									<li><a href="${ pageContext.request.contextPath }/">총
											거래 분석</a></li>
									<!-- <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                    <li><a href="candidate.html">Candidates </a></li>
                                                    <li><a href="job_details.html">job details </a></li>
                                                    <li><a href="elements.html">elements</a></li>
                                                </ul>
                                            </li> -->


								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 d-none d-lg-block">
						<div class="Appointment">
							<!-- <div class="phone_num d-none d-xl-block">
									<a href="#">Log in</a>
								</div> -->


							<div>

								<div class="d-none d-lg-block topmenu-button">
									<c:if test="${ empty userVO }">
										<a class="boxed-btn3"
											href="${ pageContext.request.contextPath }/login">로그인</a>
										<a class="boxed-btn3"
											href="${ pageContext.request.contextPath }/register">회원가입</a>

									</c:if>
									<c:if test="${ not empty userVO }">
										<span class="topmenu-user"><strong>${ userVO.name }</strong>님
											환영합니다.</span>
										<span><a class="boxed-btn3"
											href="${ pageContext.request.contextPath }/logout">로그아웃</a></span>

									</c:if>


								</div>
								<div class="button-group-area mt-40"></div>


							</div>
						</div>
					</div>







					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>