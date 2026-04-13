<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>${qna.title} | Q&A | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="page-content">
    <div class="container">
        <div class="board-detail">
            <div class="detail-header">
                <h1 class="detail-title" data-testid="qna-title">
                    ${qna.title}
                    <c:if test="${qna.isSecret}">
                        <span class="badge badge-secret">비밀글</span>
                    </c:if>
                </h1>
                <div class="detail-meta">
                    <span class="meta-item">작성자: ${qna.author}</span>
                    <span class="meta-item">
                        등록일: <fmt:formatDate value="${qna.createdAt}" pattern="yyyy.MM.dd HH:mm"/>
                    </span>
                    <span class="meta-item">
                        상태:
                        <c:choose>
                            <c:when test="${qna.status == 'ANSWERED'}">
                                <span class="badge badge-answered">답변완료</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-pending">대기중</span>
                            </c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>

            <div class="detail-content" data-testid="qna-content">
                ${qna.content}
            </div>

            <!-- 답변 -->
            <c:if test="${qna.status == 'ANSWERED' && not empty qna.answer}">
                <div class="answer-section">
                    <div class="answer-header">
                        <h3>답변</h3>
                        <span class="answer-date">
                            <fmt:formatDate value="${qna.answeredAt}" pattern="yyyy.MM.dd HH:mm"/>
                        </span>
                    </div>
                    <div class="answer-content" data-testid="qna-answer">
                        ${qna.answer}
                    </div>
                </div>
            </c:if>

            <div class="detail-actions">
                <a href="${pageContext.request.contextPath}/support/qna" class="btn btn-secondary">목록으로</a>
            </div>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>
