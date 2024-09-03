package com.ict.day02;

public class Ex11 {

	public static void main(String[] args) {
		// 비교연산자 : >, <, >=, <=, ==(같다), !=(같지 않다, 다르다)
		// 비교연산자 대상 : 문자형, 정수형, 실수형
		// 비교연산자 결과 : 무조건 boolean 형(논리형)
		// 논리형은 기본적으로 조건식에 사용된다.
		
		int su1 = 90;
		int su2 = 80;
		boolean result = su1 > su2;
		System.out.println("결과 : " + result);
		
		double su3 = 91.0;
		double su4 = 89.0;
		result = su3 > su4;
		System.out.println("결과 : " + result);
				
		// 비교연산자는 정수와 실수 비교도 가능하다.
		result = su1 > su3;
		System.out.println("결과 : " + result);
		
		char su5 = 'a';
		char su6 = 'A';
		char su7 = 'b';
		char su8 = '한';
		
		result = su5 > su6;
		System.out.println("결과 : " + result);
		
		result = su5 > su7;
		System.out.println("결과 : " + result);
		
		// su5의 숫자, su6의 숫자, su7의 숫자값을 알고 싶다.
		// char를 int로 강제 형 변경하면 알 수 있다.
		System.out.println("a : " + (int)(su5));
		System.out.println("A : " + (int)(su6));
		System.out.println("b : " + (int)(su7));
		System.out.println("한 : " + (int)(su8));
		
		

	}

}
