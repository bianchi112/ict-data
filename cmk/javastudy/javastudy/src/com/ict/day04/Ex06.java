package com.ict.day04;

public class Ex06 {

	public static void main(String[] args) {
		// for 문 : 정해진 규칭에 따라 실행문을 반복처리
		// 조건식이 참일 때 실행, 거짓이면 실행 하지 않음

		// for(초기식 ; 조건식 ; 증감식 ; ){
		// 조건식이 참일 때 실행 할 문장 ;
		// 조건식이 참일 때 실행 할 문장 ;
		// 조건식이 참일 때 실행 할 문장 ;
		// }

		// 진행 순서
		// 1. for 문을 만나면 무조건 초기식으로 간다.
		// 2. 초기식에서 조건식으로 간다.
		// 3. 조건식이 참이면 for 문을 실행 한다.
		// 조건식이 거짓이면 for 문을 실행하지 않는다.
		// 4. for 문의 끝을 만나면 증감식으로
		// 5. 증감을 한 후 조건식으로 간다.

		// 3. 조건식이 참이면 for 문을 실행 한다.
		// 조건식이 거짓이면 for 문을 실행하지 않는다.

		// 자바에서는 블록({})안에서 만든 변수는 블록 밖에서는 사용 불가

		for (int i = 0; i < 5; i++) {
			System.out.println(i);
			System.out.println("안녕하세요");
			System.out.println("------------------");
		}
		System.out.println();

		// 10-20까지 출력하자
		for (int i = 10; i <= 20; i++) {
			System.out.println(i);
		}

		System.out.println("-------------------");

		// 10-20까지 짝수만 출력
		for (int i = 10; i <= 20; i += 2) {
			System.out.println(i);
		}

		System.out.println("-------------------");

		for (int i = 10; i <= 20; i++) {
			if (i % 2 == 0) {
				System.out.println(i);
			}
		}

		System.out.println("-------------------");

		// 10-20까지 홀수만 출력
		for (int i = 10; i <= 20; i++) {
			if (i % 2 != 0) {
				System.out.println(i);
			}
		}

		System.out.println("--------------------");
		// 1-100 7의 배수
		for (int i = 1; i <= 100; i++) {
			if (i % 7 == 0) {
				System.out.println(i);
			}
		}

		System.out.println("--------------------");

		// 5단 출력
		for (int i = 1; i <= 9; i++) {
			System.out.println("5 * " + i + " = " + 5 * i);
		}

		System.out.println("--------------------");

		for (int i = 0; i < 4; i++) {
			System.out.println("0 0 0 0");
		}

		System.out.println("--------------------");

		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				System.out.print("0");
			}
			System.out.println();
		}

		System.out.println("--------------------");

		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				if (i == j) {
					System.out.print("1");
				} else {
					System.out.print("0");
				}
			}
			System.out.println();
		}
		System.out.println("--------------------");

		// 누적합 : 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
		int sum = 0; // 이전 값을 기억하는 변수
		for (int i = 1; i < 11; i++) {
			sum = sum + i;
		}
		System.out.println("결과 : " + sum);

		System.out.println("--------------------");

		// 1-10 까지 홀수의 합과 짝수의 합을 각각 구하자
		int even = 0;
		int odd = 0;
		for (int i = 1; i < 11; i++) {
			if (i % 2 == 0) {
				even = even + i;
			} else if (i % 2 != 0) {
				odd = odd + i;
			}
		}
		System.out.println("짝수 : " + even);
		System.out.println("홀수 : " + odd);

		System.out.println("--------------------");

		// 7!( 7 * 6 * 5 * 4 * 3 * 2 * 1 )
		int total = 1;
		for (int i = 7; i > 0; i--) {
			total = total * i;
		}
		System.out.println(total);

		System.out.println("--------------------");

		

		System.out.println("--------------------");

	}

}
