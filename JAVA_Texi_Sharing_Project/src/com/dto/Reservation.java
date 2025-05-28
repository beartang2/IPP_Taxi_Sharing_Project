package com.dto;

public class Reservation {		//db랑 같게 만들어서 귀찮음 방지.
    private int resId;             // 예약 ID
    private String departure;      // 출발지
    private String destination;    // 목적지
    private int hour;              // 시간 (예: 15)
    private String carType;        // 차량 종류 (sedan, suv)
    private int currentPeople;     // 현재 예약된 인원 수
    private int maxPeople;         // 최대 인원 수
    private int currentLuggage;    // 현재 짐 개수
    private int maxLuggage;        // 최대 짐 개수
    private int fare;              // 요금

    // 생성자
    public Reservation(int resId, String departure, String destination, int hour, String carType,
                       int currentPeople, int maxPeople, int currentLuggage, int maxLuggage, int fare) {
        this.resId = resId;
        this.departure = departure;
        this.destination = destination;
        this.hour = hour;
        this.carType = carType;
        this.currentPeople = currentPeople;
        this.maxPeople = maxPeople;
        this.currentLuggage = currentLuggage;
        this.maxLuggage = maxLuggage;
        this.fare = fare;
    }

    // Getter, Setter 메서드들
    public int getResId() {
        return resId;
    }

    public void setResId(int resId) {
        this.resId = resId;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public int getCurrentPeople() {
        return currentPeople;
    }

    public void setCurrentPeople(int currentPeople) {
        this.currentPeople = currentPeople;
    }

    public int getMaxPeople() {
        return maxPeople;
    }

    public void setMaxPeople(int maxPeople) {
        this.maxPeople = maxPeople;
    }

    public int getCurrentLuggage() {
        return currentLuggage;
    }

    public void setCurrentLuggage(int currentLuggage) {
        this.currentLuggage = currentLuggage;
    }

    public int getMaxLuggage() {
        return maxLuggage;
    }

    public void setMaxLuggage(int maxLuggage) {
        this.maxLuggage = maxLuggage;
    }

    public int getFare() {
        return fare;
    }

    public void setFare(int fare) {
        this.fare = fare;
    }

    // toString 메서드 (디버깅용)
    @Override
    public String toString() {
        return "Reservation{" +
                "resId=" + resId +
                ", departure='" + departure + '\'' +
                ", destination='" + destination + '\'' +
                ", hour=" + hour +
                ", carType='" + carType + '\'' +
                ", currentPeople=" + currentPeople +
                ", maxPeople=" + maxPeople +
                ", currentLuggage=" + currentLuggage +
                ", maxLuggage=" + maxLuggage +
                ", fare=" + fare +
                '}';
    }
}
