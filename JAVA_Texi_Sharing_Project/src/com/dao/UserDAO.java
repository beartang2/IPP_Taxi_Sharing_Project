package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.util.DBConnection;
import com.dto.*;

public class UserDAO {
    public boolean insertUser(User user) {
        String sql = "INSERT INTO user (userId, password, name, sex, phone, birth) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getSex());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getBirth());

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
