package com.ict.day03;

public class Ex10 {

	public static void main(String[] args) {
		// 단순 if문 : 조건식이 참일때만 실행, 거짓일 경우 if문 무시
		// 형식) if(조건식){
		//		   조건식이 참일때 실행할 문장;
		//		   조건식이 참일때 실행할 문장;
		//		   조건식이 참일때 실행할 문장;
		//      }
		//  주의사항 : 실행할 문장이 한줄이면 {}(블록) 생략 가능
		//			여러 줄이면 반드시 {}(블록) 사용해야 된다.
//		int k1 이 60  이상이면 합격
		int k1 = 70;
		String result = "초기값";
		if(k1 >= 60) {
			result = "합격";
		}
		System.out.println("결과 : " + result);
		
		// int k2가 60 이상이면 합격, 60 미만이면 불합격
		int k2 = 57;
		String result2 = "초기값";
		if(k2 >= 60) {
			result2 = "불합격";
		}
		System.out.println("결과 : " + result2);
		
		// int k3가 60 이상이면 합격, 60 미만이면 불합격
		int k3 = 54;
		String result3 = "불합격";
		if(k3 >=60) {
			result3 = "합격";
		}
		System.out.println("결과 : " + result3);
	}

}
