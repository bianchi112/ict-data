package com.ict.day03;

public class Ex02 {
	
	public static void main(String[] args) {
		// 대입 연산자 : 데이터나 변수를 특정변수에 저장시킬 때 사용
		//   		  특정변수 = 데이터 또는 변수
		// 참고로 오른쪽에는 변수는 변수가 저장되는 것이 아니라 변수가 가지고 있는 값을 저장
		// = , += , -= , *= , /=
		// a = b => b를 a에 저장
		// a += b => a + b 의 결과를 a에 저장 , a = a + b
		// a -= b => a - b 의 결과를 a에 저장 , a = a - b
		// a *= b => a * b 의 결과를 a에 저장 , a = a * b
		// a /= b => a / b 의 결과를 a에 저장 , a = a / b
		// a %= b => a % b 의 결과를 a에 저장 , a = a % b
		
		int su = 7;
		su += 4;
		System.out.println("결과 : " + su); // 11
		
		su -= 4;
		System.out.println("결과 : " + su); // 7
		
		su *= 4;
		System.out.println("결과 : " + su); // 28
		
		su /= 4;
		System.out.println("결과 : " + su); // 7
		
		su %= 4;
		System.out.println("결과 : " + su); // 3
	}
}
