<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="/WEB-INF/jsp/common/head.jsp" %>
</head>
<body class="admin-page">
<%@ include file="/WEB-INF/jsp/admin/common/admin-header.jsp" %>

<main class="admin-content">
    <div class="container">
        <div class="page-header">
            <h1>${empty notice ? '공지사항 작성' : '공지사항 수정'}</h1>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/notice/${empty notice ? 'new' : 'edit'}" class="admin-form">
            <c:if test="${not empty notice}">
                <input type="hidden" name="id" value="${notice.id}">
            </c:if>

            <div class="form-group">
                <label for="title">제목 <span class="required">*</span></label>
                <input type="text" id="title" name="title" value="${notice.title}" required maxlength="200" data-testid="notice-title">
            </div>

            <div class="form-group">
                <label for="content">내용 <span class="required">*</span></label>
                <textarea id="content" name="content" required rows="20" maxlength="5000" data-testid="notice-content">${notice.content}</textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary" data-testid="notice-submit">
                    ${empty notice ? '등록' : '수정'}
                </button>
                <a href="${pageContext.request.contextPath}/admin/notice/list" class="btn btn-secondary">취소</a>
                <c:if test="${not empty notice}">
                    <button type="button" class="btn btn-danger" onclick="deleteNotice(${notice.id})" data-testid="notice-delete">삭제</button>
                </c:if>
            </div>
        </form>
    </div>
</main>

<%@ include file="/WEB-INF/jsp/admin/common/admin-footer.jsp" %>
<script>
function deleteNotice(id) {
    if (confirm('정말 삭제하시겠습니까?')) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/admin/notice/delete';
        
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = id;
        
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    }
}
</script>
</body>
</html>
