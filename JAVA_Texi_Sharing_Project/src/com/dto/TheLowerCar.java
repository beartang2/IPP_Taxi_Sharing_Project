package com.dto;

public class TheLowerCar extends Car {
    //상부공간
    private boolean UpperSpace;

    // 생성자
    public TheLowerCar(String carNumber, int seats, int capacity, boolean UpperSpace) {
        super(carNumber, seats, capacity);
        this.UpperSpace = UpperSpace;
    }

    // getter setter
    public boolean getUpperSpace() {
        return UpperSpace;
    }

    public void setUpperSpace(boolean UpperSpace) {
        this.UpperSpace = UpperSpace;
    }  
}