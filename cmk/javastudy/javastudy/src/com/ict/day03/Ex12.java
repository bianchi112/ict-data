package com.ict.day03;

import java.util.Scanner;

public class Ex12 {

	public static void main(String[] args) {
		// 키보드로 입력한 정보를 scan에 저장한다.
		Scanner scan = new Scanner(System.in);
		
		// 키보드로 받은 정보를 홀수인지, 짝수인지 판별하자.
		// 키보드로 받은 정보를 숫자(정수)로 변경 : .nextInt()
		// 키보드로 받은 정보를 숫자(실수)로 변경 : .nextDouble()
		// 키보드로 받은 정보를 String 변경 : .next(), .nextLine()
		
		System.out.print("숫자 입력 : ");
		int k1 = scan.nextInt();
		String str = "";
		if(k1 % 2 == 0) {
			str = "짝수";
		}else {
			str = "홀수";
		}
		System.out.println("결과 : " + str);
		
		System.out.print("근무시간 입력 : ");
		int k2 = scan.nextInt();
		int dan = 9860;
		int result = 0;
		if (k2 > 8) {
			result = (8 * dan) + (int)((k2 - 8) * dan * 1.5);
		} else {
			result = k2 * dan;
		}
		
		
	}

}
