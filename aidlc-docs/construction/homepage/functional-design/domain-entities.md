# 도메인 엔티티 (Domain Entities)

## DB 스키마

### 1. notice (공지사항)

```sql
CREATE TABLE notice (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(200)  NOT NULL,
    content     TEXT          NOT NULL,
    author      VARCHAR(50)   NOT NULL DEFAULT '관리자',
    is_published TINYINT(1)   NOT NULL DEFAULT 1,
    created_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- 작성 권한: 관리자만 (관리자 페이지에서 등록)
- 조회 권한: 모든 방문자

---

### 2. qna (Q&A)

```sql
CREATE TABLE qna (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    question    TEXT          NOT NULL,
    answer      TEXT          NULL,
    nickname    VARCHAR(50)   NOT NULL DEFAULT '익명',
    is_answered TINYINT(1)   NOT NULL DEFAULT 0,
    is_secret   TINYINT(1)   NOT NULL DEFAULT 0,
    password    VARCHAR(100)  NULL,          -- 비밀글 비밀번호 (선택)
    created_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    answered_at DATETIME      NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- 질문 작성: 익명 고객 (닉네임 선택 입력, 비밀글 선택)
- 답변 작성: 관리자만
- 조회: 일반 글은 모두, 비밀글은 작성자(비밀번호 확인) + 관리자

---

### 3. contact (온라인 문의)

```sql
CREATE TABLE contact (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(50)   NOT NULL,
    phone        VARCHAR(20)   NOT NULL,
    message      TEXT          NOT NULL,
    ip_address   VARCHAR(45)   NOT NULL,
    submitted_at DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- 작성 권한: 모든 방문자 (reCAPTCHA 통과 후)
- 조회 권한: 관리자만

---

### 4. admin (관리자)

```sql
CREATE TABLE admin (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    username     VARCHAR(50)   NOT NULL UNIQUE,
    password     VARCHAR(255)  NOT NULL,   -- BCrypt 해시
    created_at   DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

- 관리자 계정은 초기 SQL로 1개 생성
- 비밀번호는 BCrypt 해시 저장

---

## 엔티티 관계

```
admin (1) ──── writes ────> notice (N)
admin (1) ──── answers ──> qna (N)
visitor  ──── writes ────> qna (N)
visitor  ──── submits ───> contact (N)
```
