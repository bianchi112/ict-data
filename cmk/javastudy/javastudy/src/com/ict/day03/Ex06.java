package com.ict.day03;

public class Ex06 {

	public static void main(String[] args) {
		// 삼항연산자 : 조건이 참일 때와 거짓일 때를 구분해서 실행한다.
		// 형식) 자료형 변수 = 조건식 ? 조건식이 참일 때 : 조건식이 거짓일 때
		//				  (비교연산, 논리연산, 논리형)
		//	  ** 변수, 참일때 실행결과, 거짓일 때 실행 결과 모두 같은 자료형이어야 한다.
		
		// int k1 이 홀수인지 짝수인지 판별하자
		// 힌트) 어떤수를 2로 나눈 나머지가 0이면 짝수, 1이면 홀수
		
		int k1 = 5;
		String str = (k1 % 2 == 0) ? "짝수" : "홀수" ;
		System.out.println("결과 : " + str);
		
		// int k2가 60이상이면 합격 아니면 불합격
		int k2 = 59;
		String str2 = (k2 >= 60) ? "합격" : "불합격" ;
		System.out.println("결과 : " + str2);
		
		// k3가 1이면 가격에 10% 할인을 해준다.
		int k3 = 1;
		int price = 1300;
		int res1 = (k3 == 1) ? price - (int)(price * 0.1) : price ;
		int res2 = (k3 == 1) ? price - (price / 10) : price ;
		int res3 = (k3 == 1) ? (int)(price * 0.9) : price ;
		System.out.println("결과 : " + res1);
		System.out.println("결과 : " + res2);
		System.out.println("결과 : " + res3);
		
		// char k4가 대문자인지, 대문자 아닌지 판별하자.
		char k4 = 'g';
		String str3 = (k4 >= 'A') && (k4 <= 'Z') ? "대문자" : "대문자 아님";
		System.out.println("결과 : " + str3);
		
		// 근무시간이 8시간 까지는 시간당 9860 이다.
		// 8시간 초과하면 초과한 시간만큼 1.5배 지급한다. 
		// 현재 내가 근무한 시간이 10이면 얼마를 받아야 하냐?
		
		int time = 10;
		int dan = 9860;
//		int res4 = time < 8 ? (dan * time) : ((time-8) * ((int)(dan * 1.5))) + (dan * 8) ;
		int res4 = (time > 8) ? (8*dan) + (int)((time-8)*dan*1.5) : time*dan ;
		System.out.println(res4+"원");
		
	}

}
