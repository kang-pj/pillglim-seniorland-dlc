# 컴포넌트 정의 (Components)

## 프로젝트 구조 개요

**아키텍처**: MPA (Multi Page Application)
**기술 스택**: JSP/Servlet + MariaDB (Cafe24 호스팅)
**패키지 구조**: 레이어별 (controller / service / dao / model)

---

## 사이트맵 (Page Roadmap)

```
필그림시니어랜드
├── 1. 필그림시니어랜드 소개 (/intro)
│   ├── 인사말 (/intro/greeting)
│   ├── 브랜드 소개 (/intro/brand)
│   └── 비전 (/intro/vision)
├── 2. 사업정보 (/business)
│   ├── 사업개요 (/business/overview)
│   └── 사업지 소개 (/business/site)
├── 3. 시그니처 (/signature)
│   ├── 프리미엄 (/signature/premium)
│   ├── 커뮤니티 (/signature/community)
│   ├── 시설 계획 (/signature/plan)
│   ├── 층별 안내 (/signature/floor)
│   ├── 주변 시설 (/signature/nearby)
│   └── 편의시설 (/signature/amenity)
├── 4. 주거공간 소개 (/residence)
│   ├── 타입별 위치도 (/residence/typemap)
│   └── 평면소개 (/residence/floorplan)
└── 5. 고객센터 (/support)
    ├── 공지사항 (/support/notice)
    ├── 온라인 문의 (/support/contact)
    └── Q&A (/support/qna)
```

---

## 프론트엔드 컴포넌트

### FC-01: 공통 레이아웃 (Common Layout)
- **위치**: `/WEB-INF/jsp/common/`
- **책임**:
  - 공통 헤더 (로고, 4단계 드롭다운 네비게이션 메뉴)
  - 공통 푸터 (연락처, 저작권, 개인정보처리방침 링크)
  - 공통 CSS/JS 로드
- **파일**: `header.jsp`, `footer.jsp`, `head.jsp`

### FC-02: 홈 페이지 (Home)
- **위치**: `/WEB-INF/jsp/home/`
- **책임**:
  - Hero 섹션 (브랜드 메시지, CTA 버튼)
  - 주요 메뉴 요약 카드 (4개 섹션 진입점)
  - 최신 공지사항 미리보기 (최근 3건)
- **파일**: `index.jsp`

### FC-03: 필그림시니어랜드 소개 (Intro)
- **위치**: `/WEB-INF/jsp/intro/`
- **책임**: 회사 소개 관련 3개 하위 페이지
- **파일**:
  - `greeting.jsp` - 인사말
  - `brand.jsp` - 브랜드 소개
  - `vision.jsp` - 비전

### FC-04: 사업정보 (Business)
- **위치**: `/WEB-INF/jsp/business/`
- **책임**: 사업 관련 2개 하위 페이지
- **파일**:
  - `overview.jsp` - 사업개요
  - `site.jsp` - 사업지 소개

### FC-05: 시그니처 (Signature)
- **위치**: `/WEB-INF/jsp/signature/`
- **책임**: 시설 및 커뮤니티 관련 6개 하위 페이지
- **파일**:
  - `premium.jsp` - 프리미엄
  - `community.jsp` - 커뮤니티
  - `plan.jsp` - 시설 계획
  - `floor.jsp` - 층별 안내
  - `nearby.jsp` - 주변 시설
  - `amenity.jsp` - 편의시설

### FC-06: 주거공간 소개 (Residence)
- **위치**: `/WEB-INF/jsp/residence/`
- **책임**: 주거 타입 및 평면도 2개 하위 페이지
- **파일**:
  - `typemap.jsp` - 타입별 위치도
  - `floorplan.jsp` - 평면소개

### FC-07: 고객센터 (Support)
- **위치**: `/WEB-INF/jsp/support/`
- **책임**: 고객 지원 3개 하위 페이지
- **파일**:
  - `notice-list.jsp` - 공지사항 목록
  - `notice-detail.jsp` - 공지사항 상세 (개별 JSP)
  - `contact.jsp` - 온라인 문의 폼
  - `contact-result.jsp` - 문의 제출 결과
  - `qna-list.jsp` - Q&A 목록
  - `qna-detail.jsp` - Q&A 상세

### FC-08: 개인정보처리방침 (Privacy)
- **위치**: `/WEB-INF/jsp/privacy/`
- **파일**: `privacy.jsp`

---

## 백엔드 컴포넌트 (Java)

### BC-01: Controller 레이어
- **패키지**: `com.pilgrimseniorland.controller`
- **책임**: HTTP 요청 라우팅, 요청/응답 처리
- **주요 클래스**:
  - `HomeController` - 홈 페이지 (`/`)
  - `PageController` - 정적 콘텐츠 페이지 라우팅 (intro, business, signature, residence 하위 페이지)
  - `SupportController` - 고객센터 (공지사항 DB 조회, Q&A 조회)
  - `ContactController` - 온라인 문의 폼 처리 (POST)

> **URL 정책**: 모든 JSP는 `/WEB-INF/` 하위에 위치하여 외부 직접 접근 차단.
> 모든 페이지는 반드시 Servlet을 통해 forward되므로 URL에 `.jsp`가 노출되지 않습니다.

### BC-02: Service 레이어
- **패키지**: `com.pilgrimseniorland.service`
- **주요 클래스**:
  - `NoticeService` - 공지사항 조회 로직
  - `QnaService` - Q&A 조회 로직
  - `ContactService` - 문의 저장 + 이메일 발송 로직
  - `RecaptchaService` - Google reCAPTCHA v3 검증

### BC-03: DAO 레이어
- **패키지**: `com.pilgrimseniorland.dao`
- **주요 클래스**:
  - `NoticeDao` - 공지사항 DB 조회
  - `QnaDao` - Q&A DB 조회
  - `ContactDao` - 문의 내용 DB 저장

### BC-04: Model 레이어
- **패키지**: `com.pilgrimseniorland.model`
- **주요 클래스**:
  - `NoticeVO` - 공지사항 데이터 객체
  - `QnaVO` - Q&A 데이터 객체
  - `ContactVO` - 문의 데이터 객체

### BC-05: Utility
- **패키지**: `com.pilgrimseniorland.util`
- **주요 클래스**:
  - `ValidationUtil` - 입력값 검증 (XSS, SQL Injection 방지)
  - `EmailUtil` - JavaMail 이메일 발송
  - `DBConnectionPool` - DB 커넥션 풀 관리

---

## 정적 리소스 컴포넌트

### SR-01: CSS
- **위치**: `/resources/css/`
- `style.css` - 공통 스타일
- `responsive.css` - 반응형 미디어 쿼리
- `pages/` - 페이지별 스타일

### SR-02: JavaScript
- **위치**: `/resources/js/`
- `main.js` - 공통 스크립트 (드롭다운 네비게이션, 스크롤 등)
- `contact.js` - 문의 폼 클라이언트 검증 + reCAPTCHA
- `gallery.js` - 시설 이미지 슬라이더 (시그니처 섹션)
- `floorplan.js` - 평면도 인터랙션 (주거공간 소개)

### SR-03: 이미지
- **위치**: `/resources/images/`
- `logo/` - 회사 로고
- `intro/` - 소개 관련 이미지
- `signature/` - 시설 사진
- `residence/` - 평면도 이미지
- `hero/` - 히어로 배경 이미지
