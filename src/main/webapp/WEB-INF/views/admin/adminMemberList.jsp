<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/header.jsp">
	<jsp:param name="stylesheet" value="static/stylesheet/admin.css" />
	<jsp:param name="script" value="static/script/admin.js" />
</jsp:include>
<%@ include file="/WEB-INF/views/admin/sub_menu.jsp"%>
<section class="admin-list">
	<form method="post" name="adminForm">
		<div class="admin-list-btn">
			<!-- 체크된 id들이 배열값으로 들어오고 String 변환되어 넘어감 -->
			<input type="hidden" name="memberIds">
			<input type="hidden" name="action">
			<input type="button" value="관리자 권한 부여" onclick="adminRightsAction('grant')">
			<input type="button" value="관리자 권한 해제" onclick="adminRightsAction('revoke')">
			<input type="button" value="회원 삭제" onclick="deletePost('adminDeleteMember', 'li:nth-child(2)>span:first-child')">
			<input type="text" placeholder="검색어를 입력하세요" name="searchWord" value="${searchWord}">
			<input type="button" value="검색" onclick="searchAdmin('adminMemberList')">
		</div>
		<ul class="admin-list-header admin-member-list">
			<li>
				<input type="checkbox" onclick="checkAll()" class="select-all-box">
			</li>
			<li>ID</li>
			<li>이름</li>
			<li>Email</li>
			<li>가입일</li>
			<li>전화번호</li>
		</ul>
		<c:forEach items="${memberList}" var="mvo">
			<ul class="admin-list-main admin-member-list" onclick="go_check(event)">
				<li>
					<input type="checkbox" class="check-box">
				</li>
				<li>
					<span>${mvo.id}</span>
					<c:if test="${mvo.isAdmin()}">
						<span style="color: red;">[admin]</span>
					</c:if>
				</li>
				<li>${mvo.name}</li>
				<li>${mvo.email}</li>
				<li>${mvo.indate}</li>
				<li>${mvo.phone}</li>
			</ul>
		</c:forEach>
	</form>
</section>
<%@ include file="/WEB-INF/views/util/pagination.jsp"%>
<jsp:include page="/WEB-INF/views/footer.jsp" />
