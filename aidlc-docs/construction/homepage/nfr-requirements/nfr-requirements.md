# NFR 요구사항 (Non-Functional Requirements)

## 성능 (Performance)

| ID | 요구사항 | 목표값 | 측정 방법 |
|----|----------|--------|-----------|
| PF-01 | 페이지 초기 로딩 (LCP) | 3초 이내 | Chrome DevTools / Lighthouse |
| PF-02 | 서버 응답 시간 (TTFB) | 500ms 이내 | 서버 로그 |
| PF-03 | 이미지 최적화 | WebP 포맷, lazy loading 적용 | 파일 크기 확인 |
| PF-04 | CSS/JS 최소화 | minification 적용 | 파일 크기 확인 |
| PF-05 | DB 쿼리 응답 | 100ms 이내 (단순 조회) | 쿼리 실행 계획 |

---

## 보안 (Security)

| ID | 요구사항 | 구현 방법 |
|----|----------|-----------|
| SC-01 | HTTPS 적용 | Cafe24 SSL 인증서 |
| SC-02 | XSS 방지 | ValidationUtil HTML 이스케이프 |
| SC-03 | SQL Injection 방지 | PreparedStatement 전용 사용 |
| SC-04 | CSRF 방지 | 폼 제출 시 CSRF 토큰 검증 |
| SC-05 | 스팸/봇 방지 | Google reCAPTCHA v3 (score >= 0.5) |
| SC-06 | 보안 헤더 | Filter로 응답 헤더 설정 |
| SC-07 | 관리자 인증 | BCrypt 비밀번호 해시 + 세션 관리 |
| SC-08 | 관리자 세션 타임아웃 | 30분 비활성 시 자동 만료 |
| SC-09 | 개인정보처리방침 | 별도 페이지 필수 포함 |
| SC-10 | 입력 길이 제한 | 서버 사이드 최대 길이 검증 |

### 보안 헤더 목록
```
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
Referrer-Policy: strict-origin-when-cross-origin
Content-Security-Policy: default-src 'self'; script-src 'self' https://maps.googleapis.com https://www.google.com https://www.gstatic.com; ...
```

---

## 가용성 (Availability)

| ID | 요구사항 | 비고 |
|----|----------|------|
| AV-01 | Cafe24 호스팅 SLA 준수 | 호스팅 업체 보장 |
| AV-02 | 오류 페이지 처리 | 404, 500 커스텀 오류 페이지 |
| AV-03 | DB 연결 실패 시 graceful 처리 | 오류 메시지 표시 (스택 트레이스 미노출) |

---

## 반응형 / 접근성 (Responsive & Accessibility)

| ID | 요구사항 | 기준 |
|----|----------|------|
| RS-01 | 모바일 (320px~) 지원 | CSS 미디어 쿼리 |
| RS-02 | 태블릿 (768px~) 지원 | CSS 미디어 쿼리 |
| RS-03 | 데스크탑 (1280px~) 지원 | CSS 미디어 쿼리 |
| AC-01 | 최소 폰트 크기 16px | 시니어 사용자 고려 |
| AC-02 | 충분한 색상 대비 | WCAG AA 참고 |
| AC-03 | 이미지 alt 텍스트 | 모든 이미지 |
| AC-04 | 키보드 네비게이션 | Tab 순서 논리적 구성 |

---

## 유지보수성 (Maintainability)

| ID | 요구사항 | 방법 |
|----|----------|------|
| MT-01 | 설정값 외부화 | application.properties |
| MT-02 | 로그 기록 | java.util.logging 또는 SLF4J |
| MT-03 | 코드 주석 | 주요 비즈니스 로직 한국어 주석 |
| MT-04 | 정적 콘텐츠 분리 | JSP는 WEB-INF 하위, 리소스는 /resources |
