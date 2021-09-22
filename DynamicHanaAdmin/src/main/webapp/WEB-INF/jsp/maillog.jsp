<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>하나카드 다이나믹하나 관리자페이지</title>
<jsp:include page="./include/assets.jsp" />
</head>
<body class="">
	<jsp:include page="./include/sidebar.jsp" />
	<div class="main-content">
		<!-- Navbar -->
		<jsp:include page="./include/header.jsp" />
		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header border-0">
							<h3 class="mb-0">메일 발송 로그</h3>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
									
										<th scope="col" class="text-center">순번</th>
										<th scope="col" class="text-center">발송날짜</th>
										<th scope="col" class="text-center">군집번호</th>
										<th scope="col" class="text-center">추천카드</th>
										<th scope="col" class="text-center">발송 인원</th>
										<th scope="col" class="text-center">발송 성공</th>
										<th scope="col" class="text-center">발송 실패</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.mailLog }" var="mailLog"
										varStatus="loop">
										<tr>
											<th scope="row" class="text-center">

												<div class="media-body">
													<span class="mb-0 text-sm"><c:out
															value="${ mailLog.mailNo }" /></span>
												</div>
											</th>
											<td class="text-center"><c:out value="${ mailLog.sendingDate }" /></td>
											<td class="text-center"><c:out value="${ mailLog.clusterNo }" /></td>
											<td><c:out value="${ mailLog.cardName }" /></td>
											<td class="text-center"><c:out value="${ mailLog.total }" /></td>
											<td class="text-center"><c:out value="${ mailLog.sendingSuccess }" /></td>
											<td class="text-center"><c:out value="${ mailLog.sendingFail }" /></td>
											
											

										</tr>
									</c:forEach>
								</tbody>
							</table>
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