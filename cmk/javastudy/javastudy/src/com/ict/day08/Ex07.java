package com.ict.day08;

import java.util.Scanner;

public class Ex07 {

	public static void main(String[] args) {
		String[][] members = {
				{"1", "admin", "1111", "어드민", "서울"},	
				{"2", "park", "2222", "박길동", "강원도"},	
				{"3", "lee", "1111", "이길동", "경기도"},	
				{"4", "goh", "3333", "고길동", "충청도"},	
				{"5", "noh", "5555", "노길동", "제주도"},	
		};
		
		Scanner scan = new Scanner(System.in);
		
		// 아이디 입력
		System.out.print("아이디 : ");
		String id = scan.next();
		// 패스워드 입력
		System.out.print("패스워드 : ");
		String pw = scan.next();
		
		// 결과
		boolean loggin = false;
		for (int i = 0; i < members.length; i++) {
			if(id.equals(members[i][1])) {
				if(pw.equals(members[i][2])) {
					loggin = true;
				}
			}
		}
		
		if(loggin) {
			System.out.println("로그인 성공");
		}else {
			System.out.println("아이디나 패스워드가 일치하지 않습니다.");
		}
		
	}

}
