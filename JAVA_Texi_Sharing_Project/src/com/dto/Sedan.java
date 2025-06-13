package com.dto;

public class Sedan extends Car {

	   
    public Sedan() {  //생성자
        this(" "); 
    }

   
    public Sedan(String carNumber) {
        this.setCarNumber(carNumber); //SUV와 동일합니답
        this.setSeats(4); //최대 좌석
        this.setCapacity(2); //최대 짐
        System.out.println("상속받은 Sedan 클래스 입니다"); //Car 클래스에 ("Car 클래스는") 출력 받은 다음으로 출력할 문장입니답
    }
}
