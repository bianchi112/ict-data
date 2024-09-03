package com.ict.day03;

public class Ex11 {

	public static void main(String[] args) {
		// if ~ else 문
		// 삼항연산자와 비슷하게 처리 하는 제어문
		// 즉, 조건식이 참일 때 와 거짓일 때 각각 나눠서 처리한다.
		// 형식) if(조건식){
		// 조건식이 참일때 실행할 문장;
		// 조건식이 참일때 실행할 문장;
		// 조건식이 참일때 실행할 문장;
		// }else{
		// 조건식이 거짓일때 실행할 문자;
		// 조건식이 거짓일때 실행할 문자;
		// }

//		int k1 홀수인지 짝수인지 판별하자
		int k1 = 42;
		String res = "초기값";
		if (k1 % 2 == 0) {
			res = "짝수";
		} else {
			res = "홀수";
		}
		System.out.println("결과 : " + res);

		// int k2가 60 이상이면 합격 아니면 불합격
		int k2 = 78;
		if (k2 >= 60) {
			System.out.println("합격");
		} else {
			System.out.println("불합격");
		}

		// k3가 1이면 가격에 10% 할인을 해준다. (가격 2500)
		int k3 = 1;
		int price = 2500;
		if (k3 == 1) {
			price = (int) (price * 0.9);
		}
		System.out.println(price);

//		char k4가 대문자인지, 대문자가 아닌지 판별
		char k4 = 'D';
		if (k4 >= 'A' && k4 <= 'Z') {
			System.out.println("대문자");
		} else if (k4 >= 'a' && k4 <= 'a') {
			System.out.println("소문자");
		}

//		근무시간이 8시간 까지는 시간당 9860이다.
//		8시간 초과하면 초과한 시간만큼 1.5배 지급한다.
//		현재 내가 근무한 시간이 10이면 얼마를 받아야 하나?
		int time = 10;
		int dan = 9860;
		int m;
		if (time > 8) {
			m = (time - 8) * (int)(dan * 1.5) + (dan * 8);
		} else {
			m = time * dan;
		}
		System.out.println(m + "원");
	}

}
