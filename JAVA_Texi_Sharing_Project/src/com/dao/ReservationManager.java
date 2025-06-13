package com.dao;

import com.dto.Car;
import com.dto.User;

import java.util.ArrayList;
import java.util.List;

public class ReservationManager {
    private List<Reservation> reservations = new ArrayList<>();
    private int reservationSeq = 1;

    // 예약 생성
    public Reservation createReservation(User user, Car car, String departure,
                                         String destination, int hour,
                                         int people, boolean hasLuggage, String carType,
                                         double distance) {
        Reservation reservation = new Reservation(
                reservationSeq++, user, car, departure, destination,
                hour, people, hasLuggage, carType, distance
        );
        reservations.add(reservation);
        return reservation;
    }

    // 전체 예약 목록 출력
    public void printReservations() {
        for (Reservation r : reservations) {
            System.out.println(r);
        }
    }

    // 예약 조회
    public Reservation getReservationById(int id) {
        for (Reservation r : reservations) {
            if (r.getReservationId() == id) {
                return r;
            }
        }
        return null;
    }
}
