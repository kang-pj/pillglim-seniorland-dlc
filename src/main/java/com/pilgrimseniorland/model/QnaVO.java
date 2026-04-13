package com.pilgrimseniorland.model;

import java.time.LocalDateTime;

public class QnaVO {
    private int id;
    private String question;
    private String answer;
    private String nickname;
    private boolean answered;
    private boolean secret;
    private String password;   // BCrypt 해시 (비밀글용)
    private LocalDateTime createdAt;
    private LocalDateTime answeredAt;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }
    public boolean isAnswered() { return answered; }
    public void setAnswered(boolean answered) { this.answered = answered; }
    public boolean isSecret() { return secret; }
    public void setSecret(boolean secret) { this.secret = secret; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public LocalDateTime getAnsweredAt() { return answeredAt; }
    public void setAnsweredAt(LocalDateTime answeredAt) { this.answeredAt = answeredAt; }
}
