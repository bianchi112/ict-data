package com.ict.day05;

public class Ex08 {
	public static void main(String[] args) {
		// break label : 레이브이 지정한 반복문 탈출
		// continue label : 레이블이 지정한 반복문의 증감식으로 간다.

		// 레이블지정: 특정 반복문 앞에 "이름" 붙이면 된다.
		// 레이블 다음에는 반복문 만 올 수 있다.

		// for 문이 하나일때는 레이블을 사용하나 하지 않나 같은 결과가 나온다.
		for (int i = 1; i < 11; i++) {
			System.out.print(i + " ");
		}
		System.out.println();

		for (int i = 1; i < 11; i++) {
			if (i == 6)
				break;
			System.out.print(i + " ");
		}
		System.out.println();

		a: for (int i = 1; i < 11; i++) {
			if (i == 6)
				break a;
			System.out.print(i + " ");
		}
		System.out.println();
		System.out.println("-----------------------");

		// for 문이 여러개가 중첩이면 레이블을 사용한것과 사용하지 않은 것이 다르다.
		// 결론 레이블은 반복문이 중첩일 때 사용
		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		System.out.println();

		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2)
					break;
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		System.out.println();
		
		b:for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2)
					break b;
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		System.out.println();
		System.out.println("---------------");
		
		System.out.println();

		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2)
					continue;
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		System.out.println();
		
		c:for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2)
					continue c;
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		System.out.println();

	}
}
