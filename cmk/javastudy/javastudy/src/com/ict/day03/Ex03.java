package com.ict.day03;

import java.util.Scanner;

public class Ex03 {

	public static void main(String[] args) {
		// import : 수입, 회사에서 제공하는 클래스를 가져다가 사용하기 위함
		// 			패키지가 java.lang 안에 존재하는 클래스는 import 를 안함
		// improt 방법 : 1) 클래스 이릅 ctrl + space bar
		// 			    2) 자동 import -> ctrl + shift + o(영문자)
		
		
		// 키보드에 입력한 정보를 받아서 scan 라는 변수에 저장한다.
		Scanner scan = new Scanner(System.in);
		
		// 키보드를 통해서 들어오는 정보 : 문자열(String), 숫자(정수, 실수)
		// .next() : 키보드로 입력한 내용을 String 형으로 처리하는 메서드
		// 			 띄어쓰지 전까지 또눈 Enter 전까지
		
		// 숙제 : .nextLine() => 키보드로 입력한 내용을 String 형으로 처리하는 메서드
		//       .next()와 .nextLine() 의 차이점을 자세히 알아보자
		System.out.print("이름 : ");
		String name = scan.next();
		System.out.println("당신의 이름은 " + name);
	
		// 키보드로 입력한 숫자는 자바에서 문자열 또는 숫자로 변경할 수 있다.
		System.out.print("나이 : ");
//		String age = scan.next(); // 문자열로 변경
//		System.out.println("당신의 나이는 " + (age+1));
		
		// .nextInt() : 입력한 내용을 int 형으로 처리하는 메서드 
		//			    만약에 실수값을 넣으면 오류 발생 (Exception)
		int age2 = scan.nextInt(); // 숫자로 변경
		System.out.println("당신의 나이는 " + (age2+1));
		
		// .nextDouble()  : 입력한 애용을 double 형으로 처리하는 메서드
		// 					만약에 정수값을 넣어도 된다.
		System.out.println("키 : ");
		double height = scan.nextDouble();
		System.out.println("당신의 키는 " + (height + 1));
		
		
	}
}
