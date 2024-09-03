package com.ict.day02;

public class Ex05 {

	public static void main(String[] args) {
		// 산술연산자 : +(더하기), -(빼기), *(곱하기), /(나누기), %(나머지)
		// 연산 대상 (숫자) : byte, short, char, int, long, double, float
		
		int su1 = 9;
		int su2 = 4;
		int result = 0; // 결과를 저장하는 변수
		
		result = su1 + su2;
		System.out.println(su1 + " + " + su2 + " = " + result);
		
		result = su1 - su2;
		System.out.println(su1 + " - " + su2 + " = " + result);
		
		result = su1 * su2;
		System.out.println(su1 + " * " + su2 + " = " + result);
		
		// int와 int로 계산하므로 결과는 int
		result = su1 / su2;
		System.out.println(su1 + " / " + su2 + " = " + result);
		
		result = su1 % su2;
		System.out.println(su1 + " % " + su2 + " = " + result);
		
	}

}
