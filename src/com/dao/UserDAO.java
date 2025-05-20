package com.dao;

import java.sql.*;
import com.dto.User;

public class UserDAO {

    // 사용자 추가 (uniqueId는 DB에서 자동 생성됨)
    public int insertUser(Connection conn, User user) throws SQLException {
        String sql = "INSERT INTO user (userId, password, name, sex, phone, birth) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getSex());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getBirth());

            int rows = pstmt.executeUpdate();

            if (rows == 0) {
                throw new SQLException("사용자 등록 실패");
            }

            // 자동 생성된 uniqueId 가져오기
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if (rs.next()) {
                    int generatedId = rs.getInt(1);
                    user.setUniqueId(generatedId); // DTO에 반영
                    System.out.println("생성된 uniqueId: " + generatedId);
                }
            }

            return rows;
        }
    }

    public User findUserByUniqueId(Connection conn, int uniqueId) throws SQLException {
        String sql = "SELECT * FROM user WHERE uniqueId = ?";
        User user = null;

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, uniqueId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User(
                        rs.getString("userId"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("sex"),
                        rs.getString("phone"),
                        rs.getString("birth")
                    );
                    user.setUniqueId(rs.getInt("uniqueId"));
                }
            }
        }

        return user;
    }


    // 모든 사용자 목록 출력용
    public void printAllUsers(Connection conn) throws SQLException {
        String sql = "SELECT * FROM user";

        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                    rs.getString("userId"),
                    rs.getString("password"),
                    rs.getString("name"),
                    rs.getString("sex"),
                    rs.getString("phone"),
                    rs.getString("birth")
                );
                user.setUniqueId(rs.getInt("uniqueId"));

                System.out.println(user);
            }
        }
    }
}
