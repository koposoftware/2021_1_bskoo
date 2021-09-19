<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-top navbar-expand-md navbar-dark"
	id="navbar-main">
	<div class="container-fluid vertical_center">
		<!-- Brand -->
		<h3 class="display-3 color_white vertical_center pd-top-25">다이나믹하나
			관리자</h3>

		<!-- User -->
		<ul class="navbar-nav align-items-center d-none d-md-flex">
			<li class="nav-item dropdown"><a class="nav-link pr-0" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">
					<div class="media align-items-center">

						<div class="media-body ml-2 d-none d-lg-block">
							<span class="mb-0 text-sm  font-weight-bold color_white">관리자님
								환영합니다.</span>
						</div>
					</div>

			</a>


				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">Welcome!</h6>
					</div>
					<a
						href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
						class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My
							profile</span>
					</a> <a
						href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
						class="dropdown-item"> <i class="ni ni-settings-gear-65"></i>
						<span>Settings</span>
					</a> <a
						href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
						class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i>
						<span>Activity</span>
					</a> <a
						href="${ pageContext.request.contextPath }/resources/assets/examples/profile.html"
						class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#!" class="dropdown-item"> <i class="ni ni-user-run"></i>
						<span>Logout</span>
					</a>
				</div></li>
		</ul>
	</div>
</nav>