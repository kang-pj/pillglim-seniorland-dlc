# 실행 계획 (Execution Plan)

## 상세 분석 요약

### 변경 영향 평가
- **사용자 대면 변경**: Yes - 전체 홈페이지 신규 구축
- **구조적 변경**: Yes - 신규 프로젝트 (Greenfield)
- **데이터 모델 변경**: Yes - 문의 폼 데이터 저장 (MariaDB)
- **API 변경**: Yes - 문의 폼 처리 Servlet 엔드포인트
- **NFR 영향**: Yes - 보안(HTTPS, reCAPTCHA, 보안헤더), 반응형, 성능

### 리스크 평가
- **리스크 수준**: Low-Medium
- **롤백 복잡도**: Easy (정적 파일 위주)
- **테스트 복잡도**: Simple-Moderate (문의 폼 백엔드 처리 포함)

---

## 워크플로우 시각화

```
INCEPTION PHASE
  [DONE] Workspace Detection
  [SKIP] Reverse Engineering     <- Greenfield, 기존 코드 없음
  [DONE] Requirements Analysis
  [SKIP] User Stories            <- 단순 기업 소개 홈페이지, 복잡한 사용자 시나리오 없음
  [DONE] Workflow Planning       <- 현재 단계
  [EXEC] Application Design      <- 새 컴포넌트 구조 정의 필요 (JSP/Servlet 구조)
  [SKIP] Units Generation        <- 단일 웹 애플리케이션, 분해 불필요

CONSTRUCTION PHASE
  [EXEC] Functional Design       <- 문의 폼 비즈니스 로직, DB 스키마 정의 필요
  [EXEC] NFR Requirements        <- 보안, 성능, 반응형 요구사항 존재
  [EXEC] NFR Design              <- 보안 패턴 설계 필요 (reCAPTCHA, 보안헤더, XSS 방지)
  [SKIP] Infrastructure Design   <- Cafe24 JSP 호스팅 환경 고정, 별도 인프라 설계 불필요
  [EXEC] Code Generation         <- 항상 실행
  [EXEC] Build and Test          <- 항상 실행

OPERATIONS PHASE
  [PLACEHOLDER] Operations
```

---

## 실행할 단계 (Phases to Execute)

### 🔵 INCEPTION PHASE
- [x] Workspace Detection - COMPLETED
- [x] Reverse Engineering - SKIPPED (Greenfield)
- [x] Requirements Analysis - COMPLETED
- [x] User Stories - SKIPPED
  - **근거**: 단순 기업 소개 홈페이지로 복잡한 사용자 시나리오 없음. 타겟 사용자(시니어/자녀)는 요구사항에 이미 반영됨.
- [x] Workflow Planning - IN PROGRESS
- [ ] Application Design - EXECUTE
  - **근거**: 신규 JSP/Servlet 프로젝트 구조 정의 필요. 페이지 컴포넌트, Servlet 엔드포인트, 패키지 구조 설계 필요.
- [ ] Units Generation - SKIPPED
  - **근거**: 단일 웹 애플리케이션으로 분해 불필요. 프론트엔드 + 백엔드(문의 폼)가 하나의 단위로 처리 가능.

### 🟢 CONSTRUCTION PHASE
- [ ] Functional Design - EXECUTE
  - **근거**: 문의 폼 처리 로직, MariaDB 스키마, 이메일 발송 로직 등 비즈니스 로직 설계 필요.
- [ ] NFR Requirements - EXECUTE
  - **근거**: 보안(reCAPTCHA, XSS, CSRF, 보안헤더), 성능(이미지 최적화, 로딩 속도), 반응형 요구사항 명확히 존재.
- [ ] NFR Design - EXECUTE
  - **근거**: 보안 패턴 구체적 설계 필요 (입력값 검증 방식, reCAPTCHA 연동, 보안 헤더 설정 방법).
- [ ] Infrastructure Design - SKIPPED
  - **근거**: Cafe24 JSP 호스팅 환경이 고정되어 있어 별도 인프라 설계 불필요. 배포는 FTP/파일 업로드 방식.
- [ ] Code Generation - EXECUTE (항상)
- [ ] Build and Test - EXECUTE (항상)

### 🟡 OPERATIONS PHASE
- [ ] Operations - PLACEHOLDER

---

## 단위 구성 (Units of Work)

단일 단위로 처리:

**Unit 1: 필그림시니어랜드 홈페이지**
- 프론트엔드: HTML/CSS/JS 정적 페이지 (8개 섹션)
- 백엔드: JSP/Servlet 문의 폼 처리
- DB: MariaDB 문의 내용 저장
- 보안: reCAPTCHA, 입력값 검증, 보안 헤더

---

## 예상 타임라인

- **총 실행 단계**: 6단계 (Application Design → Functional Design → NFR Requirements → NFR Design → Code Generation → Build and Test)
- **예상 기간**: 1~2개월 (런칭 목표에 부합)

---

## 성공 기준

- **주요 목표**: 필그림시니어랜드 공식 홈페이지 런칭
- **핵심 산출물**:
  - 8개 섹션 완성된 반응형 홈페이지
  - 문의 폼 정상 작동 (입력 검증 + DB 저장)
  - HTTPS + 보안 설정 완료
  - Cafe24 배포 완료
- **품질 게이트**:
  - 모바일/태블릿/데스크탑 반응형 검증
  - 문의 폼 E2E 테스트 통과
  - 보안 헤더 설정 확인
  - 페이지 로딩 3초 이내
