package com.ict.day10;

import java.util.Scanner;

public class Ex08 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름 : ");
		String str = scan.next();

		System.out.print("국어 : ");
		int s1 = scan.nextInt();

		System.out.print("영어 : ");
		int s2 = scan.nextInt();
		
		System.out.print("수학 : ");
		int s3 = scan.nextInt();
		
		// Ex07 변수들이 private 아니라서 가능
		/*
		 Ex07 t1 = new Ex07();
		 t1.name = str;
		 t1.kor = s1;
		 t1.eng = s2;
		 t1.math = s3;
		 t1.sum = s1 + s2 + s3;
		 t1.play05();
		
		 */
		
		// 변수가 private 인 경우 메서드를 이용해서
		Ex07 t1 = new Ex07();
		t1.play01(str);
		t1.play02(s1, s2, s3);
		t1.play03();
		t1.play04();
		t1.play05();
		
		
		
		
		
		

	}

}
