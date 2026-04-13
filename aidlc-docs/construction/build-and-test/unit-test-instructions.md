# 단위 테스트 지침서

## 1. 테스트 개요

### 테스트 범위
- 유틸리티 클래스 (ValidationUtil)
- 서비스 레이어 (ContactService, NoticeService, QnaService)
- DAO 레이어 (기본 CRUD 동작)

### 테스트 프레임워크
- JUnit 5
- Mockito (모킹)
- AssertJ (assertion)

## 2. 테스트 실행

### 2.1 전체 테스트 실행
```bash
mvn test
```

### 2.2 특정 테스트 클래스 실행
```bash
mvn test -Dtest=ValidationUtilTest
```

### 2.3 테스트 리포트 생성
```bash
mvn surefire-report:report
```

리포트 위치: `target/site/surefire-report.html`

## 3. 주요 테스트 케이스

### 3.1 ValidationUtil 테스트
- XSS 공격 패턴 sanitization
- 전화번호 형식 검증
- 이메일 형식 검증
- 문자열 길이 검증
- Null/Empty 처리

### 3.2 ContactService 테스트
- 정상적인 문의 제출
- 필수 필드 누락 시 예외 처리
- 이메일 발송 실패 시 처리
- reCAPTCHA 검증 실패 시 처리

### 3.3 NoticeService 테스트
- 공지사항 목록 조회 (페이지네이션)
- 공지사항 상세 조회
- 조회수 증가
- 고정 공지사항 우선 정렬

### 3.4 QnaService 테스트
- Q&A 등록
- 비밀글 비밀번호 검증
- 답변 등록
- 상태 변경 (PENDING → ANSWERED)

## 4. 테스트 작성 가이드

### 4.1 테스트 명명 규칙
```java
@Test
void 메서드명_테스트조건_예상결과() {
    // Given
    // When
    // Then
}
```

### 4.2 Given-When-Then 패턴
```java
@Test
void sanitize_XSS공격패턴_제거됨() {
    // Given
    String input = "<script>alert('XSS')</script>";
    
    // When
    String result = ValidationUtil.sanitize(input);
    
    // Then
    assertThat(result).doesNotContain("<script>");
}
```

## 5. 테스트 커버리지

### 5.1 커버리지 측정
```bash
mvn clean test jacoco:report
```

리포트 위치: `target/site/jacoco/index.html`

### 5.2 목표 커버리지
- 유틸리티: 90% 이상
- 서비스: 80% 이상
- DAO: 70% 이상

## 6. 테스트 데이터

### 6.1 테스트 DB 설정
```properties
# src/test/resources/application-test.properties
db.url=jdbc:h2:mem:testdb
db.username=sa
db.password=
db.driver=org.h2.Driver
```

### 6.2 테스트 데이터 초기화
```sql
-- src/test/resources/test-data.sql
INSERT INTO notice (title, content, author) VALUES
('테스트 공지', '테스트 내용', '관리자');
```

## 7. 모킹 (Mocking)

### 7.1 DAO 모킹 예시
```java
@Mock
private NoticeDao noticeDao;

@InjectMocks
private NoticeService noticeService;

@Test
void getNoticeList_정상조회_성공() {
    // Given
    List<NoticeVO> mockList = Arrays.asList(new NoticeVO());
    when(noticeDao.findAll(anyInt(), anyInt())).thenReturn(mockList);
    
    // When
    List<NoticeVO> result = noticeService.getNoticeList(1, 10);
    
    // Then
    assertThat(result).isNotEmpty();
    verify(noticeDao).findAll(anyInt(), anyInt());
}
```

## 8. 통합 테스트

### 8.1 실행
```bash
mvn verify
```

### 8.2 범위
- Controller → Service → DAO 전체 흐름
- 데이터베이스 실제 연결
- 트랜잭션 처리

## 9. 테스트 체크리스트

### 단위 테스트
- [ ] ValidationUtil 테스트 (XSS, 전화번호, 이메일)
- [ ] ContactService 테스트 (문의 제출, 검증)
- [ ] NoticeService 테스트 (CRUD, 페이지네이션)
- [ ] QnaService 테스트 (등록, 답변, 비밀글)
- [ ] AdminService 테스트 (로그인, 인증)

### 통합 테스트
- [ ] 공지사항 전체 흐름
- [ ] Q&A 전체 흐름
- [ ] 문의하기 전체 흐름
- [ ] 관리자 로그인 흐름

### 성능 테스트
- [ ] 대량 데이터 조회 (1000건 이상)
- [ ] 동시 접속 처리
- [ ] 커넥션 풀 효율성

## 10. 참고사항

- 테스트는 독립적으로 실행 가능해야 함
- 테스트 간 의존성 없어야 함
- 테스트 데이터는 각 테스트 후 정리
- 실패 시 명확한 에러 메시지 제공
