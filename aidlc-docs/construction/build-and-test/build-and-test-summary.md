# 빌드 및 테스트 요약

## 프로젝트 정보
- **프로젝트명**: 필그림시니어랜드 기업 소개 홈페이지
- **작성일**: 2026-04-13
- **기술 스택**: Java 11, JSP 3.0, Servlet 5.0, MariaDB 10.x, Maven

## 빌드 지침

### 빌드 명령어
```bash
# 전체 빌드
mvn clean package

# 로컬 실행
mvn tomcat7:run

# 테스트 포함 빌드
mvn clean install
```

### 빌드 산출물
- **WAR 파일**: `target/pilgrim-seniorland.war`
- **크기**: 약 15-20MB (의존성 포함)

### 배포 방법
1. WAR 파일 생성
2. Cafe24 호스팅 관리자 페이지 업로드
3. Tomcat 재시작
4. 도메인 접속 확인

## 테스트 지침

### 단위 테스트
- **범위**: 유틸리티, 서비스, DAO
- **실행**: `mvn test`
- **목표 커버리지**: 80% 이상

### 통합 테스트
- **범위**: Controller → Service → DAO → DB
- **실행**: `mvn verify`
- **주요 시나리오**: 공지사항, Q&A, 문의하기, 관리자 인증

### 성능 테스트
- 대량 데이터 조회 (1000건 이상)
- 동시 접속 처리 (10명 이상)
- 커넥션 풀 효율성

## 테스트 체크리스트

### 기능 테스트
- [ ] 홈페이지 접속
- [ ] 공지사항 목록/상세
- [ ] Q&A 작성/조회
- [ ] 문의하기 제출
- [ ] 관리자 로그인
- [ ] 관리자 대시보드
- [ ] 공지사항 관리
- [ ] Q&A 답변
- [ ] 문의 내역 조회

### 보안 테스트
- [ ] XSS 방어
- [ ] SQL Injection 방어
- [ ] CSRF 방어
- [ ] 세션 관리
- [ ] 비밀번호 암호화
- [ ] reCAPTCHA 검증

### 호환성 테스트
- [ ] Chrome
- [ ] Firefox
- [ ] Safari
- [ ] Edge
- [ ] 모바일 (iOS/Android)

## 설정 파일

### application.properties
```properties
# 데이터베이스
db.url=jdbc:mariadb://localhost:3306/pilgrim_seniorland
db.username=your_username
db.password=your_password

# 이메일
mail.smtp.host=smtp.gmail.com
mail.smtp.username=your_email@gmail.com
mail.smtp.password=your_app_password

# reCAPTCHA
recaptcha.site.key=your_site_key
recaptcha.secret.key=your_secret_key

# Google Maps
google.maps.api.key=your_api_key
```

## 기본 관리자 계정
- **아이디**: admin
- **비밀번호**: admin1234

⚠️ 운영 환경에서는 반드시 비밀번호 변경

## 참고 문서
- [빌드 지침서](build-instructions.md)
- [단위 테스트 지침서](unit-test-instructions.md)
- [통합 테스트 지침서](integration-test-instructions.md)
- [README.md](../../../README.md)
