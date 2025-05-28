package main;

import com.dao.*;
import com.dto.User;

public class mainEx {
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User sampleUser = new User("kim123", "pw1234", "김민수", "남", "010-1234-5678", "1999-10-05");

        boolean inserted = dao.insertUser(sampleUser);
        if (inserted) {
            System.out.println("회원 데이터 삽입 성공!");
        } else {
            System.out.println("회원 데이터 삽입 실패!");
        }
    }
}

