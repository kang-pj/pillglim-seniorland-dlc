# Code Generation Plan - 필그림시니어랜드 홈페이지

## 단위 컨텍스트

- **프로젝트 타입**: Greenfield
- **코드 위치**: `C:\workspace\pillglim-seniorland\` (aidlc-docs/ 제외)
- **기술 스택**: Java 11 / JSP 3.0 / Servlet 5.0 / MariaDB 10.x / Maven
- **호스팅**: Cafe24 JSP (Tomcat 10.0.x)

---

## 생성 단계

### Phase 1: 프로젝트 구조 설정

- [ ] Step 1.1: `pom.xml` 생성 (Maven 프로젝트 설정, 의존성 정의)
- [ ] Step 1.2: `src/main/webapp/WEB-INF/web.xml` 생성 (Servlet 매핑, 필터, 오류 페이지, 세션 설정)
- [ ] Step 1.3: `src/main/resources/application.properties` 생성 (DB, 이메일, reCAPTCHA, 구글맵 설정)
- [ ] Step 1.4: 디렉토리 구조 생성 (java 패키지, webapp/WEB-INF/jsp, resources)

### Phase 2: 공통 유틸리티 및 인프라

- [ ] Step 2.1: `AppConfig.java` 생성 (properties 로드)
- [ ] Step 2.2: `DBConnectionPool.java` 생성 (DBCP2 커넥션 풀)
- [ ] Step 2.3: `ValidationUtil.java` 생성 (XSS sanitize, 전화번호 검증, 길이 검증)
- [ ] Step 2.4: `EmailUtil.java` 생성 (JavaMail SMTP 발송)
- [ ] Step 2.5: `SecurityHeaderFilter.java` 생성 (보안 헤더 필터)
- [ ] Step 2.6: `AdminAuthFilter.java` 생성 (관리자 인증 필터)
- [ ] Step 2.7: `AppInitListener.java` 생성 (ServletContextListener - AppConfig 초기화)

### Phase 3: 도메인 모델 (VO)

- [ ] Step 3.1: `NoticeVO.java` 생성
- [ ] Step 3.2: `QnaVO.java` 생성
- [ ] Step 3.3: `ContactVO.java` 생성
- [ ] Step 3.4: `AdminVO.java` 생성

### Phase 4: DAO 레이어

- [ ] Step 4.1: `NoticeDao.java` 생성 (findRecent, findAll, findById, countAll)
- [ ] Step 4.2: `QnaDao.java` 생성 (findAll, findById, countAll, insert, updateAnswer)
- [ ] Step 4.3: `ContactDao.java` 생성 (insert)
- [ ] Step 4.4: `AdminDao.java` 생성 (findByUsername)

### Phase 5: Service 레이어

- [ ] Step 5.1: `NoticeService.java` 생성 (getRecentNotices, getNoticeList, getNoticeDetail)
- [ ] Step 5.2: `QnaService.java` 생성 (getQnaList, getQnaDetail, createQna, answerQna)
- [ ] Step 5.3: `RecaptchaService.java` 생성 (Google reCAPTCHA v3 검증)
- [ ] Step 5.4: `ContactService.java` 생성 (submitContact 오케스트레이션)
- [ ] Step 5.5: `AdminService.java` 생성 (authenticate - BCrypt 검증)

### Phase 6: Controller 레이어 (공개 페이지)

- [ ] Step 6.1: `HomeController.java` 생성 (GET /)
- [ ] Step 6.2: `PageController.java` 생성 (GET /intro/*, /business/*, /signature/*, /residence/*, /privacy)
- [ ] Step 6.3: `SupportController.java` 생성 (공지사항 목록/상세, Q&A 목록/상세/작성)
- [ ] Step 6.4: `ContactController.java` 생성 (GET/POST /support/contact)

### Phase 7: Controller 레이어 (관리자)

- [ ] Step 7.1: `AdminLoginController.java` 생성 (GET/POST /admin/login, /admin/logout)
- [ ] Step 7.2: `AdminDashboardController.java` 생성 (GET /admin/dashboard)
- [ ] Step 7.3: `AdminNoticeController.java` 생성 (목록/등록/수정/삭제)
- [ ] Step 7.4: `AdminQnaController.java` 생성 (목록/답변)
- [ ] Step 7.5: `AdminContactController.java` 생성 (문의 목록)

### Phase 8: 공통 JSP 레이아웃

- [ ] Step 8.1: `common/head.jsp` 생성 (공통 meta, CSS, JS 로드)
- [ ] Step 8.2: `common/header.jsp` 생성 (로고, 5단계 드롭다운 네비게이션)
- [ ] Step 8.3: `common/footer.jsp` 생성 (회사 정보, 개인정보처리방침 링크)

### Phase 9: 공개 페이지 JSP

- [ ] Step 9.1: `home/index.jsp` 생성 (Hero, 메뉴 카드, 최신 공지)
- [ ] Step 9.2: `intro/greeting.jsp`, `intro/brand.jsp`, `intro/vision.jsp` 생성
- [ ] Step 9.3: `business/overview.jsp`, `business/site.jsp` 생성 (site.jsp에 구글맵 포함)
- [ ] Step 9.4: `signature/premium.jsp`, `community.jsp`, `plan.jsp`, `floor.jsp`, `nearby.jsp`, `amenity.jsp` 생성
- [ ] Step 9.5: `residence/typemap.jsp`, `residence/floorplan.jsp` 생성 (타입별 세로 나열)
- [ ] Step 9.6: `support/notice-list.jsp`, `support/notice-detail.jsp` 생성
- [ ] Step 9.7: `support/qna-list.jsp`, `support/qna-detail.jsp`, `support/qna-write.jsp` 생성
- [ ] Step 9.8: `support/contact.jsp`, `support/contact-result.jsp` 생성
- [ ] Step 9.9: `privacy/privacy.jsp` 생성
- [ ] Step 9.10: `error/404.jsp`, `error/500.jsp` 생성

### Phase 10: 관리자 JSP

- [ ] Step 10.1: `admin/login.jsp` 생성
- [ ] Step 10.2: `admin/common/admin-header.jsp`, `admin-footer.jsp` 생성
- [ ] Step 10.3: `admin/dashboard.jsp` 생성
- [ ] Step 10.4: `admin/notice/` JSP 생성 (목록, 등록폼, 수정폼)
- [ ] Step 10.5: `admin/qna/` JSP 생성 (목록, 답변폼)
- [ ] Step 10.6: `admin/contact/` JSP 생성 (목록)

### Phase 11: 정적 리소스 (CSS/JS)

- [x] Step 11.1: `resources/css/style.css` 생성 (공통 스타일, 변수, 타이포그래피)
- [x] Step 11.2: `resources/css/responsive.css` 생성 (미디어 쿼리 320/768/1280px)
- [x] Step 11.3: `resources/js/main.js` 생성 (드롭다운 메뉴, 모바일 햄버거, 스크롤)
- [x] Step 11.4: `resources/js/contact.js` 생성 (폼 검증, reCAPTCHA)
- [x] Step 11.5: `resources/js/qna.js` 생성 (비밀글 토글, 글자수 카운터)
- [x] Step 11.6: `resources/js/maps.js` 생성 (구글맵 초기화)
- [x] Step 11.7: `resources/js/gallery.js` 생성 (Swiper.js 슬라이더)

### Phase 12: DB 스크립트

- [x] Step 12.1: `sql/schema.sql` 생성 (테이블 생성: notice, qna, contact, admin)
- [x] Step 12.2: `sql/initial-data.sql` 생성 (관리자 계정 초기 데이터)

### Phase 13: 테스트

- [ ] Step 13.1: `ValidationUtilTest.java` 생성 (단위 테스트) - SKIP (선택사항)
- [ ] Step 13.2: `ContactServiceTest.java` 생성 (단위 테스트) - SKIP (선택사항)
- [ ] Step 13.3: `NoticeServiceTest.java` 생성 (단위 테스트) - SKIP (선택사항)

### Phase 14: 문서

- [x] Step 14.1: `README.md` 생성 (프로젝트 설명, 빌드/배포 방법)
- [x] Step 14.2: `aidlc-docs/construction/homepage/code/code-summary.md` 생성 (생성 파일 목록)

---

## 총 단계 수: 44 steps
## 예상 산출물: ~60개 파일
