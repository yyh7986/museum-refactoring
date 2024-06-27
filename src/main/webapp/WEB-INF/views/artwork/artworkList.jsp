<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.team4.artgallery.util.ArtworkCategory" %>
<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="stylesheet" value="/static/stylesheet/artwork.css"/>
    <jsp:param name="script" value="/static/script/artwork.js"/>
</jsp:include>
<section class="artwork-list-header">
    <form action="artwork" name="searchForm" class="artwork-search-form">
        <h1>예술품 검색</h1>
        <div>
            <input type="hidden" name="category" value="${category}">
            <input type="text" placeholder="작품명 또는 작가명을 검색하세요" name="searchWord" class="artwork-search-form_input"
                   value="${searchWord}">
            <input type="submit" value="검색" class="artwork-search-form_btn">
        </div>
    </form>
    <div class="category-btn-container">
        <c:forEach items="${ArtworkCategory.values()}" var="c">
            <c:choose>
                <c:when test="${category == c.name() or (empty category and c.name() == '전체')}">
                    <%--					<a href="/artwork?category=${c.name()}&searchWord=${searchWord}" class="artwork-list_btn artwork-list_selected-btn">${c.name()}</a>--%>
                    <a href="/artwork?category=${c.name()}"
                       class="artwork-list_btn artwork-list_selected-btn">${c.name()}</a>
                    <%--                    <input type="button" class="artwork-list_btn artwork-list_selected-btn" value="${c.name()}"--%>
                    <%--                           onclick="changeCategory('${c.name()}')">--%>
                </c:when>
                <c:otherwise>
                    <a href="/artwork?category=${c.name()}" class="artwork-list_btn">${c.name()}</a>
                    <%--                    <input type="button" class="artwork-list_btn" value="${c.name()}"--%>
                    <%--                           onclick="changeCategory('${c.name()}')">--%>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <div class="artwork-list_btn" onclick="changeCategory('디자인')">TEST</div>
    </div>
</section>
<main class="artwork-list-main">
    <div class="artwork-list-head">
        <h4>검색결과가 총 ${artworkList.size()}건 입니다</h4>
        <c:if test="${loginUser.isAdmin()}">
            <a href="artwork/write" class="artwork-list_btn">예술품 등록</a>
        </c:if>
    </div>
    <div class="artwork-list" id="test1">
        <c:forEach items="${artworkList}" var="artwork">
            <div onclick="location.href='artwork/view?aseq=${artwork.aseq}'">
                <img src="${artwork.fullSavefilename}" alt="artwork_image" class="artwork-list_img"/>
                <div class="artwork-list_info">
                    <span>${artwork.artist}</span>
                    <p>${artwork.name}</p>
                    <span>${artwork.year}</span>
                </div>
            </div>
        </c:forEach>
    </div>
    <div>
</div>
    <%@ include file="/WEB-INF/views/util/pagination.jsp" %>
</main>
<jsp:include page="/WEB-INF/views/footer.jsp"/>