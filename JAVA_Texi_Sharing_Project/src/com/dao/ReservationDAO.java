package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dto.Reservation;
import com.util.DBConnection;

public class ReservationDAO {

    // 조건에 맞는 예약 리스트 조회
    public List<Reservation> getAvailableReservations(String departure, String destination, int minHour) {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservation WHERE departure = ? AND destination = ? AND hour >= ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, departure);
            pstmt.setString(2, destination);
            pstmt.setInt(3, minHour);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Reservation r = new Reservation(
                    rs.getInt("resId"),
                    rs.getString("departure"),
                    rs.getString("destination"),
                    rs.getInt("hour"),
                    rs.getString("carType"),
                    rs.getInt("currentPeople"),
                    rs.getInt("maxPeople"),
                    rs.getInt("currentLuggage"),
                    rs.getInt("maxLuggage"),
                    rs.getInt("fare")
                );
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 예약 인원 1명 추가, 짐 개수 추가 가능하도록 수정
    public boolean incrementPeopleAndLuggage(int resId, int additionalPeople, int additionalLuggage) {
        String sql = "UPDATE reservation SET currentPeople = currentPeople + ?, currentLuggage = currentLuggage + ? " +
                     "WHERE resId = ? AND currentPeople + ? <= maxPeople AND currentLuggage + ? <= maxLuggage";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, additionalPeople);
            pstmt.setInt(2, additionalLuggage);
            pstmt.setInt(3, resId);
            pstmt.setInt(4, additionalPeople);
            pstmt.setInt(5, additionalLuggage);

            int result = pstmt.executeUpdate();
            return result == 1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // 예약 번호로 예약 조회
    public Reservation getReservationById(int resId) {
        String sql = "SELECT * FROM reservation WHERE resId = ?";
        Reservation r = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, resId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                r = new Reservation(
                    rs.getInt("resId"),
                    rs.getString("departure"),
                    rs.getString("destination"),
                    rs.getInt("hour"),
                    rs.getString("carType"),
                    rs.getInt("currentPeople"),
                    rs.getInt("maxPeople"),
                    rs.getInt("currentLuggage"),
                    rs.getInt("maxLuggage"),
                    rs.getInt("fare")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;
    }
}
