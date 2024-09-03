package com.ict.day05;

public class Ex05 {
	public static void main(String[] args) {
		// do ~ while 문 : while 과 같은 반복문 (선 처리, 후 비교) 
		// 				  한번은 무조건 실행 된다.
		/* 형식) 초기식;
		 		do {
		 		   실행할 문장;
		 		   실행할 문장;
		 		   실행할 문장;
		 		   증감식;
		 		  }while(조건식);
		 */
		// 1-10 까지 출력
		int i =1;
		
		do {
			System.out.println(i+" ");
			i++;
		}while(i<11);
		System.out.println();
		
		// 1-10 까지 홀수의 합과 짝수의 합을 구하자
		i=1;
		int even=0;
		int odd = 0;
		do {
			if(i%2==0) {
				even = even+i;
			}else {
				odd = odd+i;
			}
			i++;
		}while(i<11);
		System.out.println("짝수의 합 : " + even);
		System.out.println("홀수의 합 : " + odd);
		
		// for 문 무한 루프
//		for (;;) {
//			System.out.println("101");
//		}
	
		System.out.println("수고하셨습니다.");
		
	}
}
