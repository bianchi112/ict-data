package com.ict.day10;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class Ex04 {
	int age = 14;

	public static void main(String[] args) {
		int k1 = 10;

		// main()도 static 변수 사용 못함
		// static int k2 = 20;
		
		// instance 변수인 age 도 사용 못함
		// age = age + 1;
		
		// static 은 객체 생성과 상관없이 미리 만들어진다.
		// 언제든지 클래스이름.이름 으로 호출 가능
		int s1 = Ex03.kor;
		System.out.println("국어 : " + s1);
		
		int s2 = Ex03.sum;
		System.out.println("총점 : " + s2);
		
		Ex03.play01();
		
		int s3 = Ex03.sum;
		System.out.println("총점 : " + s3);
		
		// 객체 생성
		Ex03 t1 = new Ex03();
		String str = t1.name;
		System.out.println("이름 : " + str);
		
		int str2 = t1.sum;
		System.out.println("총점 : " +str2);

	}

}
