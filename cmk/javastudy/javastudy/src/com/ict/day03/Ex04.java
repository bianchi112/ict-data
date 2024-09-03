package com.ict.day03;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		// 이름, 국어, 영어, 수학 점수를 받아서
		// 총점, 평균을 구하고 이름, 총점, 평균만 출력하자(소수점 둘째자리까지만 구하자)
		
		// 키보드의 정보를 받기 위해서는 Scanner 클래스를 사용하자
		Scanner scan = new Scanner(System.in);

		System.out.print("이름 : ");
		String name = scan.next();
		System.out.print("국어 : ");
		int kor = scan.nextInt();
		System.out.print("영어 : ");
		int eng = scan.nextInt();
		System.out.print("수학 : ");
		int math = scan.nextInt();
		
		// 총점 구하기
		int sum = kor + eng + math;
		
		// 평균 구하기
		double avg = (int)(sum/3.0 * 100) / 100.0;
		
		System.out.println("이름 : " + name);
		System.out.println("총점 : " + sum);
		System.out.println("평균 : " + avg);
	}

}
