<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>테스트 페이지</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .success { color: green; }
        .error { color: red; }
    </style>
</head>
<body>
    <h1>필그림시니어랜드 - 서버 테스트</h1>
    <p class="success">✅ 서버가 정상적으로 실행 중입니다!</p>
    <p>현재 시간: <%= new java.util.Date() %></p>
    
    <h2>주요 페이지 링크</h2>
    <ul>
        <li><a href="/">홈페이지</a></li>
        <li><a href="/admin/login">관리자 로그인</a></li>
        <li><a href="/support/notice">공지사항</a></li>
        <li><a href="/support/qna">Q&A</a></li>
        <li><a href="/support/contact">문의하기</a></li>
    </ul>
    
    <h2>관리자 계정</h2>
    <ul>
        <li>아이디: admin</li>
        <li>비밀번호: admin1234</li>
    </ul>
</body>
</html>
