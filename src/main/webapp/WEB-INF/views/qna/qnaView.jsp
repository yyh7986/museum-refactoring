<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/header.jsp">
    <jsp:param name="stylesheet" value="static/stylesheet/qna/qna_icon.css"/>
    <jsp:param name="stylesheet" value="static/stylesheet/qna/qna_view.css"/>
    <jsp:param name="script" value="static/script/qna.js"/>
</jsp:include>
<main class="qna-view">
    <div class="qna-view_header">
        <div class="qna-view_header_title">
            <h1>고객센터</h1>
        </div>
        <div class="qna-view_header_buttons">
            <button class="qna-view_submit" onclick="qnaPwdCheck(${qnaVO.qseq}, 'edit')">수정하기</button>
            <button class="qna-view_submit" onclick="qnaPwdCheck(${qnaVO.qseq}, 'delete')">삭제하기</button>
        </div>
    </div>
    <div class="qna-view_body">
        <div class="qna-view_info">
            <h1>${qnaVO.title}</h1>
            <p>
                <strong>작성일</strong>:
                <fmt:formatDate value="${qnaVO.writedate}" pattern="yyyy-MM-dd"/>
            </p>
            <p>
                <strong>작성자</strong>:
                <c:choose>
                    <c:when test="${isAdmin}">
                        ${qnaVO.email} (${qnaVO.phone})
                    </c:when>
                    <c:otherwise>${qnaVO.email.substring(0, 3)}**** (010-****-****)</c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="qna-view_content">
            <c:out value="${qnaVO.content}"/>
        </div>
    </div>
    <div class="qna-view_reply">
        <h2>답변</h2>
        <c:choose>
            <c:when test="${isAdmin}">
                <form id="qnaReplyForm" action="museum.do?command=qnaReply" method="post" onsubmit="ajaxSubmit(event)">
                    <input type="hidden" name="qseq" value="${qnaVO.qseq}"/>
                    <textarea name="reply" placeholder="답변을 입력하세요"><c:out value="${qnaVO.reply}"/></textarea>
                    <input type="submit" value="답변 등록"/>
                </form>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${empty qnaVO.reply}">
                        <span class="qna-view_reply_no">답변이 아직 없습니다.</span>
                    </c:when>
                    <c:otherwise>
                        <c:out value="${qnaVO.reply}"/>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </div>
</main>
<jsp:include page="/WEB-INF/views/footer.jsp"/>