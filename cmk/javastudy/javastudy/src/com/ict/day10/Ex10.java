package com.ict.day10;

import java.util.Scanner;

public class Ex10 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		Ex09 t1 = new Ex09();
		Ex11 t2 = new Ex11();

		System.out.print("이름 : ");
		String s1 = scan.next();
		t1.play01(s1);

		System.out.print("국어 : ");
		int s2 = scan.nextInt();

		System.out.print("영어 : ");
		int s3 = scan.nextInt();

		System.out.print("수 : ");
		int s4 = scan.nextInt();

		t1.play02(s2, s3, s4);
		System.out.println("================");
		
		t2.play01(s1);
		t2.play02(s2, s3, s4);

	}
}
