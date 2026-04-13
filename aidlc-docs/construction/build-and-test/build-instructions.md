# 빌드 지침서 - 필그림시니어랜드 홈페이지

## 1. 사전 요구사항

### 필수 소프트웨어
- **JDK**: 11 이상
- **Maven**: 3.6 이상
- **MariaDB**: 10.x
- **Git**: 최신 버전 (선택)

### 환경 변수 확인
```bash
# Java 버전 확인
java -version

# Maven 버전 확인
mvn -version

# MariaDB 버전 확인
mysql --version
```

## 2. 데이터베이스 설정

### 2.1 데이터베이스 생성
```sql
CREATE DATABASE IF NOT EXISTS pilgrim_seniorland 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;
```

### 2.2 스키마 생성
```bash
mysql -u [username] -p pilgrim_seniorland < sql/schema.sql
```

### 2.3 초기 데이터 입력
```bash
mysql -u [username] -p pilgrim_seniorland < sql/initial-data.sql
```

### 2.4 데이터베이스 연결 확인
```sql
USE pilgrim_seniorland;
SHOW TABLES;
SELECT * FROM admin;
```

## 3. 애플리케이션 설정

### 3.1 설정 파일 수정
`src/main/resources/application.properties` 파일을 환경에 맞게 수정:

```properties
# 데이터베이스 설정
db.url=jdbc:mariadb://localhost:3306/pilgrim_seniorland?useUnicode=true&characterEncoding=utf8mb4
db.username=your_db_username
db.password=your_db_password
db.driver=org.mariadb.jdbc.Driver

# 커넥션 풀 설정
db.pool.initialSize=5
db.pool.maxTotal=20
db.pool.maxIdle=10
db.pool.minIdle=5

# 이메일 설정 (Gmail SMTP)
mail.smtp.host=smtp.gmail.com
mail.smtp.port=587
mail.smtp.auth=true
mail.smtp.starttls.enable=true
mail.smtp.username=your_email@gmail.com
mail.smtp.password=your_app_password
mail.from=noreply@pilgrimseniorland.com
mail.to=contact@pilgrimseniorland.com

# Google reCAPTCHA v3
recaptcha.site.key=your_recaptcha_site_key
recaptcha.secret.key=your_recaptcha_secret_key
recaptcha.verify.url=https://www.google.com/recaptcha/api/siteverify

# Google Maps API
google.maps.api.key=your_google_maps_api_key

# 세션 설정
session.timeout=1800
```

### 3.2 외부 API 키 발급

#### Google reCAPTCHA v3
1. https://www.google.com/recaptcha/admin 접속
2. 새 사이트 등록 (v3 선택)
3. Site Key와 Secret Key 복사
4. application.properties에 입력

#### Google Maps API
1. https://console.cloud.google.com 접속
2. 프로젝트 생성
3. Maps JavaScript API 활성화
4. API 키 생성
5. application.properties에 입력

#### Gmail SMTP (앱 비밀번호)
1. Google 계정 관리 → 보안
2. 2단계 인증 활성화
3. 앱 비밀번호 생성
4. application.properties에 입력

## 4. 빌드

### 4.1 의존성 다운로드
```bash
mvn clean install
```

### 4.2 컴파일
```bash
mvn compile
```

### 4.3 WAR 파일 생성
```bash
mvn clean package
```

빌드 성공 시 `target/pilgrim-seniorland.war` 파일 생성

### 4.4 빌드 검증
```bash
# WAR 파일 확인
ls -lh target/*.war

# WAR 파일 내용 확인
jar -tf target/pilgrim-seniorland.war | head -20
```

## 5. 로컬 실행

### 5.1 Maven Tomcat 플러그인 사용
```bash
mvn tomcat7:run
```

### 5.2 접속 확인
브라우저에서 다음 URL 접속:
- 홈페이지: http://localhost:8080/
- 관리자: http://localhost:8080/admin/login

### 5.3 기본 관리자 계정
- **아이디**: admin
- **비밀번호**: admin1234

## 6. 배포 (Cafe24 호스팅)

### 6.1 WAR 파일 업로드
1. Cafe24 호스팅 관리자 페이지 로그인
2. Tomcat 관리 메뉴 접속
3. WAR 파일 업로드
4. 배포 경로 설정

### 6.2 데이터베이스 설정
1. Cafe24 DB 관리 페이지에서 MariaDB 생성
2. 호스트, 포트, 사용자명, 비밀번호 확인
3. application.properties 수정
4. 스키마 및 초기 데이터 실행

### 6.3 Tomcat 재시작
```bash
# Cafe24 관리자 페이지에서 Tomcat 재시작 버튼 클릭
```

### 6.4 배포 확인
- 실제 도메인으로 접속 확인
- 관리자 로그인 테스트
- 주요 기능 동작 확인

## 7. 트러블슈팅

### 7.1 빌드 실패
```bash
# Maven 캐시 삭제 후 재빌드
mvn clean
rm -rf ~/.m2/repository
mvn clean install
```

### 7.2 데이터베이스 연결 실패
- DB 서버 실행 상태 확인
- 방화벽 설정 확인
- 연결 정보 (호스트, 포트, 사용자명, 비밀번호) 재확인

### 7.3 인코딩 문제
- application.properties에서 UTF-8 설정 확인
- DB 테이블 charset 확인: `SHOW CREATE TABLE notice;`

### 7.4 포트 충돌
```bash
# 8080 포트 사용 중인 프로세스 확인
netstat -ano | findstr :8080

# 프로세스 종료 (Windows)
taskkill /PID [PID번호] /F
```

## 8. 빌드 최적화

### 8.1 프로덕션 빌드
```bash
mvn clean package -Dmaven.test.skip=true -P production
```

### 8.2 빌드 시간 단축
```bash
# 병렬 빌드
mvn clean package -T 4

# 오프라인 모드 (의존성 다운로드 스킵)
mvn clean package -o
```

## 9. 체크리스트

### 빌드 전
- [ ] JDK 11 이상 설치 확인
- [ ] Maven 3.6 이상 설치 확인
- [ ] MariaDB 실행 중
- [ ] 데이터베이스 생성 완료
- [ ] application.properties 설정 완료
- [ ] API 키 발급 완료

### 빌드 후
- [ ] WAR 파일 생성 확인
- [ ] 로컬 실행 테스트
- [ ] 관리자 로그인 테스트
- [ ] 주요 페이지 접속 확인
- [ ] 데이터베이스 연결 확인

### 배포 전
- [ ] 프로덕션 DB 설정 완료
- [ ] HTTPS 설정 완료
- [ ] 보안 설정 검토
- [ ] 백업 계획 수립
- [ ] 롤백 계획 수립

## 10. 참고 자료

- Maven 공식 문서: https://maven.apache.org/
- Tomcat 공식 문서: https://tomcat.apache.org/
- MariaDB 공식 문서: https://mariadb.org/documentation/
- Cafe24 호스팅 가이드: https://www.cafe24.com/
