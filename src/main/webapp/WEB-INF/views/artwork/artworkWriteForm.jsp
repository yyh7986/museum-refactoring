<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.team4.artgallery.util.ArtworkCategory" %>
<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="stylesheet" value="static/stylesheet/artwork.css"/>
    <jsp:param name="script" value="static/script/artwork.js"/>
</jsp:include>
<h2 class="artwork-write-form-header">예술품 등록</h2>
<section class="artwork-write-form-main">
    <form method="post" name="artworkWriteForm" action="museum.do?command=artworkWriteForm" class="artwork-write-form"
          enctype="multipart/form-data">
        <div class="artwork-write-form_info">
            <ul>
                <li>
                    <div>작가명</div>
                    <input type="text" name="artist" onchange="changeValue('unknownArtist')">
                    <input type="checkbox" name="unknownArtist" onclick="artistUnknown()" id="unknownArtist">
                    <label for="unknownArtist" class="unknown-label">작자미상</label>
                </li>
                <li>
                    <div>작품명</div>
                    <input type="text" name="artname">
                </li>
                <li>
                    <div>제작연도</div>
                    <input type="text" name="year" onchange="changeValue('unknownYear')">
                    <input type="checkbox" name="unknownYear" onclick="yearUnknown()" id="unknownYear">
                    <label for="unknownYear" class="unknown-label">연도미상</label>
                </li>
                <li>
                    <div>재료</div>
                    <input type="text" name="material">
                </li>
                <li>
                    <div>규격</div>
                    <input type="text" name="size">
                </li>
                <li>
                    <div>부문</div>
                    <select name="category">
                        <option value="">카테고리를 선택하세요</option>
                        <c:forEach items="${ArtworkCategory.validValues()}" var="c">
                            <option value="${c.name()}">${c.name()}</option>
                        </c:forEach>
                    </select>
                </li>
                <li>
                    <div>전시상태</div>
                    <input type="radio" name="displayYn" value="Y" id="displayOn">
                    <label for="displayOn">공개</label>
                    <input type="radio" name="displayYn" value="N" id="displayOff">
                    <label for="displayOff">비공개</label>
                </li>
                <li>
                    <div>이미지 등록</div>
                    <input type="file" name="image" accept="image/*" onchange="previewImage()">
                </li>
                <li>
                    <img alt="image" src="" name="uploadedImage">
                </li>
            </ul>
            <div>
                <div>작품설명</div>
                <textarea name="content"></textarea>
            </div>
        </div>
        <div class="artwork-write-form-btn">
            <input type="button" value="등록" onclick="artworkWrite(this)">
            <input type="button" value="취소" onclick="location.href='museum.do?command=artworkList'">
        </div>
    </form>
</section>
<jsp:include page="/WEB-INF/views/footer.jsp"/>