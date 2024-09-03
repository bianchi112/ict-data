package com.ict.day05;

public class Ex02 {

	public static void main(String[] args) {
		// while 문 : for 문과 같은 반복문
		// 형식1}
		// 	  초기식 또는 현재 변수
		//	  while(조건식){
		//		조건식이 참일 때 실행하는 문장 ;
		//		조건식이 참일 때 실행하는 문장 ;
		//		조건식이 참일 때 실행하는 문장 ;
		//		증감식
		//	  }
		// while 문의 끝을 만나면 조건식으로 간다.
		for (int i = 1; i < 11; i++) {
			System.out.println(i);
		}
		System.out.println();
		
		int k = 1;
		while (k < 11) {
			System.out.print(k);
			k++;
		}
		System.out.println();
		
		System.out.println("----------------------");
		
		// 10-20 까지 출력
		int k1=10;
		while(k1<=20) {
			System.out.print(k1+" ");
			k1++;
		}
		
		System.out.println("\n----------------------");
		// 10-20까지 짝수만 출력
		int k2 = 10;
		while (k2 <= 20) {
			if (k2 % 2 == 0) {
				System.out.print(k2 + " ");
			}
			k2++;
		}
		System.out.println("\n----------------------");
		// 5단 출력
		int dan = 5;
		int k3 = 1;
		while (k3 <= 9) {
			System.out.println(dan + " * " + k3 + " = " + (dan * k3));
			k3++;
		}
		System.out.println("\n----------------------");
		
		// 1-10까지 홀수의 합과 짝수의 합
		int k4 = 1;
		int even = 0;
		int odd = 0;
		while (k4 <= 10) {
			if (k4 % 2 == 0) {
				even = even + k4;
			} else if (k4 % 2 != 0) {
				odd = odd + k4;
			}
			k4++;
		}
		System.out.println("짝수의 합 : " + even);
		System.out.println("홀수의 합 : " + odd);
		
	}

}
