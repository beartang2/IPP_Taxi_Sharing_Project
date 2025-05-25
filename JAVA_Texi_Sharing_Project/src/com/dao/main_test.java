package com.dao;

import java.util.*;
import com.dao.*;
import com.dto.*;


public class main_test {
	
	public static void main(String [] args) {
		
		//사용자가 메뉴 선택
		Scanner sc = new Scanner(System.in);
		//변환해야하는 문자열 저장용
		String str = sc.next();
		
		char input = str.charAt(0);
		//System.out.println("환영합니다. 1.회원가입 2.로그인");
		//System.out.println("사용하실 메뉴를 선택해주세요. 1.택시예약 2.예약정보 확인");
		
		System.out.println("사용하실 메뉴를 선택해주세요. 1.회원가입 2.택시예약 3.예약정보 확인");
		
		//로그인 기능 넣을건지?(아이디 비밀번호 확인)
		switch (input) {
		//회원가입하는로직
        case '1':
            System.out.println("회원가입을 진행합니다.");
            System.out.print("아이디: ");
            String userId = sc.nextLine();
            System.out.print("비밀번호: ");
            String pw = sc.nextLine();
            System.out.print("이름: ");
            String name = sc.nextLine();
            System.out.print("성별(M/F): ");
            String sex = sc.nextLine();
            System.out.print("전화번호: ");
            String phone = sc.nextLine();
            System.out.print("생년월일(yyyy-MM-dd): ");
            String birth = sc.nextLine();
            //User 객체 생성, user.DAO는 DB에 저장하기위한 객체
            User user = new User(userId, pw, name, sex, phone, birth);
            userDAO.insertUser(user);
            System.out.println("회원가입 완료!\n");
            break;
        //택시 예약 하는 로직
        case '2':
        	//예약 고유 ID 어떻게 처리할지
        	System.out.println();
        	
        	System.out.print("출발지 : ");
        	String departure = sc.nextLine();
        	System.out.print("목적지 : ");
        	String destination = sc.nextLine();
        	System.out.print("출발 시간 : ex)1:30 (30분 단위로 입력해주세요.)");
        	String time = sc.nextLine();
        	System.out.print("짐 여부 : (True/False)");
        	str = sc.nextLine();
        	boolean hasLuggage = Boolean.parseBoolean(str);
        	//예약 객체 생성, 예약 DB내용 업데이트(이부분 try catch문으로?)
        	Reservation reservation = new Reservation(departure, destination, time, hasLuggage);
        	ReservationDAO.updateReservation(reservation);
        	
        	//밑에 DB업데이트메소드에서 try,catch 로 예약 성공 실패 출력하도록
        	//System.out.println("예약이 완료되었습니다.");
        	
        	/*쿼리문?
        	
        	public void updateReservation(String departure, String destination, 시간) {
        		if(hasLuggage)
    				String sql = "UPDATE reservation SET people = people+1, Luggarge = Luggarge+1
    				WHERE departure = ? AND destination = ? AND 시간 = ? (형태 어떻게 할지 고민)";
    			else
    				String sql = "UPDATE reservation SET people = people+1
    				WHERE departure = ? AND destination = ? AND 시간 = ? (형태 어떻게 할지 고민)";
    			}
        	 */
        	break;
        //예약정보 확인하는 로직	
        case '3':
        	//로그인 기능구현하면 get이용해서 가져오는걸로 생략
        	System.out.println("아이디를 입력하세요");
        	String userID = sc.nextLine();
        	//아이디만 입력되었을때 DB값을 읽어서 나머지 내용채우는 생성자 사용
        	Reservation checkReservation = new Reservation(userID);
        	
        	checkReservation.toString;
        	/*
        	 System.out.print("-------------------------");
        	 System.out.print("아이디 : " + userID);
        	 System.out.print("출발지 : " + checkReservation.출발지);
        	 System.out.print("목적지 : " + checkReservation.목적지);
        	 시간 저장한 방식에서 (1:30 형태로)변환해서 출력해주기
        	 System.out.print("시간 : " + checkReservation.시간);
        	 System.out.print("-------------------------");
        	 */
		}
	}
}