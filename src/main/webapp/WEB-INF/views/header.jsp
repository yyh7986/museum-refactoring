<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.team4.museum.util.NoticeCategory" %>
<%@ page import="com.team4.artgallery.util.ArtworkCategory" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Museum</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable-gov-dynamic-subset.min.css"/>
    <link rel="stylesheet" href="<c:url value="/static/stylesheet/reset.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/stylesheet/header.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/stylesheet/footer.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/stylesheet/pagination.css"/>">
    <c:forEach items="${paramValues.stylesheet}" var="path">
        <link rel="stylesheet" href="${path}">
    </c:forEach>
    <!-- JavaScript -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.drawsvg/1/jquery.drawsvg.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/aos@2.2/dist/aos.js"></script>
    <script src="http://cdn.jsdelivr.net/vivus/0.2.1/vivus.min.js"></script>
    <script src="<c:url value="/static/script/header.js"/>"></script>
    <script src="<c:url value="/static/script/ajax.js"/>"></script>
    <!-- Load other scripts -->
    <c:forEach items="${paramValues.script}" var="path">
        <script src="${path}"></script>
    </c:forEach>
</head>
<body>
<header>
    <div class="header_util">
        <ul class="util-link">
            <li><a href="https://www.museum.go.kr/site/child/home" target="_blank">어린이박물관</a></li>
            <li><a href="https://www.museum.go.kr/curator" target="_blank">학예사자격증</a></li>
            <li><a href="http://webzine.museum.go.kr" target="_blank">박물관신문</a></li>
            <li><a class="lang-select" href="javascript:;"> Language </a></li>
            <li><a href="https://blog.naver.com/100museum" target="_blank" title="국립중앙박물관 네이버 블로그 새 창으로 열림"
                   class="naver">
                <img src="<c:url value="/static/image/header/ico_header_item1.png"/>" alt="블로그">
            </a></li>
            <li><a href="https://twitter.com/The_NMK" target="_blank" title="국립중앙박물관 X 새 창으로 열림" class="twitter">
                <img src="<c:url value="/static/image/header/ico_header_item2.png"/>" alt="X">
            </a></li>
            <li><a href="https://www.facebook.com/NationalMuseumofKorea/" target="_blank" title="국립중앙박물관 페이스북 새 창으로 열림"
                   class="facebook">
                <img src="<c:url value="/static/image/header/ico_header_item3.png"/>" alt="페이스북">
            </a></li>
            <li><a href="https://www.instagram.com/nationalmuseumofkorea/" target="_blank"
                   title="국립중앙박물관 인스타그램 새 창으로 열림" class="instagram">
                <img src="<c:url value="/static/image/header/ico_header_item4.png"/>" alt="인스타그램">
            </a></li>
            <li><a href="https://www.youtube.com/user/koreanmuseum" target="_blank" title="국립중앙박물관 유튜브 새 창으로 열림"
                   class="youtube">
                <img src="<c:url value="/static/image/header/ico_header_item5.png"/>" alt="유튜브">
            </a></li>
            <li><a href="https://audioclip.naver.com/channels/2320" target="_blank" title="국립중앙박물관 네이버 오디오클립 새 창으로 열림"
                   class="audioclip">
                <img src="<c:url value="/static/image/header/ico_header_item6.png"/>" alt="오디오클립">
            </a></li>
        </ul>
    </div>
    <nav>
        <h1 data-aos="fade-in" data-aos-offset="200" data-aos-easing="ease-in">
            <svg id="header_logo_v" width="300" height="50" viewBox="0 0 300 50" xmlns="http://www.w3.org/2000/svg"
                 onclick="location.href='museum.do?command=index'">
                <g stroke-linecap="round" fill-rule="evenodd" font-size="9pt" stroke="#737373" stroke-width="0.2mm"
                   fill="#000" style="stroke:#000;stroke-width:0.2mm;fill:#000">

                    <!-- 태극기 배경 -->
                    <circle cx="20" cy="20" r="20" fill="#023859"></circle>
                    <circle cx="20" cy="20" r="14" fill="#FFFFFF"></circle>

                    <!-- 태극기 모양 -->
                    <path d="M20 10 A 10 10 0 0 0 30 20 L 30 30 A 10 10 0 0 1 20 30 Z" fill="#D9043D"></path>
                    <path d="M20 10 A 10 10 0 0 1 30 20 L 20 20 Z" fill="#023859"></path>
                    <path d="M20 30 A 10 10 0 0 1 10 20 L 20 20 Z" fill="#FFFFFF"></path>


                    <path class="logo03" id="logo_outline03" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 20.303 0 L 20.303 26.045 L 18.018 26.045 L 18.018 0 L 20.303 0 Z M 9.781 8.49 A 7.65 7.65 0 0 0 7.881 8.262 Q 6.035 8.262 4.585 9.023 Q 3.135 9.785 2.314 11.147 A 5.565 5.565 0 0 0 1.791 12.291 A 6.225 6.225 0 0 0 1.494 14.238 A 7.01 7.01 0 0 0 1.507 14.665 A 5.764 5.764 0 0 0 2.314 17.329 A 5.671 5.671 0 0 0 4.585 19.453 A 6.396 6.396 0 0 0 5.98 19.987 A 7.65 7.65 0 0 0 7.881 20.215 Q 9.727 20.215 11.177 19.453 Q 12.627 18.691 13.447 17.329 A 5.565 5.565 0 0 0 13.971 16.185 A 6.225 6.225 0 0 0 14.268 14.238 A 7.01 7.01 0 0 0 14.255 13.812 A 5.764 5.764 0 0 0 13.447 11.147 A 5.671 5.671 0 0 0 11.177 9.023 A 6.396 6.396 0 0 0 9.781 8.49 Z M 15.498 4.189 L 15.498 6.094 L 0 6.094 L 0 4.189 L 15.498 4.189 Z M 7.881 10.195 A 4.834 4.834 0 0 0 6.608 10.358 A 4.143 4.143 0 0 0 5.728 10.708 Q 4.775 11.221 4.233 12.144 A 3.959 3.959 0 0 0 3.705 13.878 A 4.83 4.83 0 0 0 3.691 14.238 Q 3.691 15.41 4.233 16.318 Q 4.775 17.227 5.728 17.739 A 4.305 4.305 0 0 0 7.367 18.227 A 5.275 5.275 0 0 0 7.881 18.252 A 4.834 4.834 0 0 0 9.153 18.09 A 4.143 4.143 0 0 0 10.034 17.739 Q 10.986 17.227 11.528 16.318 Q 12.07 15.41 12.07 14.238 A 4.333 4.333 0 0 0 11.884 12.95 A 3.816 3.816 0 0 0 11.528 12.144 A 3.774 3.774 0 0 0 10.034 10.708 A 4.305 4.305 0 0 0 8.394 10.22 A 5.275 5.275 0 0 0 7.881 10.195 Z M 8.994 0.322 L 8.994 5.068 L 6.709 5.068 L 6.709 0.322 L 8.994 0.322 Z M 24.668 10.752 L 24.668 12.656 L 19.775 12.656 L 19.775 10.752 L 24.668 10.752 Z"
                          vector-effect="non-scaling-stroke"></path>
                    <path class="logo04" id="logo_outline04" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 20.508 0 L 20.508 26.104 L 18.193 26.104 L 18.193 0 L 20.508 0 Z M 10.093 3.149 A 5.599 5.599 0 0 0 6.651 2.021 A 5.599 5.599 0 0 0 3.208 3.149 A 6.61 6.61 0 0 0 1.782 4.621 A 8.598 8.598 0 0 0 0.85 6.328 A 10.778 10.778 0 0 0 0.181 8.735 A 14.795 14.795 0 0 0 0 11.104 A 14.835 14.835 0 0 0 0.175 13.434 A 10.801 10.801 0 0 0 0.85 15.879 A 8.879 8.879 0 0 0 1.52 17.192 A 6.649 6.649 0 0 0 3.208 19.043 A 5.648 5.648 0 0 0 6.651 20.156 A 5.648 5.648 0 0 0 10.093 19.043 A 6.508 6.508 0 0 0 11.546 17.545 A 8.546 8.546 0 0 0 12.451 15.879 A 10.778 10.778 0 0 0 13.12 13.472 A 14.795 14.795 0 0 0 13.301 11.104 A 14.835 14.835 0 0 0 13.126 8.773 A 10.801 10.801 0 0 0 12.451 6.328 A 8.972 8.972 0 0 0 11.789 5.027 A 6.769 6.769 0 0 0 10.093 3.149 Z M 6.651 4.072 Q 5.361 4.072 4.351 4.951 A 4.883 4.883 0 0 0 3.369 6.143 Q 3.031 6.708 2.783 7.412 Q 2.227 8.994 2.227 11.104 A 13.235 13.235 0 0 0 2.349 12.947 A 9.642 9.642 0 0 0 2.783 14.78 A 7.073 7.073 0 0 0 3.305 15.947 Q 3.678 16.603 4.166 17.073 A 4.217 4.217 0 0 0 4.351 17.241 Q 5.361 18.105 6.651 18.105 Q 7.94 18.105 8.95 17.241 A 4.699 4.699 0 0 0 9.896 16.116 Q 10.257 15.529 10.518 14.78 A 9.642 9.642 0 0 0 10.952 12.947 A 13.235 13.235 0 0 0 11.074 11.104 A 13.585 13.585 0 0 0 10.968 9.359 Q 10.848 8.434 10.593 7.637 A 8.197 8.197 0 0 0 10.518 7.412 Q 10.004 5.951 9.115 5.09 A 4.37 4.37 0 0 0 8.965 4.951 A 3.391 3.391 0 0 0 6.651 4.072 Z"
                          vector-effect="non-scaling-stroke"></path>
                    <path class="logo05" id="logo_outline05" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 12.041 2.578 L 12.041 19.512 L 0 19.512 L 0 2.578 L 12.041 2.578 Z M 19.951 0 L 19.951 26.104 L 17.637 26.104 L 17.637 0 L 19.951 0 Z M 2.256 4.424 L 2.256 17.637 L 9.785 17.637 L 9.785 4.424 L 2.256 4.424 Z"
                          vector-effect="non-scaling-stroke"></path>
                    <path class="logo06" id="logo_outline06" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 20.684 15.234 L 20.684 21.152 L 5.215 21.152 L 5.215 24.316 L 2.93 24.316 L 2.93 19.424 L 18.428 19.424 L 18.428 17.051 L 2.871 17.051 L 2.871 15.234 L 20.684 15.234 Z M 23.73 10.752 L 23.73 12.627 L 0 12.627 L 0 10.752 L 23.73 10.752 Z M 21.475 23.789 L 21.475 25.605 L 2.93 25.605 L 2.93 23.789 L 21.475 23.789 Z M 22.441 7.295 L 21.621 9.053 Q 18.867 8.672 16.45 7.588 A 12.645 12.645 0 0 1 14.268 6.35 A 9.851 9.851 0 0 1 12.554 4.805 A 6.089 6.089 0 0 1 11.421 2.943 A 5.499 5.499 0 0 1 11.074 0.996 L 11.074 0 L 13.066 0 L 13.066 0.996 A 3.652 3.652 0 0 0 13.695 3.025 A 5.369 5.369 0 0 0 14.399 3.882 A 9.143 9.143 0 0 0 16.047 5.174 Q 16.85 5.673 17.823 6.082 A 15 15 0 0 0 17.886 6.108 Q 20.039 7.002 22.441 7.295 Z M 2.109 9.053 L 1.318 7.295 Q 3.721 7.002 5.874 6.108 A 12.759 12.759 0 0 0 7.657 5.208 Q 8.631 4.611 9.36 3.882 A 5.235 5.235 0 0 0 10.146 2.895 A 3.615 3.615 0 0 0 10.693 0.996 L 10.693 0 L 12.656 0 L 12.656 0.996 A 5.604 5.604 0 0 1 11.334 4.618 A 7.158 7.158 0 0 1 11.177 4.805 A 10.109 10.109 0 0 1 8.961 6.688 A 13.135 13.135 0 0 1 7.28 7.588 Q 4.863 8.672 2.109 9.053 Z M 12.979 12.1 L 12.979 16.113 L 10.693 16.113 L 10.693 12.1 L 12.979 12.1 Z"
                          vector-effect="non-scaling-stroke"></path>
                    <path class="logo07" id="logo_outline07" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 20.566 0 L 20.566 19.6 L 18.223 19.6 L 18.223 0 L 20.566 0 Z M 21.416 23.555 L 21.416 25.488 L 4.014 25.488 L 4.014 23.555 L 21.416 23.555 Z M 16.465 12.686 L 16.611 14.385 A 63.966 63.966 0 0 1 11.876 14.999 A 76.11 76.11 0 0 1 8.848 15.22 A 157.51 157.51 0 0 1 2.454 15.426 A 177.566 177.566 0 0 1 0.234 15.439 L 0 13.535 A 309.416 309.416 0 0 0 4.588 13.476 Q 6.903 13.428 8.95 13.345 A 80.152 80.152 0 0 0 14.208 12.964 A 68.533 68.533 0 0 0 16.465 12.686 Z M 13.242 2.021 L 13.242 3.955 L 1.611 3.955 L 1.611 2.021 L 13.242 2.021 Z M 13.916 11.104 L 11.602 10.928 Q 11.956 9.2 12.109 7.858 A 20.185 20.185 0 0 0 12.187 7.031 A 52.991 52.991 0 0 0 12.28 5.374 Q 12.319 4.441 12.334 3.398 L 12.334 2.021 L 14.59 2.021 L 14.59 3.398 Q 14.565 5.236 14.485 6.728 A 58.246 58.246 0 0 1 14.458 7.207 Q 14.355 8.877 13.916 11.104 Z M 7.881 7.793 L 7.881 14.326 L 5.596 14.326 L 5.596 7.793 L 7.881 7.793 Z M 6.328 17.842 L 6.328 24.17 L 4.014 24.17 L 4.014 17.842 L 6.328 17.842 Z M 24.375 8.496 L 24.375 10.459 L 19.512 10.459 L 19.512 8.496 L 24.375 8.496 Z"
                          vector-effect="non-scaling-stroke"></path>
                    <path class="logo08" id="logo_outline08" data-duration="100" stroke="#737373" fill="#737373"
                          fill-opacity="0"
                          d="M 49.175 6.519 L 49.57 6.592 L 46.406 6.592 L 46.406 5.435 L 50.464 5.435 L 50.464 6.577 Q 50.464 7.866 49.907 8.848 A 3.861 3.861 0 0 1 48.369 10.364 A 4.394 4.394 0 0 1 46.74 10.865 A 5.486 5.486 0 0 1 46.128 10.899 A 5.026 5.026 0 0 1 44.729 10.71 A 4.254 4.254 0 0 1 43.652 10.232 A 4.366 4.366 0 0 1 42.146 8.634 A 5.322 5.322 0 0 1 41.99 8.335 A 5.838 5.838 0 0 1 41.498 6.747 A 7.922 7.922 0 0 1 41.396 5.449 A 7.793 7.793 0 0 1 41.523 4.014 A 5.769 5.769 0 0 1 41.99 2.564 A 4.807 4.807 0 0 1 42.817 1.343 A 4.226 4.226 0 0 1 43.638 0.667 A 4.336 4.336 0 0 1 45.769 0.007 A 5.277 5.277 0 0 1 46.04 0 A 4.982 4.982 0 0 1 47.411 0.184 A 4.425 4.425 0 0 1 48.076 0.432 Q 48.999 0.864 49.607 1.648 A 4.136 4.136 0 0 1 50.405 3.457 L 49.043 3.457 A 3.602 3.602 0 0 0 48.688 2.671 A 3.131 3.131 0 0 0 48.398 2.271 A 2.914 2.914 0 0 0 47.38 1.502 A 2.99 2.99 0 0 0 46.492 1.257 A 3.756 3.756 0 0 0 46.04 1.231 A 3.097 3.097 0 0 0 44.326 1.721 Q 43.564 2.212 43.118 3.164 A 4.502 4.502 0 0 0 42.776 4.247 Q 42.671 4.804 42.671 5.449 A 6.662 6.662 0 0 0 42.75 6.506 Q 42.859 7.184 43.118 7.734 A 3.717 3.717 0 0 0 43.639 8.56 A 3.029 3.029 0 0 0 44.348 9.177 A 3.239 3.239 0 0 0 45.943 9.664 A 3.927 3.927 0 0 0 46.128 9.668 A 3.603 3.603 0 0 0 46.981 9.571 A 2.901 2.901 0 0 0 47.725 9.28 A 2.684 2.684 0 0 0 48.794 8.174 A 3.247 3.247 0 0 0 49.138 7.083 A 4.157 4.157 0 0 0 49.175 6.519 Z M 0 10.752 L 0 0.147 L 1.318 0.147 L 1.318 4.863 L 6.929 4.863 L 6.929 0.147 L 8.262 0.147 L 8.262 10.752 L 6.929 10.752 L 6.929 6.021 L 1.318 6.021 L 1.318 10.752 L 0 10.752 Z M 73.491 6.665 L 73.491 7.192 L 67.339 7.192 L 67.339 6.123 L 72.217 6.123 A 2.941 2.941 0 0 0 72.151 5.488 A 2.35 2.35 0 0 0 71.953 4.929 A 2.006 2.006 0 0 0 71.199 4.109 A 2.045 2.045 0 0 0 70.338 3.823 A 2.568 2.568 0 0 0 70.063 3.809 A 2.427 2.427 0 0 0 69.385 3.9 A 2.046 2.046 0 0 0 68.833 4.153 Q 68.306 4.497 68.013 5.076 A 2.702 2.702 0 0 0 67.72 6.314 L 67.72 7.031 A 4.193 4.193 0 0 0 67.774 7.727 Q 67.85 8.173 68.027 8.533 Q 68.335 9.155 68.892 9.478 A 2.385 2.385 0 0 0 69.783 9.774 A 3.024 3.024 0 0 0 70.181 9.8 A 2.855 2.855 0 0 0 70.638 9.765 A 2.24 2.24 0 0 0 71.001 9.675 A 2.455 2.455 0 0 0 71.34 9.533 A 1.873 1.873 0 0 0 71.624 9.353 A 1.543 1.543 0 0 0 71.946 9.019 A 1.42 1.42 0 0 0 72.026 8.892 L 73.374 8.892 A 2.648 2.648 0 0 1 72.744 9.946 A 2.901 2.901 0 0 1 71.961 10.516 A 3.543 3.543 0 0 1 71.646 10.657 A 3.77 3.77 0 0 1 70.67 10.888 A 4.665 4.665 0 0 1 70.181 10.913 A 4.251 4.251 0 0 1 69.14 10.791 A 3.417 3.417 0 0 1 68.21 10.408 A 3.345 3.345 0 0 1 66.914 8.98 A 4.354 4.354 0 0 1 66.524 7.712 A 5.719 5.719 0 0 1 66.46 6.841 A 5.574 5.574 0 0 1 66.573 5.693 A 4.432 4.432 0 0 1 66.914 4.68 A 3.695 3.695 0 0 1 67.58 3.708 A 3.304 3.304 0 0 1 68.181 3.215 A 3.306 3.306 0 0 1 69.671 2.714 A 4.123 4.123 0 0 1 70.063 2.695 A 3.657 3.657 0 0 1 71.748 3.091 A 2.771 2.771 0 0 1 72.695 3.893 A 3.686 3.686 0 0 1 73.008 4.38 Q 73.409 5.121 73.477 6.204 A 7.31 7.31 0 0 1 73.491 6.665 Z M 55.869 7.149 L 55.034 7.207 A 4.407 4.407 0 0 0 54.515 7.27 Q 53.987 7.369 53.65 7.595 A 1.054 1.054 0 0 0 53.172 8.356 A 1.445 1.445 0 0 0 53.159 8.555 A 1.31 1.31 0 0 0 53.198 8.883 A 0.999 0.999 0 0 0 53.372 9.243 A 1.226 1.226 0 0 0 53.743 9.564 A 1.61 1.61 0 0 0 53.965 9.668 A 2.159 2.159 0 0 0 54.453 9.79 A 2.815 2.815 0 0 0 54.829 9.815 A 2.942 2.942 0 0 0 55.395 9.763 A 2.158 2.158 0 0 0 56.016 9.544 Q 56.514 9.273 56.777 8.826 A 1.856 1.856 0 0 0 57.041 7.866 L 57.041 5.391 A 2.227 2.227 0 0 0 57.008 5 Q 56.966 4.761 56.868 4.566 A 1.371 1.371 0 0 0 56.843 4.519 A 1.236 1.236 0 0 0 56.316 4.013 A 1.544 1.544 0 0 0 56.243 3.977 A 1.886 1.886 0 0 0 55.837 3.849 Q 55.643 3.809 55.419 3.798 A 3.651 3.651 0 0 0 55.239 3.794 A 2.888 2.888 0 0 0 54.737 3.835 Q 54.458 3.885 54.23 3.993 A 1.608 1.608 0 0 0 54.06 4.087 Q 53.599 4.38 53.452 4.863 L 52.134 4.863 A 2.169 2.169 0 0 1 52.639 3.728 A 2.564 2.564 0 0 1 53.36 3.147 A 3.267 3.267 0 0 1 53.745 2.966 A 3.857 3.857 0 0 1 54.674 2.734 A 4.937 4.937 0 0 1 55.298 2.695 A 4.511 4.511 0 0 1 56.646 2.9 A 2.212 2.212 0 0 1 57.523 3.427 A 2.891 2.891 0 0 1 57.795 3.728 Q 58.18 4.216 58.263 5.032 A 4.695 4.695 0 0 1 58.286 5.508 L 58.286 10.752 L 57.041 10.752 L 57.041 9.668 L 56.982 9.668 A 1.792 1.792 0 0 1 56.77 10.006 A 2.426 2.426 0 0 1 56.536 10.261 A 2.063 2.063 0 0 1 56.188 10.525 Q 55.99 10.646 55.745 10.745 A 2.655 2.655 0 0 1 55.144 10.905 A 3.607 3.607 0 0 1 54.609 10.942 A 3.417 3.417 0 0 1 53.778 10.845 A 2.903 2.903 0 0 1 53.232 10.65 A 2.321 2.321 0 0 1 52.258 9.8 Q 51.899 9.243 51.899 8.496 Q 51.899 7.597 52.343 7.083 A 1.638 1.638 0 0 1 52.749 6.746 A 3.902 3.902 0 0 1 53.692 6.349 Q 54.127 6.227 54.636 6.174 A 7.135 7.135 0 0 1 54.888 6.152 A 2.572 2.572 0 0 1 54.942 6.148 Q 55.176 6.13 56.156 6.073 A 489.635 489.635 0 0 1 56.294 6.065 L 57.129 6.035 L 57.144 7.061 A 1.248 1.248 0 0 0 57.095 7.062 Q 56.883 7.071 55.994 7.139 A 240.43 240.43 0 0 0 55.869 7.149 Z M 18.486 10.752 L 17.109 10.752 L 20.991 0.147 L 22.383 0.147 L 26.265 10.752 L 24.873 10.752 L 21.724 1.86 L 21.636 1.86 L 18.486 10.752 Z M 80.479 13.711 L 80.479 12.583 L 80.713 12.598 A 1.3 1.3 0 0 0 80.781 12.604 Q 80.858 12.61 80.973 12.612 A 7.665 7.665 0 0 0 81.094 12.612 A 2.611 2.611 0 0 0 81.311 12.604 Q 81.413 12.595 81.501 12.578 A 1.218 1.218 0 0 0 81.628 12.546 A 0.64 0.64 0 0 0 81.801 12.46 Q 81.927 12.374 82.053 12.217 A 1.6 1.6 0 0 0 82.19 12.014 Q 82.328 11.775 82.456 11.411 L 82.69 10.811 L 79.746 2.798 L 81.123 2.798 L 83.291 9.111 L 83.379 9.111 L 85.547 2.798 L 86.924 2.798 L 83.555 11.895 A 4.187 4.187 0 0 1 83.258 12.522 Q 83.062 12.857 82.819 13.1 A 2.287 2.287 0 0 1 82.617 13.279 A 2.138 2.138 0 0 1 81.553 13.717 A 2.83 2.83 0 0 1 81.182 13.74 A 8.675 8.675 0 0 1 80.772 13.731 A 6.79 6.79 0 0 1 80.479 13.711 Z M 27.539 10.752 L 27.539 2.798 L 28.755 2.798 L 28.755 4.014 L 28.843 4.014 Q 29.063 3.399 29.626 3.032 A 2.276 2.276 0 0 1 30.894 2.666 A 7.87 7.87 0 0 1 31.236 2.673 Q 31.404 2.681 31.553 2.695 L 31.553 3.97 A 0.366 0.366 0 0 0 31.513 3.957 Q 31.443 3.938 31.304 3.919 A 4.867 4.867 0 0 0 31.245 3.911 Q 31.011 3.882 30.791 3.882 A 2.213 2.213 0 0 0 30.106 3.986 A 2.004 2.004 0 0 0 29.78 4.124 A 1.852 1.852 0 0 0 29.063 4.79 A 1.765 1.765 0 0 0 28.799 5.726 A 2.099 2.099 0 0 0 28.799 5.742 L 28.799 10.752 L 27.539 10.752 Z M 75.132 10.752 L 75.132 2.798 L 76.348 2.798 L 76.348 4.014 L 76.436 4.014 Q 76.655 3.399 77.219 3.032 A 2.276 2.276 0 0 1 78.486 2.666 A 7.87 7.87 0 0 1 78.829 2.673 Q 78.997 2.681 79.146 2.695 L 79.146 3.97 A 0.366 0.366 0 0 0 79.106 3.957 Q 79.035 3.938 78.897 3.919 A 4.867 4.867 0 0 0 78.838 3.911 Q 78.604 3.882 78.384 3.882 A 2.213 2.213 0 0 0 77.698 3.986 A 2.004 2.004 0 0 0 77.373 4.124 A 1.852 1.852 0 0 0 76.655 4.79 A 1.765 1.765 0 0 0 76.392 5.726 A 2.099 2.099 0 0 0 76.392 5.742 L 76.392 10.752 L 75.132 10.752 Z M 33.311 0.894 L 34.585 0.894 L 34.585 8.467 A 2.71 2.71 0 0 0 34.597 8.734 Q 34.626 9.026 34.724 9.207 A 0.91 0.91 0 0 0 34.852 9.388 A 0.676 0.676 0 0 0 35.09 9.558 Q 35.311 9.651 35.607 9.653 A 1.962 1.962 0 0 0 35.625 9.653 A 9.741 9.741 0 0 0 36.372 9.624 L 36.372 10.796 A 4.689 4.689 0 0 1 36.016 10.836 Q 35.834 10.85 35.631 10.853 A 8.053 8.053 0 0 1 35.493 10.855 A 2.447 2.447 0 0 1 34.438 10.62 A 1.982 1.982 0 0 1 33.625 9.917 Q 33.311 9.448 33.311 8.789 L 33.311 0.894 Z M 11.909 0.147 L 11.909 10.752 L 10.591 10.752 L 10.591 0.147 L 11.909 0.147 Z M 61.567 0.147 L 61.567 10.752 L 60.308 10.752 L 60.308 0.147 L 61.567 0.147 Z M 64.834 0.147 L 64.834 10.752 L 63.574 10.752 L 63.574 0.147 L 64.834 0.147 Z M 18.97 6.607 L 24.404 6.607 L 24.404 7.764 L 18.97 7.764 L 18.97 6.607 Z M 36.255 2.798 L 36.255 3.853 L 32.109 3.853 L 32.109 2.798 L 36.255 2.798 Z"
                          vector-effect="non-scaling-stroke"></path>
                </g>
            </svg>
        </h1>
        <div class="header_gnb">
            <div>
                <a href="artwork">예술품</a>
                <a href="museum.do?command=noticeList">소식지</a>
                <a href="museum.do?command=galleryList">이용자 갤러리</a>
                <a href="museum.do?command=qnaList">고객센터</a>
            </div>
        </div>
        <div class="login_join_box">
            <c:choose>
                <c:when test="${empty loginUser}">
                    <c:if test="${not empty returnUrl}">
                        <c:set var="urlPath" value="${returnUrl}"/>
                    </c:if>
                    <a href="member/login?returnUrl=${urlPath}" class="login-join-box_btn">로그인</a>
                    <a href="museum.do?command=contract&returnUrl=${urlPath}">회원가입</a>
                </c:when>
                <c:otherwise>
                    <a href="museum.do?command=mypage" class="login-join-box_btn">${loginUser.name}(${loginUser.id})</a>
                    <span onclick="ajax({command:'logout',returnUrl:'${urlPath}'})">로그아웃</span>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>
</header>
<div class="header_gnb_list_containner">
    <div>
        <c:forEach items="${ArtworkCategory.values()}" var="c">
            <a href="museum.do?command=artworkList&category=${c.name()}">${c.name()}</a>
        </c:forEach>
    </div>
</div>
<div class="header_gnb_list_containner01">
    <div>
        <c:forEach items="${NoticeCategory.values()}" var="c">
            <a href="museum.do?command=noticeList&category=${c.name()}">${c.name()}</a>
        </c:forEach>
    </div>
</div>
<script>
    AOS.init({
        once: true
    });
    $(window).on('load', function () {
        AOS.refresh();
    });
</script>
<div class="content-wrap">