# 통합 테스트 지침서

## 1. 통합 테스트 개요

### 목적
- 여러 컴포넌트 간 상호작용 검증
- 실제 데이터베이스 연동 테스트
- End-to-End 시나리오 검증

### 범위
- Controller → Service → DAO → Database
- 필터 및 인터셉터 동작
- 세션 및 인증 처리
- 외부 API 연동 (이메일, reCAPTCHA)

## 2. 테스트 환경 설정

### 2.1 테스트 데이터베이스
```sql
-- 테스트 전용 DB 생성
CREATE DATABASE pilgrim_seniorland_test 
DEFAULT CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 스키마 적용
mysql -u root -p pilgrim_seniorland_test < sql/schema.sql
```

### 2.2 테스트 설정 파일
```properties
# src/test/resources/application-integration.properties
db.url=jdbc:mariadb://localhost:3306/pilgrim_seniorland_test
db.username=test_user
db.password=test_password

# 테스트용 이메일 (실제 발송 안 함)
mail.smtp.host=localhost
mail.smtp.port=25
mail.test.mode=true

# 테스트용 reCAPTCHA (항상 성공)
recaptcha.test.mode=true
```

## 3. 통합 테스트 시나리오

### 3.1 공지사항 전체 흐름
```
1. 관리자 로그인
2. 공지사항 등록
3. 공지사항 목록 조회 (공개 페이지)
4. 공지사항 상세 조회
5. 조회수 증가 확인
6. 공지사항 수정
7. 공지사항 삭제
```

**테스트 명령**:
```bash
# 수동 테스트
1. http://localhost:8080/admin/login 접속
2. admin / admin1234 로그인
3. 공지사항 등록 테스트
4. http://localhost:8080/support/notice 에서 확인
```

### 3.2 Q&A 전체 흐름
```
1. Q&A 작성 (공개 페이지)
2. reCAPTCHA 검증
3. 데이터베이스 저장 확인
4. 관리자 페이지에서 Q&A 목록 확인
5. 답변 등록
6. 상태 변경 확인 (PENDING → ANSWERED)
7. 공개 페이지에서 답변 확인
```

**테스트 명령**:
```bash
1. http://localhost:8080/support/qna/write 접속
2. Q&A 작성 및 제출
3. 관리자 페이지에서 답변 등록
4. http://localhost:8080/support/qna 에서 확인
```

### 3.3 문의하기 전체 흐름
```
1. 문의 폼 작성
2. 입력값 검증 (클라이언트)
3. reCAPTCHA 검증
4. 서버 측 검증
5. 데이터베이스 저장
6. 이메일 발송
7. 결과 페이지 표시
```

**테스트 명령**:
```bash
1. http://localhost:8080/support/contact 접속
2. 문의 폼 작성 및 제출
3. 이메일 수신 확인
4. 관리자 페이지에서 문의 내역 확인
```

### 3.4 관리자 인증 흐름
```
1. 로그인 페이지 접속
2. 잘못된 비밀번호 입력 → 실패
3. 올바른 비밀번호 입력 → 성공
4. 세션 생성 확인
5. 관리자 페이지 접근 (인증 필터 통과)
6. 로그아웃
7. 관리자 페이지 접근 → 로그인 페이지로 리다이렉트
```

**테스트 명령**:
```bash
1. http://localhost:8080/admin/login 접속
2. 잘못된 비밀번호로 로그인 시도
3. 올바른 비밀번호로 로그인
4. http://localhost:8080/admin/dashboard 접속 확인
5. 로그아웃 후 다시 접근 시도
```

## 4. 보안 테스트

### 4.1 XSS 공격 방어
```bash
# 테스트 입력값
<script>alert('XSS')</script>
<img src=x onerror=alert('XSS')>

# 예상 결과: sanitize 되어 저장
```

### 4.2 SQL Injection 방어
```bash
# 테스트 입력값
' OR '1'='1
'; DROP TABLE notice; --

# 예상 결과: PreparedStatement로 안전하게 처리
```

### 4.3 CSRF 방어
```bash
# 세션 없이 POST 요청 시도
curl -X POST http://localhost:8080/support/contact

# 예상 결과: 403 Forbidden 또는 로그인 페이지로 리다이렉트
```

## 5. 성능 테스트

### 5.1 대량 데이터 조회
```sql
-- 테스트 데이터 생성 (1000건)
INSERT INTO notice (title, content, author)
SELECT 
    CONCAT('테스트 공지 ', n),
    CONCAT('테스트 내용 ', n),
    '관리자'
FROM (
    SELECT @row := @row + 1 AS n
    FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1,
         (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t2,
         (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t3,
         (SELECT @row := 0) t4
    LIMIT 1000
) numbers;
```

**테스트**:
```bash
# 페이지네이션 성능 측정
curl -w "@curl-format.txt" -o /dev/null -s http://localhost:8080/support/notice?page=1
```

