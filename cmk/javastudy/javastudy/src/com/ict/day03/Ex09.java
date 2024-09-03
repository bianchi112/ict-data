package com.ict.day03;

import java.util.Scanner;

public class Ex09 {

	public static void main(String[] args) {
		// 키보드를 받아서 아래 문제들을 처리하자
		Scanner sc = new Scanner(System.in);
		
		// 점수를 받아서 90점 이상이면 "A학점", 80점 이상이면 "B학점", 나머지 "F학점"
		System.out.print("점수 입력 : ");
		int su = sc.nextInt();
		String score = su >=90 ? "A학점" : (su >= 80 ? "B학점" : "F학점");
		System.out.println("학점 : " + score);
		
		// 주민번호 뒤에 첫번째자리를 받아서 1,3이면 남자, 2,4이면 여자, 나머지는 외국인
		System.out.print("주민번호 뒤에 첫번째자리 수 입력 : ");
		int su2 = sc.nextInt();
		String se = su2 == 1 || su2 == 3 ? "남자" : (su2 == 2 || su2 == 4) ? "여자" : "외국인";
		System.out.println("성별 : " + se);
		
		// 두 수를 받아서 큰 수를 출력하자.
		System.out.print("첫번째 수 : ");
		int su3 = sc.nextInt();
		System.out.print("두번째 수 : ");		
		int su4 = sc.nextInt();
		int mx = su3 > su4 ? su3 : su4;
		System.out.println(su3 + "와 " + su4 + "중 " + mx + "이(가) 크다");
	}

}
