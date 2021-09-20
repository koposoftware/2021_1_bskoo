<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav
	class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white"
	id="sidenav-main">
	<div class="container-fluid">
		<!-- Brand -->
		<a class="navbar-brand pt-0" href=""> <img
			src="${ pageContext.request.contextPath }/resources/assets/img/brand/blue.png"
			class="navbar-brand-img" alt="...">
		</a>

		<!-- Collapse -->
		<div class="collapse navbar-collapse" id="sidenav-collapse-main">
			<!-- Collapse header -->
			<div class="navbar-collapse-header d-md-none">
				<div class="row">
					<div class="col-6 collapse-brand">
						<a href="${ pageContext.request.contextPath }/"> <img
							src="${ pageContext.request.contextPath }/resources/assets/img/brand/blue.png">
						</a>
					</div>
					<div class="col-6 collapse-close">
						<button type="button" class="navbar-toggler"
							data-toggle="collapse" data-target="#sidenav-collapse-main"
							aria-controls="sidenav-main" aria-expanded="false"
							aria-label="Toggle sidenav">
							<span></span> <span></span>
						</button>
					</div>
				</div>
			</div>

			<!-- Navigation -->
			<ul class="navbar-nav">
				<li class="nav-item active "><a class="nav-link  active "
					href="${ pageContext.request.contextPath }/"> <i class="ni ni-tv-2 text-primary"></i> 대시보드
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="${ pageContext.request.contextPath }/cluster">
						<i class="ni ni-planet text-blue"></i> 회원분석
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="${ pageContext.request.contextPath }/mail">
						<i class="ni ni-pin-3 text-orange"></i> 안내 메일 발신
				</a></li>
				<li class="nav-item"><a class="nav-link "
					href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html">
						<i class="ni ni-single-02 text-yellow"></i> 카드 추가
				</a></li>

			</ul>
			<!-- Divider -->
			<hr class="my-3">
			<!-- Heading -->
			<h6 class="navbar-heading text-muted">하나금융그룹</h6>
			<!-- Navigation -->
			<ul class="navbar-nav mb-md-3">
				<li class="nav-item"><a class="nav-link"
					href="http://localhost:8080/DynamicHana/"> <i
						class="ni ni-spaceship"></i> 다이나믹하나
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://www.hanacard.co.kr/"> <i class="ni ni-palette"></i>
						하나카드
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="https://www.hanafn.com/main.do"> <i class="ni ni-ui-04"></i>
						하나금융그룹
				</a></li>
			</ul>
			<ul class="navbar-nav">

			</ul>
		</div>
	</div>
</nav>