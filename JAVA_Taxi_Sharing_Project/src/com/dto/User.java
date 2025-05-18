package com.dto;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID=-4274700572038677000L;	//전송에 편리함
	private int uniqueId; // INT로 변경
    private String userId;
    private String password;
    private String name;
    private String sex;
    private String phone;
    private String birth;

    public User() { //기본 생성자(꼬이는 거 방지)
    	super();
    }
    // 생성자
    public User(String userId, String password, String name
    		, String sex, String phone, String birth) {
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.sex=sex;
        this.phone = phone;
        this.birth=birth;
    }

    // 자동 생성 가능
    public int getUniqueId() {
        return uniqueId;
    }

    public void setUniqueId(int uniqueId) {
        this.uniqueId = uniqueId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password=password;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name=name;
    }
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone=phone;
    }
    
    public String getBirth() {
    	return birth;
    }
    public void setBirth(String birth){
    	this.birth = birth;
    }
    
    @Override // db에 넣기 쉬움
    public String toString() {
        return "User{" +
        		"uniqueId='" + uniqueId + '\'' +
                ", userId='" + userId + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", phone='" + phone + '\'' +
                 ", birth=" + birth +
                '}';
    }
}