package com.ict.day10;

import java.util.Scanner;

public class Ex13 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Ex12 t = new Ex12();
		
		System.out.print("이름 : ");
		String s1 = scan.next();
		
		System.out.print("국어 : ");
		int s2 = scan.nextInt();
		
		System.out.print("영어 : ");
		int s3 = scan.nextInt();
		
		System.out.print("수학 : ");
		int s4 = scan.nextInt();
		
		String p1 = t.play01(s1);
		int p2 = t.play02(s2, s3, s4);
		double p3 = t.play03(p2);
		String p4 = t.play04(p3);
		
		// 출력방법 1)
		System.out.println("main");
		System.out.println("이름 : " + p1);
		System.out.println("총점 : " + p2);
		System.out.println("평균 : " + p3);
		System.out.println("학점 : " + p4);
		System.out.println();
		
		// 방법 2)
		t.play05();
		System.out.println();
		
		// 방법 3)
		t.play06(p1, p2, p3, p4);
		
		
		
		
		
	}
}
