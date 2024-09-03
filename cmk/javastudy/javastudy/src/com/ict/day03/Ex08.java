package com.ict.day03;

public class Ex08 {

	public static void main(String[] args) {
		// 중첩 삼항 연산 : 삼항 연산자 안에 삼항 연산자가 존재
		// 형식) 자료형 변수 = (조건식1) ? (조건식2 ? 참일때 : 거짓일때) : 거짓일때  ;
		//      자료형 변수 = (조건식1) ? 참일 때 : (조건식2 ? 참일때 : 거짓일때)  ;
		
		// int k1 이 90이상이면 "A 학점", 80이상이면 "B학점", 나머지 "F학점"
		int k1 = 99;
		String str = (k1 >= 90) ? "A 학점" : ((k1 >= 80 ? "B학점" : "F학점"));
		System.out.println("결과 : " + str);
		
		// char k2가 대문자인지, 소문자인지, 기타 문자인지 판별하자
		char k2 = 'g';
		String str2 = (k2 >= 'A' && k2<='Z') ? "대문자" : ((k2 >= 'a' && k2 <='z') ? "소문자" : "기타문자");
		System.out.println("결과 : " + str2);

		// int k3가 1또는 3이면 남자, 2또는 4이면 여자, 나머지는 외국인
		int k3 = 1;
		String str3 = (k3 == 1 || k3 == 3) ? "남자" : (k3 == 2 || k3 == 4 ? "여자" : "외국인") ;
		System.out.println("결과 : " + str3);

		// 두 수 중 큰 수를 구하자
		int su1 = 4;
		int su2 = 9;
		int su3 = (su1 > su2) ? su1 : su2;
		System.out.println(su1 + "과 " + su2 + "중 "+ su3 + "가 크다");
		
		int su4 = Math.max(su1, su2);
		System.out.println(su1 + "과 " + su2 + "중 "+ su4 + "가 크다");
		
	}

}
