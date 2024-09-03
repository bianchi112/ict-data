package com.ict.day02;

public class Ex04 {

	public static void main(String[] args) {
		// 기본자료형은 아니지만 기본자료형처럼 사용하는 String
		// String 클래스는 기본자료형이 아니라 클래스이므로 참조 자료형이다.
		// 사용법이 기본 자료형처럼 사용 가능하다.
		// 반드시 쌍따옴표를 사용한다. ("가", "가나다")
		
		String str = "홍길동";
		int age = 18;
		
		System.out.println(str);
		System.out.println(age);

		// String + 연산 : 실제 덧셈 연산을 하는 것이 아니라
		//				  문자열과 숫자를 이어 붙이는 연결자 역할을 한다.
		//				  String의 + 연산의 결과는 String 이다.
		
		String s1 = "10";
		int s2 = 10;
		// s1이 문자열 이므로 실제 덧셈이 되는 것이 아니라 문자와 숫자를 연결
		System.out.println(s1+10);
		System.out.println(s2+10);
		
		int su1 = 20;
		int su2 = 4;
		System.out.println(su1 + su2);
		System.out.println("합계 : " + su1 + su2);
		
		int su3 = su1 + su2;
		System.out.println("합계 : " + su3);
		
		System.out.println("합계 : " + (su1 + su2));
		
	}

}
