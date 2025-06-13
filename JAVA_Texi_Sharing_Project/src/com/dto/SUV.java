package com.dto;

public class SUV extends Car {

	   
    public SUV() {  // 생성자
        this(" "); 
    }

    
    public SUV(String carNumber) {   //Car 클래스에 접근 권한이 private여서 알아보기 쉽게 set으로 간단하게 표시했습니다. max로 이름 바꾸셔도 됩니답.
        this.setCarNumber(carNumber); //차량 번호는 String으로 받는다고 했던 기억이 있어서 우선 이렇게 했습니다. 
        //Car 클래스에 carNumber에 Integer로 되어있어서 만약 간단한 예시로 받아도 된다 하시면 위에 생성자에 " "말고 0으로 넣고 int carNumber로 바꾸면 될 거 같아요.
        this.setSeats(6); //최대 좌석
        this.setCapacity(4); //최대 짐
        System.out.println("상속받은 SUV 클래스 입니다"); //Car 클래스에 ("Car 클래스는") 출력 받은 다음으로 출력할 문장입니답
    }
}

