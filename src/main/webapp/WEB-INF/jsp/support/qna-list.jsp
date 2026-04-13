<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Q&A | 필그림시니어랜드</title>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<main class="page-content">
    <div class="container">
        <div class="page-header">
            <h1>Q&A</h1>
            <a href="${pageContext.request.contextPath}/support/qna/write" class="btn btn-primary" data-testid="qna-write-btn">질문하기</a>
        </div>

        <div class="board-list">
            <table class="table" data-testid="qna-table">
                <thead>
                    <tr>
                        <th class="col-no">번호</th>
                        <th class="col-title">제목</th>
                        <th class="col-author">작성자</th>
                        <th class="col-date">등록일</th>
                        <th class="col-status">상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty qnaList}">
                            <tr>
                                <td colspan="5" class="no-data">등록된 질문이 없습니다.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                <tr>
                                    <td class="col-no">${totalCount - ((currentPage - 1) * pageSize + status.index)}</td>
                                    <td class="col-title">
                                        <a href="${pageContext.request.contextPath}/support/qna/detail?id=${qna.id}" data-testid="qna-link-${qna.id}">
                                            ${qna.title}
                                            <c:if test="${qna.isSecret}">
                                                <span class="badge badge-secret">비밀글</span>
                                            </c:if>
                                        </a>
                                    </td>
                                    <td class="col-author">${qna.author}</td>
                                    <td class="col-date">
                                        <fmt:formatDate value="${qna.createdAt}" pattern="yyyy.MM.dd"/>
                                    </td>
                                    <td class="col-status">
                                        <c:choose>
                                            <c:when test="${qna.status == 'ANSWERED'}">
                                                <span class="badge badge-answered">답변완료</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-pending">대기중</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <!-- 페이징 -->
            <c:if test="${totalPages > 1}">
                <div class="pagination" data-testid="qna-pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}" class="page-link">&laquo; 이전</a>
                    </c:if>

                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${i == currentPage}">
                                <span class="page-link active">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="?page=${i}" class="page-link">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${currentPage < totalPages}">
                        <a href="?page=${currentPage + 1}" class="page-link">다음 &raquo;</a>
                    </c:if>
                </div>
            </c:if>
        </div>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>
