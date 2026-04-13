<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>문의 관�?- 관리자</title>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body class="admin-body">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>
<main class="admin-main">
    <h2>문의 관�?/h2>
    <table class="board-table">
        <thead><tr><th>번호</th><th>?�름</th><th>?�락�?/th><th>문의 ?�용</th><th>?�수??/th></tr></thead>
        <tbody>
            <c:forEach var="contact" items="${contacts}" varStatus="s">
                <tr>
                    <td>${s.count}</td>
                    <td>${contact.name}</td>
                    <td>${contact.phone}</td>
                    <td class="message-col">${contact.message}</td>
                    <td><fmt:formatDate value="${contact.submittedAt}" pattern="yyyy.MM.dd HH:mm"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>
