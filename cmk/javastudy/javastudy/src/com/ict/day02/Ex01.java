package com.ict.day02;

public class Ex01 {

	public static void main(String[] args) {
		// 숫자형은 정수형과 실수형이 있다.
		// 정수형 소수점이 없는 숫자
		// 실수형 소수점이 있는 숫자
		// 정수 < 실수
		
		// 정수 : byte < short < int(기본) < long
		// 실수 : float < double(기본)
		
		// byte : -128 ~ 127
		byte b1;
		b1 = 100;
		System.out.println(b1);
		
		b1 = -120;
		System.out.println(b1);	
		
		// 범위를 넘어서 오류 발생
		// b1 = -200;
		// b1 = 128;
//		b1 = 120 + 10;
		
		// short : -32,768 ~ 32,767
		// byte 처럼 범위를 넘으면 사용 불가
		// ** 우리는 특별한 경우를 제외하고 byte, short를 사용하지 않는다.
		
		// int : 정수의 기본형이다.
		int su = 34;
		System.out.println(su);
		
		// long : 정수 중 가장 큰 범위를 가지고 있음
		//		  큰 정수를 사용할 때 호출하는 자료형
		//		  숫자 뒤에 L 또는 l 을 붙인다. (생략 가능)
		long num = 32L;
		
		// long = int	=> 작은 단위가 큰 단위로 저장될 때에는 오류 발생이 없으므로 가능
		long num2 = -100;
		
		// int = long	=> 큰 단위가 작은 단위에 저장될 때에는 오류 발생할 수 있으므로 불가능
//		int num3= 400L;
		
		
		
		// 실수형 : float < double(기본)
		// float 숫자 뒤에 반드지 F 나 f를 붙인다(생략 불가)
		float f1 = 321.41F;
		System.out.println(f1);
		
		// float = double => 큰 단위가 작은 단위에 저장 될 때는 오류 발생
//		float f2 = 31.457;

		double do1 = 14.12;
		
		// double = float, int, long => 작은 단위가 큰 단위에 저장 된다. 오류 발생 없음
		double do2 = 152.2F;
		double do3 = 10;
		double do4 = 10L;
		float  do5 = 20L;
		
		// float나 double은 부동 소수점으로 값을 표현한다.
		// 정확하게 표현이 안되서 오류 발생 한다. 
		// 해결) 나중에 BigDecimal 클래스를 자료형으로 사용한다.
		// 지금은 소수점 둘재자리까지 구하자
		
	}

}
