package com.dto;
import java.util.StringTokenizer;

public class UserTest {
    public static void main(String[] args) {
        User user1 = new User("ididid", "qwertyuiop12", "신형만", "M", "010-8888-0999", "1980-01-01");
        user1.setUniqueId(3);
        System.out.println(user1);
        
        String user1Str=user1.toString();
        StringTokenizer st1=new StringTokenizer(user1Str, ",");
        while(st1.hasMoreTokens())
        	System.out.println(st1.nextToken());
    }
}
