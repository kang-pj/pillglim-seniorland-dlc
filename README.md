# 필그림시니어랜드 홈페이지

필그림시니어랜드 공식 기업 소개 홈페이지입니다.

## 프로젝트 개요

- **프로젝트명**: 필그림시니어랜드 기업 소개 홈페이지
- **기술 스택**: Java 11, JSP 3.0, Servlet 5.0, MariaDB 10.x, Maven
- **호스팅**: Cafe24 JSP 호스팅 (Tomcat 10.0.x)

## 주요 기능

### 공개 페이지
- 홈페이지 (Hero 섹션, 메뉴 카드, 최신 공지사항)
- 회사 소개 (인사말, 브랜드, 비전)
- 사업 소개 (사업 개요, 사업장 위치)
- 시그니처 서비스 (프리미엄 서비스, 커뮤니티, 평면도 등)
- 입주 안내 (타입별 평면도)
- 고객 지원 (공지사항, Q&A, 문의하기)
- 개인정보처리방침

### 관리자 페이지
- 관리자 로그인/로그아웃
- 대시보드 (통계)
- 공지사항 관리 (등록, 수정, 삭제)
- Q&A 관리 (답변)
- 문의 내역 조회

## 디렉토리 구조

```
pilgrim-seniorland/
├── src/main/
│   ├── java/com/pilgrimseniorland/
│   │   ├── controller/     # 컨트롤러
│   │   ├── service/        # 서비스 레이어
│   │   ├── dao/            # DAO 레이어
│   │   ├── model/          # VO 모델
│   │   ├── filter/         # 필터
│   │   ├── listener/       # 리스너
│   │   └── util/           # 유틸리티
│   ├── resources/
│   │   └── application.properties
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── jsp/        # JSP 파일
│       │   └── web.xml
│       └── resources/
│           ├── css/        # 스타일시트
│           ├── js/         # JavaScript
│           └── images/     # 이미지
├── sql/                    # DB 스크립트
├── pom.xml
└── README.md
```

## 빌드 및 실행

### 사전 요구사항
- JDK 11 이상
- Maven 3.6 이상
- MariaDB 10.x

### 데이터베이스 설정

1. MariaDB 데이터베이스 생성:
```sql
CREATE DATABASE pilgrim_seniorland DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. 스키마 생성:
```bash
mysql -u [username] -p pilgrim_seniorland < sql/schema.sql
```

3. 초기 데이터 입력:
```bash
mysql -u [username] -p pilgrim_seniorland < sql/initial-data.sql
```

### 애플리케이션 설정

`src/main/resources/application.properties` 파일을 수정하여 환경에 맞게 설정:

```properties
# 데이터베이스
db.url=jdbc:mariadb://localhost:3306/pilgrim_seniorland
db.username=your_username
db.password=your_password

# 이메일 (SMTP)
mail.smtp.host=smtp.gmail.com
mail.smtp.port=587
mail.smtp.username=your_email@gmail.com
mail.smtp.password=your_app_password
mail.from=noreply@pilgrimseniorland.com

# reCAPTCHA
recaptcha.site.key=your_site_key
recaptcha.secret.key=your_secret_key

# 구글맵
google.maps.api.key=your_api_key
```

### 빌드

```bash
mvn clean package
```

### 로컬 실행

```bash
mvn tomcat7:run
```

브라우저에서 `http://localhost:8080` 접속

## 배포 (Cafe24)

1. WAR 파일 생성:
```bash
mvn clean package
```

2. `target/pilgrim-seniorland.war` 파일을 Cafe24 호스팅 관리자 페이지에서 업로드

3. Tomcat 재시작

## 기본 관리자 계정

- **아이디**: admin
- **비밀번호**: admin1234

⚠️ 운영 환경에서는 반드시 비밀번호를 변경하세요.

## 보안 기능

- XSS 방지 (입력값 sanitization)
- CSRF 방지 (세션 토큰)
- SQL Injection 방지 (PreparedStatement)
- 비밀번호 암호화 (BCrypt)
- reCAPTCHA v3 (봇 방지)
- 보안 헤더 (CSP, X-Frame-Options 등)
- HTTPS 강제 리다이렉트

## 라이선스

Copyright © 2026 필그림시니어랜드. All rights reserved.
