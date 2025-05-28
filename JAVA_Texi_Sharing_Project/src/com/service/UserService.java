package com.service;

import java.util.Scanner;

import com.dao.UserDAO;
import com.dto.User;

public class UserService {
    private final UserDAO userDAO = new UserDAO();
    private final Scanner sc = new Scanner(System.in);

    public void registerUser() {
        System.out.print("아이디를 입력하세요: ");
        String userId = sc.nextLine();
        System.out.print("비밀번호를 입력하세요: ");
        String password = sc.nextLine();
        System.out.print("이름을 입력하세요: ");
        String name = sc.nextLine();
        System.out.print("성별을 입력하세요 (남/여): ");
        String sex = sc.nextLine();
        System.out.print("전화번호를 입력하세요 (010-XXXX-XXXX): ");
        String phone = sc.nextLine();
        System.out.print("생년월일을 입력하세요 (YYYY-MM-DD): ");
        String birth = sc.nextLine();
        System.out.print("나이를 입력하세요: ");
        int age = Integer.parseInt(sc.nextLine());

        User user = new User(userId, password, name, sex, phone, birth, age);
        

        boolean result = userDAO.insertUser(user);
        if (result) {
            System.out.println("회원가입이 완료되었습니다!");
        } else {
            System.out.println("회원가입에 실패했습니다. 다시 시도해주세요.");
        }
    }
}
