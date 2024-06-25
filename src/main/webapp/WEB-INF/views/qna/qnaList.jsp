<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="stylesheet" value="static/stylesheet/qna/qna_icon.css" />
	<jsp:param name="stylesheet" value="static/stylesheet/qna/qna_list.css" />
	<jsp:param name="script" value="static/script/qna.js" />
</jsp:include>
<main class="qna-list">
	<div class="qna-list_header">
		<div class="qna-list_header_title">
			<h1>고객센터</h1>
			<p>
				총
				<span>${pagination.itemCount}</span>
				건이 검색되었습니다
			</p>
		</div>
		<a href="museum.do?command=qnaWriteForm">
			<button class="qna-list_write-button">문의하기</button>
		</a>
	</div>
	<div class="qna-list_body">
		<table class="qna-list_table">
			<thead>
				<tr>
					<th data-title="번호">번호</th>
					<th data-title="제목">제목</th>
					<th data-title="날짜">날짜</th>
					<th data-title="상태">상태</th>
			</thead>
			<tbody>
				<c:forEach items="${qnaList}" var="qnaVO">
					<c:set var="qnaPassKey" value="qnaPass${qnaVO.qseq}" />
					<tr onclick="qnaPwdCheck(${qnaVO.qseq}, 'view')">
						<td data-title="번호">${qnaVO.qseq}</td>
						<td data-title="제목"><div>
								<c:choose>
									<c:when test="${sessionScope[qnaPassKey]}">
										<i class="qna-icon owner"></i>
									</c:when>
									<c:when test="${qnaVO.isPublic()}">
										<i class="qna-icon public"></i>
									</c:when>
									<c:when test="${isAdmin}">
										<i class="qna-icon admin"></i>
									</c:when>
									<c:otherwise>
										<i class="qna-icon private"></i>
									</c:otherwise>
								</c:choose>
								<span> ${qnaVO.title}</span>
							</div></td>
						<td data-title="날짜"><fmt:formatDate value="${qnaVO.writedate}" pattern="yyyy-MM-dd" /></td>
						<td data-title="상태"><c:choose>
								<c:when test="${empty qnaVO.reply}">대기중</c:when>
								<c:otherwise>완료</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/util/pagination.jsp"%>
	</div>
</main>
<jsp:include page="/WEB-INF/views/footer.jsp" />