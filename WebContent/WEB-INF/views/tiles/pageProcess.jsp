<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!--<div>ST: ${paging.searchType} / SV : ${paging.searchValue}</div>  -->
<ul class="pagination">
	<!-- 이전페이지  <  -->
	<c:if test="${paging.startPage != 1 }">
		<a href="shop?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchValue=${paging.searchValue}" class="page-link">이전</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<b class="page-link">${p }</b>
				<%--현제 페이지 일경우 링크 해제  --%>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<%-- 다른페이지 링크  --%>
				<a href="shop?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchValue=${paging.searchValue}" class="page-link">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<!--  다음페이지 > -->
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="shop?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${paging.searchType}&searchValue=${paging.searchValue}" class="page-link">다음</a>
	</c:if>
</ul>