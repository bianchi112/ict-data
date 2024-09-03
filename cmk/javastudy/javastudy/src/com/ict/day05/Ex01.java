package com.ict.day05;

public class Ex01 {

	public static void main(String[] args) {
		// 다중 for문 (중첩 for) : for 문 안에 또 다른 for 문이 존재하는 것
		/*
		 for(초기식; 조건식; 증감식){
		 	 조건식1이 참일때 실행 할 문장 ;
		 	 조건식1이 참일때 실행 할 문장 ;
		 	 for(초기식2; 조건식2; 증감식2){
		 	 	 조건식2가 참일 때 실행 할 문장;
		 	 }
		 	 조건식1이 참일때 실행 할 문장 ;
		 	 조건식1이 참일때 실행 할 문장 ;
		  }
		 */
		
		for (int i = 0; i < 4; i++) {
			System.out.println("명령문1");

			for (int j = 0; j < 6; j++) {
				System.out.println("i=" + i + ", j=" + j);
			}

			System.out.println("명령문2");
		}

		System.out.println("------------------------");
		
		for (int dan = 2; dan <= 9; dan++) {
            System.out.println(dan + "단");
            System.out.println("==========");
            for (int i = 1; i <= 9; i++) {
                System.out.println(dan + " * " + i + " = " + (dan * i));
            }
            System.out.println();			
		}

		System.out.println("------------------------");

		for (int dan = 2; dan <= 9; dan++) {
			System.out.println(dan + "단");
			System.out.println("==========");
			for (int i = 1; i <= 9; i++) {
				System.out.print(dan + " * " + i + " = " + (dan * i));
			}
			System.out.println();
		}

		System.out.println("------------------------");
		
		for (int i = 1; i <= 9; i++) {
			for (int dan = 2; dan <= 9; dan++) {
				System.out.print(dan + " * " + i + " = " + (dan * i));
				if (dan < 9) {
					System.out.print("  ");
				}
			}
			System.out.println();
		}
		System.out.println("------------------------");

		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				System.out.print("0 ");
			}
			System.out.println();
		}

		System.out.println("------------------------");
		
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				if (i == j) {
					System.out.print("1 ");
				} else if (i != j) {
					System.out.print("0 ");
				}
			}
			System.out.println();
		}
		
		
		System.out.println("------------------------");

		// 짝수단만 출력
		for (int i = 2; i < 10; i++) {
			if (i % 2 == 0) {
				for (int j = 1; j < 10; j++) {
					System.out.println(i + " * " + j + " = " + (i * j) + " ");
				}
				System.out.println();
			}
		}

		System.out.println("------------------------");

	}

}
