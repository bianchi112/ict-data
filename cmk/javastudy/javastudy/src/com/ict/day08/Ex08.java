package com.ict.day08;

import java.util.Scanner;

public class Ex08 {

	public static void main(String[] args) {
		// Ex07의 Scanner 이용하기(번호, 아이디, 패스워드, 이름 , 주소받기)
		// 아이디와 패스워드를 입력받아서 로그인 성공, 실패 체크하기

		Scanner scan = new Scanner(System.in);

		// 인원 수 입력
		System.out.print("인원 수 : ");
		int cnt = scan.nextInt();
		String[][] members = new String[cnt][5];

		for (int i = 0; i < members.length; i++) {
			String[] p = new String[5];
			// p 배열에 내용을 채워 넣자
			System.out.print("번호: ");
			String idx = scan.next();
			p[0] = idx;
			// p[0] = scan next(); // 간편화 가능
			
			System.out.print("아이디: ");
			String id = scan.next();
			boolean idchk = false;
			for(int j=0; j<i; j++) {
				if(id.equals(members[j][1])) {
					idchk = true;
					break;
				}
			}
			if(idchk) {
				System.out.println("아이디 중복");
				i--;
				continue;
			}
			p[1] = id;
			
			System.out.print("패스워드: ");
			String pw = scan.next();
			p[2] = pw;
			
			System.out.print("이름: ");
			String name = scan.next();
			p[3] = name;
			
			System.out.print("주소: ");
			String addr = scan.next();
			p[4] = addr;
			
			// p 배열을 2차원 배열인 members에 넣자	
			members[i] = p;			
			
		}

		// 아이디 입력
		System.out.print("당신의 아이디: ");
		String u_id = scan.next();
		// 패스워드 입력
		System.out.print("당신의 패스워드: ");
		String u_pw = scan.next();

		//결과
		boolean loggin = false;
		for (int i = 0; i < members.length; i++) {
			if (u_id.equals(members[i][1])) {
				if (u_pw.equals(members[i][2])) {
					loggin = true;
					break;
				}
			}
		}

		if (loggin) {
			System.out.println("로그인 성공");
		} else {
			System.out.println("아이디나 패스워드가 일치하지 않습니다.");
		}

		scan.close();
	}
}
