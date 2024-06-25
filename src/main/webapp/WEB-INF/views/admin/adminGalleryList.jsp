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
			<input type="hidden" name="memberIds">
			<input type="button" value="삭제" onclick="deletePost('adminDeleteGallery', 'li:nth-child(2)')">
			<input type="text" placeholder="ID 또는 이름으로 검색하세요" name="searchWord" value="${searchWord}">
			<input type="button" value="검색" onclick="searchAdmin('adminGalleryList')">
		</div>
		<ul class="admin-list-header admin-artwork-list">
			<li>
				<input type="checkbox" onclick="checkAll()" class="select-all-box">
			</li>
			<li>번호</li>
			<li>ID</li>
			<li>이름</li>
			<li>제목</li>
			<li>내용</li>
			<li>등록일</li>
			<li>조회수</li>
			<li>미리보기</li>
		</ul>
		<c:forEach items="${galleryList}" var="mgvo" varStatus="index">
			<ul class="admin-list-main admin-artwork-list" onclick="go_check(event)">
				<li>
					<input type="checkbox" class="check-box">
				</li>
				<li>${mgvo.mseq}</li>
				<li>${mgvo.authorId}</li>
				<li>${mgvo.authorName}</li>
				<li class="view-link" onclick="location.href='museum.do?command=galleryView&mseq=${mgvo.mseq}'">${mgvo.title}</li>
				<li>${mgvo.content}</li>
				<li>${mgvo.writedate}</li>
				<li>${mgvo.readcount}</li>
				<li>
					<img alt="artwork-img" src="static/image/gallery/${mgvo.savefilename}"
						onmouseover="previewImg('artwork-${mgvo.mseq}-${index}')"
						onmouseleave="previewImg('artwork-${mgvo.mseq}-${index}')">
				</li>
			</ul>
			<div id="artwork-${mgvo.mseq}-${index}" class="preview hidden">
				<img alt="artwork-img" src="static/image/gallery/${mgvo.savefilename}">
			</div>
		</c:forEach>
	</form>
</section>
<%@ include file="/WEB-INF/views/util/pagination.jsp"%>
<jsp:include page="/WEB-INF/views/footer.jsp" />