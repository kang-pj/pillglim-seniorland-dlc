# Application Design Plan - 필그림시니어랜드 홈페이지

아래 질문에 `[Answer]:` 뒤에 알파벳을 입력해 주세요. 완료 후 "완료"라고 알려주세요.

---

## Question 1: 페이지 구조 방식

홈페이지를 어떤 구조로 구성할까요?

A) Single Page Application (SPA) - 한 페이지에서 섹션 간 스크롤 이동 (모던한 느낌)
B) Multi Page Application (MPA) - 각 섹션이 별도 URL을 가진 독립 페이지
C) 혼합 - 메인은 SPA 스타일, 뉴스/공지사항은 별도 페이지
D) Other (직접 설명해 주세요)

[Answer]: B

---

## Question 2: 문의 폼 데이터 처리 방식

문의 폼 제출 시 데이터를 어떻게 처리할까요?

A) MariaDB에 저장 + 담당자 이메일로 알림 발송
B) MariaDB에 저장만 (이메일 없음)
C) 이메일 발송만 (DB 저장 없음)
D) Other (직접 설명해 주세요)

[Answer]: A

---

## Question 3: 뉴스/공지사항 관리 방식

CMS 없이 정적으로 관리하기로 했는데, 구체적인 방식을 선택해 주세요.

A) JSP 파일로 직접 작성 (각 공지사항이 별도 JSP 파일)
B) 별도 HTML 파일로 관리
C) DB에 저장하고 JSP로 조회 (관리자 페이지 없이 DB 직접 입력)
D) Other (직접 설명해 주세요)

[Answer]: A

---

## Question 4: 프로젝트 패키지 구조

Java 패키지 구조를 어떻게 할까요?

A) 기능별 구조 (com.pilgrimseniorland.web, com.pilgrimseniorland.service, com.pilgrimseniorland.dao)
B) 레이어별 구조 (controller, service, dao, model)
C) Other (직접 설명해 주세요)

[Answer]: B
