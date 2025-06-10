package com.dao;

import com.dto.Car;
import com.dto.User;
import java.io.Serializable;

public class Reservation implements Serializable {
    private static final long serialVersionUID = 1L;

    private int reservationId;
    private User user;
    private Car car;
    private String departure;
    private String destination;
    private String time;
    private int hour;
    private int people;
    private boolean hasLuggage;
    private String carType;
    private int totalFare;
    private int farePerPerson;

    public Reservation(int reservationId, User user, Car car,
                       String departure, String destination,
                       String time, int hour, int people,
                       boolean hasLuggage, String carType,
                       double distance) {
        this.reservationId = reservationId;
        this.user = user;
        this.car = car;
        this.departure = departure;
        this.destination = destination;
        this.time = time;
        this.hour = hour;
        this.people = people;
        this.hasLuggage = hasLuggage;
        this.carType = carType;

        boolean isNight = FareCalc.isNightTime(hour);
        this.totalFare = FareCalc.calcTotalFare(distance, isNight);
        this.farePerPerson = FareCalc.calcPerPersonFare(distance, people, isNight);
    }

    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }

    public Car getCar() { return car; }
    public void setCar(Car car) { this.car = car; }

    public String getDeparture() { return departure; }
    public void setDeparture(String departure) { this.departure = departure; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public int getHour() { return hour; }
    public void setHour(int hour) { this.hour = hour; }

    public int getPeople() { return people; }
    public void setPeople(int people) { this.people = people; }

    public boolean isHasLuggage() { return hasLuggage; }
    public void setHasLuggage(boolean hasLuggage) { this.hasLuggage = hasLuggage; }

    public String getCarType() { return carType; }
    public void setCarType(String carType) { this.carType = carType; }

    public int getTotalFare() { return totalFare; }
    public int getFarePerPerson() { return farePerPerson; }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservationId=" + reservationId +
                ", user=" + user.getUserId() +
                ", car=" + car.getCarNumber() +
                ", departure='" + departure + '\'' +
                ", destination='" + destination + '\'' +
                ", time='" + time + '\'' +
                ", hour=" + hour +
                ", people=" + people +
                ", hasLuggage=" + hasLuggage +
                ", carType='" + carType + '\'' +
                ", totalFare=" + totalFare +
                ", farePerPerson=" + farePerPerson +
                '}';
    }
    
}
