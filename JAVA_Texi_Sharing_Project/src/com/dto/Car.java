package com.dto;

public class Car {
	
	private String carNumber;
	private int seats;
	private int capacity;
	
	//생성자
	public Car(String carNumber, int seats, int capacity) {
		this.carNumber=carNumber;
		this.seats=seats;
		this.capacity=capacity;
		
	}
	
	
	//setter getter
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
