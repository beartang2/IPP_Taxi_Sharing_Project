package com.dto;

public class User {
    private int userId;
    private String username;
    private String password;
    private String name;
    private String phone;
    private boolean hasLuggage;

    // 생성자
    public User(int userId, String username, String password, String name, String phone,
                boolean hasLuggage) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.hasLuggage = hasLuggage;
    }

    // 자동 생성 가능

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

   

    @Override //db에 넣기 쉬움
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", hasLuggage=" + hasLuggage +
                '}';
    }
}