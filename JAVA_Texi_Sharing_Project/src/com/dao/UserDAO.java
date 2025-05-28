package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.util.DBConnection;
import com.dto.*;

public class UserDAO {
    public boolean insertUser(User user) {
        String sql = "INSERT INTO user (userId, password, name, sex, phone, birth, age) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getSex());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getBirth());
            pstmt.setObject(7, user.getAge());		//null 허용으로 만듦.

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    //로그인 로직
    public User login(String userId, String password) {
        String sql = "SELECT * FROM user WHERE userId = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, password);
            var rs = pstmt.executeQuery();

            if (rs.next()) {
                // DB 결과로 User 객체 생성
                User user = new User(
                    rs.getString("userId"),
                    rs.getString("password"),
                    rs.getString("name"),
                    rs.getString("sex"),
                    rs.getString("phone"),
                    rs.getString("birth"),
                    rs.getInt("age")
                );
                user.setUniqueId(rs.getInt("uniqueId")); // 필요 시
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
