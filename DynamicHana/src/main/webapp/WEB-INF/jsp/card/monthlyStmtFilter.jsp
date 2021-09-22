<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table table-data2" style="font-size: 18px">
	<thead>
		<tr>

			<th style="font-size: 20px">거래순번</th>
			<th style="font-size: 20px">일자</th>
			<th style="font-size: 20px">가맹점</th>
			<th style="font-size: 20px">금액</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.monthlyConsumption}"
			var="monthlyConsumption" varStatus="status">
			<tr class="tr-shadow">

				<td style="font-size: 20px"><c:out
						value="${ monthlyConsumption.no }" /></td>
				<td style="font-size: 20px"><c:out
						value="${ monthlyConsumption.historyDate }" /></td>
				<td style="font-size: 20px"><c:out
						value="${ monthlyConsumption.store }" /></td>
				<td style="font-size: 20px"><fmt:formatNumber
						value="${monthlyConsumption.amount }" pattern="#,###" /> 원</td>


			</tr>
			<tr class="spacer"></tr>
		</c:forEach>

	</tbody>
</table>
<div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
		<a
			href="${pageContext.request.contextPath}/monthlyStmt?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
		var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b>${p }</b>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a class="pagingGroup cursor_pointer" id="page_${p}"
					onclick="selChange(${p})"<%-- href="${pageContext.request.contextPath}/cardstmt?nowPage=${p }&cntPerPage=${paging.cntPerPage}" --%>>${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a
			href="${pageContext.request.contextPath}/monthlyStmt?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
</div>