### 5.2 동시 접속 테스트
```bash
# Apache Bench 사용
ab -n 1000 -c 10 http://localhost:8080/

# 예상 결과: 초당 처리량, 응답 시간 확인
```

### 5.3 커넥션 풀 테스트
```bash
# 동시 다발적 DB 쿼리
for i in {1..50}; do
    curl http://localhost:8080/support/notice &
done
wait

# 예상 결과: 커넥션 풀에서 효율적으로 처리
```

## 6. 브라우저 호환성 테스트

### 6.1 테스트 대상 브라우저
- Chrome (최신 버전)
- Firefox (최신 버전)
- Safari (최신 버전)
- Edge (최신 버전)
- 모바일 Safari (iOS)
- 모바일 Chrome (Android)

### 6.2 테스트 항목
- [ ] 레이아웃 정상 표시
- [ ] 드롭다운 메뉴 동작
- [ ] 폼 제출 및 검증
- [ ] JavaScript 기능 동작
- [ ] 반응형 디자인 (모바일/태블릿)

## 7. 접근성 테스트

### 7.1 키보드 네비게이션
```
Tab: 다음 요소로 이동
Shift+Tab: 이전 요소로 이동
Enter: 링크/버튼 활성화
Esc: 모달 닫기
```

### 7.2 스크린 리더 테스트
- NVDA (Windows)
- JAWS (Windows)
- VoiceOver (macOS/iOS)
- TalkBack (Android)

### 7.3 색상 대비 테스트
```bash
# WCAG 2.1 AA 기준 확인
# 텍스트: 4.5:1 이상
# 큰 텍스트: 3:1 이상
```

## 8. 모바일 테스트

### 8.1 반응형 디자인
```
- 320px (모바일 세로)
- 375px (iPhone)
- 768px (태블릿 세로)
- 1024px (태블릿 가로)
- 1280px (데스크톱)
```

### 8.2 터치 인터랙션
- [ ] 드롭다운 메뉴 터치
- [ ] 폼 입력
- [ ] 버튼 클릭
- [ ] 스크롤

## 9. 외부 API 테스트

### 9.1 Google reCAPTCHA
```bash
# 성공 케이스
curl -X POST https://www.google.com/recaptcha/api/siteverify \
  -d "secret=YOUR_SECRET_KEY" \
  -d "response=VALID_TOKEN"

# 실패 케이스
curl -X POST https://www.google.com/recaptcha/api/siteverify \
  -d "secret=YOUR_SECRET_KEY" \
  -d "response=INVALID_TOKEN"
```

### 9.2 Google Maps API
```javascript
// 브라우저 콘솔에서 테스트
console.log(typeof google !== 'undefined' && google.maps);
// 예상 결과: true
```

### 9.3 이메일 발송 (SMTP)
```bash
# 테스트 이메일 발송
# 관리자 페이지에서 테스트 이메일 발송 기능 사용
```

## 10. 통합 테스트 체크리스트

### 기능 테스트
- [ ] 공지사항 전체 흐름
- [ ] Q&A 전체 흐름
- [ ] 문의하기 전체 흐름
- [ ] 관리자 인증 흐름
- [ ] 페이지네이션
- [ ] 검색 기능

### 보안 테스트
- [ ] XSS 방어
- [ ] SQL Injection 방어
- [ ] CSRF 방어
- [ ] 세션 관리
- [ ] 비밀번호 암호화

### 성능 테스트
- [ ] 대량 데이터 조회
- [ ] 동시 접속 처리
- [ ] 커넥션 풀 효율성
- [ ] 페이지 로딩 속도

### 호환성 테스트
- [ ] 브라우저 호환성
- [ ] 모바일 반응형
- [ ] 접근성 (WCAG 2.1 AA)

### 외부 API 테스트
- [ ] reCAPTCHA 검증
- [ ] Google Maps 로드
- [ ] 이메일 발송

## 11. 테스트 결과 보고

### 11.1 보고서 형식
```markdown
# 통합 테스트 결과

## 테스트 일시
2026-04-13

## 테스트 환경
- OS: Windows 10
- Browser: Chrome 120
- DB: MariaDB 10.6

## 테스트 결과
- 총 테스트: 50개
- 성공: 48개
- 실패: 2개
- 성공률: 96%

## 실패 항목
1. 이메일 발송 실패 (SMTP 설정 오류)
2. 모바일 Safari 레이아웃 깨짐

## 조치 사항
1. SMTP 설정 재확인 필요
2. Safari CSS 호환성 수정 필요
```

## 12. 참고사항

- 통합 테스트는 실제 환경과 유사하게 설정
- 테스트 데이터는 테스트 후 정리
- 외부 API는 테스트 모드 사용 권장
- 성능 테스트는 프로덕션 환경에서 재검증
