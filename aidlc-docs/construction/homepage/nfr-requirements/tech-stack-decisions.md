# 기술 스택 결정 (Tech Stack Decisions)

## 확정된 기술 스택

### 호스팅 환경 (고정)
| 항목 | 결정 | 근거 |
|------|------|------|
| 호스팅 | Cafe24 JSP 호스팅 | 고객 결정 사항 |
| WAS | Apache Tomcat 10.0.x | Cafe24 권장 버전 |
| JDK | JDK 11 | Cafe24 권장 버전 |
| Servlet/JSP | Servlet 5.0 / JSP 3.0 (Jakarta EE) | Tomcat 10 기본 |
| DB | MariaDB 10.x (UTF-8) | Cafe24 제공 |

---

### 백엔드
| 항목 | 결정 | 근거 |
|------|------|------|
| 언어 | Java 11 | JDK 11 환경 |
| 웹 프레임워크 | Servlet/JSP (순수) | 프레임워크 없이 경량 구성 |
| 빌드 도구 | Maven | 표준 Java 빌드 도구 |
| DB 접근 | JDBC + PreparedStatement | 외부 ORM 없이 직접 사용 |
| 커넥션 풀 | DBCP2 (Apache Commons) | Tomcat 환경 표준 |
| 비밀번호 해시 | BCrypt (jBCrypt 라이브러리) | 관리자 비밀번호 보안 |
| 이메일 발송 | JavaMail API (jakarta.mail) | Jakarta EE 표준 |
| JSON 처리 | Gson 또는 org.json | reCAPTCHA API 응답 파싱 |
| 로깅 | SLF4J + Logback | 표준 Java 로깅 |

---

### 프론트엔드
| 항목 | 결정 | 근거 |
|------|------|------|
| HTML/CSS/JS | Vanilla (순수) | 빌드 도구 없이 직접 배포 |
| CSS 방법론 | BEM 네이밍 | 유지보수성 |
| 반응형 | CSS Flexbox + Grid | 모던 레이아웃 |
| 이미지 슬라이더 | Swiper.js (CDN) | 경량, 모바일 친화적 |
| 지도 | Google Maps JavaScript API | 고객 결정 사항 |
| 스팸 방지 | Google reCAPTCHA v3 | 비가시적, UX 친화적 |

---

### 설정 관리
| 항목 | 파일 | 내용 |
|------|------|------|
| DB 접속 정보 | `application.properties` | host, port, db, user, password |
| 이메일 설정 | `application.properties` | SMTP host, port, 수신자 이메일 |
| reCAPTCHA 키 | `application.properties` | site key, secret key |
| 구글맵 API 키 | `application.properties` | API key |
| 관리자 세션 | `web.xml` | session-timeout: 30분 |

---

### pom.xml 주요 의존성
```xml
<!-- Jakarta EE (Tomcat 10) -->
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>5.0.0</version>
    <scope>provided</scope>
</dependency>

<!-- MariaDB JDBC -->
<dependency>
    <groupId>org.mariadb.jdbc</groupId>
    <artifactId>mariadb-java-client</artifactId>
    <version>3.3.x</version>
</dependency>

<!-- DBCP2 커넥션 풀 -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-dbcp2</artifactId>
    <version>2.12.x</version>
</dependency>

<!-- BCrypt -->
<dependency>
    <groupId>org.mindrot</groupId>
    <artifactId>jbcrypt</artifactId>
    <version>0.4</version>
</dependency>

<!-- JavaMail -->
<dependency>
    <groupId>com.sun.mail</groupId>
    <artifactId>jakarta.mail</artifactId>
    <version>2.0.1</version>
</dependency>

<!-- Gson (reCAPTCHA 응답 파싱) -->
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>2.10.x</version>
</dependency>

<!-- SLF4J + Logback -->
<dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
    <version>1.4.x</version>
</dependency>

<!-- JUnit 5 (테스트) -->
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter</artifactId>
    <version>5.10.x</version>
    <scope>test</scope>
</dependency>
```
