package com.ict.day03;

import java.util.Scanner;

public class Ex07 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		
		// 1. 숫자를 받아서 해당 숫자가 홀수인지, 짝수인지 판별하자
		System.out.print("숫자 입력 : ");
		int s1 = sc.nextInt();
		String str1 = (s1 % 2 == 0) ? "짝수" : "홀수" ;
		System.out.println("결과 : " + str1);
		
		// 2. 점수를 받아서 해당 점수가 80점 이상이면 합격, 아니면 불합격
		System.out.print("점수 입력 : ");
		int s2 = sc.nextInt();
		String str2 = (s2 >= 80) ? "합격 " : "불합격";
		System.out.println("결과 : " + str2);
		
		// 3. 근무 시간을 받아서 8시간 이상이면 8시간까지는 9860이고
		//    8시간 초과한 시간은 1.5배를 더 지급한다.
		System.out.print("근무 시간 : ");
		int time = sc.nextInt();	
		int dan = 9860;
		int str3 = (time > 8) ? (8*dan) + (int) ((time-8)*dan*1.5) : time*dan ;
		System.out.println("결과 : " + str3);
		
		
	}
}
