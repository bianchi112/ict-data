package com.ict.day02;

public class Ex02 {

	public static void main(String[] args) {
		// 숫자 크기 비교 (char는 숫자로 저장되기 때문에 비교 가능)
		// byte < short < char < int < long < float < double
		
		// 큰 자료형은 작은 자료형을 저장할 수 있다. 큰자료형 = 작은자료형(O)
		// 작은 자료형은 큰 자료형을 저장할 수 업다. 작은자료형 = 큰자료형(X)
		
		int su1 = 100;
		
		long su2 = su1;
		
		double su3 = su2;
		
		char ch1 = 'a';
		
		// int가 char보다 크다
		int su5 = ch1;
		
		double su6 = ch1;
		
		// short는 char보다 작다
//		short sh1 = ch1;
		
		// ch1이 char이므로 결과를 문자로 내보낸다.
		System.out.println(ch1);	// a
		
		// su5는 int이므로 결과를 정수로 내보낸다.
		System.out.println(su5);	// 97
		
		// su6은 double이므로 결과를 실수로 내보낸다.
		System.out.println(su6);
	}

}
