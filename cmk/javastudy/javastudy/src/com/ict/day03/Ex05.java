package com.ict.day03;

import java.util.Scanner;

public class Ex05 {

	public static void main(String[] args) {
		// 초를 입력 받아서 시, 분, 초로 출력하자
		Scanner sc = new Scanner(System.in);

		System.out.print("초를 입력하세요 : ");
		int total = sc.nextInt();
				
//		int h = total / 3600;
//		int m = (total % 3600) / 60;
//		int s = total % 60;
//		System.out.println(h + "시 " + m + "분 " + s + "초");
		
		int h = 0;
		int m = 0;
		int s = 0;
		int res = 0; // 나머지 저장하는 변수
		
		// 시간 구하자
		h = total / (60 * 60);
		res = total % (60 * 60);
		
		// 분 구하기
		m = res / 60;
		
		// 초 구하기
		s = res % 60;
		
		System.out.print(h + "시 ");
		System.out.print(m + "분 ");
		System.out.print(s + "초 ");
		
	}

}
