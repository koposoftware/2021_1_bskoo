<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav
	class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
	id="sidenav-main">
	<div class="container-fluid">
		<!-- Brand -->
		<a href="${ pageContext.request.contextPath }/"> <img
			src="${ pageContext.request.contextPath }/resources/assets/img/brand/logo.png"
			alt="...">
		</a>

		<!-- Collapse -->
		<div class="collapse navbar-collapse" id="sidenav-collapse-main">


			<!-- Navigation -->
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link  active "
					href="${ pageContext.request.contextPath }/"> <i
						class="fa fa-chevron-right"></i> 대시보드
				</a></li>
				<li class="nav-item active"><a class="nav-link "
					href="${ pageContext.request.contextPath }/cluster"> <i
						class="fa fa-chevron-right"></i> 회원분석
				</a></li>
				<li class="nav-item active"><a class="nav-link "
					href="${ pageContext.request.contextPath }/mail"> <i
						class="fa fa-chevron-right"></i> 안내 메일 발신
				</a></li>
				<li class="nav-item active"><a class="nav-link "
					href="${ pageContext.request.contextPath }/mail/maillog"> <i
						class="fa fa-chevron-right"></i> 메일 발신 로그
				</a></li>

			</ul>
			<!-- Divider -->
			<hr class="my-3">
			<!-- Heading -->
			<h6 class="navbar-heading text-muted">하나금융그룹</h6>
			<!-- Navigation -->
			<ul class="navbar-nav mb-md-3">
				<li class="nav-item active"><a class="nav-link"
					href="http://localhost:8080/DynamicHana/"> <i
						class="fa fa-chevron-right"></i> 다이나믹하나
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="https://www.hanacard.co.kr/"> <i class="fa fa-chevron-right"></i>
						하나카드
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="https://www.hanafn.com/main.do"> <i class="fa fa-chevron-right"></i>
						하나금융그룹
				</a></li>
			</ul>
			<ul class="navbar-nav">

			</ul>
		</div>
	</div>
</nav>