<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<table border="1" class="table table-bordered paginated">
	<tr>
		<th width="30%" class="txt-center">일시</th>
		<th width="15%" class="txt-center">카테고리</th>
		<th width="40%" class="txt-center">항목</th>
		<th width="15%" class="txt-center">금액</th>

	</tr>
	<c:forEach items="${requestScope.history }" var="history"
		varStatus="loop">
		<tr>
			<td class="txt-center"><c:out value="${ history.historyDate }" /></td>
			<td class="txt-center"><c:out value="${ history.category }" /></td>
			<td class="txt-center"><c:out value="${ history.store }" /></td>
			<td class="txt-center"><c:out value="${ history.amount }" /></td>
		</tr>
	</c:forEach>
</table>



<div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
		<a
			href="${pageContext.request.contextPath}/cardstmt?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
		var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b>${p }</b>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a class="pagingGroup cursor_pointer" id="page_${p}" onclick="selChange(${p})"<%-- href="${pageContext.request.contextPath}/cardstmt?nowPage=${p }&cntPerPage=${paging.cntPerPage}" --%>>${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a
			href="${pageContext.request.contextPath}/cardstmt?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
</div>