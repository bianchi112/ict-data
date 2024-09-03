package com.ict.day08;

public class Ex01 {

	public static void main(String[] args) {
		// 다차원 배열 : 1차원 배열이 여러 개 모인 것
		// 종류 : 기본 자료형 배열(기본자료형을 배열에 담는다),
		// 객체형배열(참조자료형 배열 = 클래스를 배열에 담는다)
		// 고정길이 배열, 가변길이 배열

		// 고정길이배열
		// 1. 선언 : 자료형[][] 이름 ; 또는 자료형 이름[][]
		int[][] su;

		// 2. 생성 : 이름 = new 자료형[1차원배열크기][1차원배열안에 있는 배열의 크기]
		su = new int[2][3];
		su[0][0] = 100;
		su[0][1] = 200;
		su[0][2] = 300;
		
		su[1][0] = 1000;
		su[1][1] = 2000;
		su[1][2] = 3000;
//		su[1][3] = 4000; //java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
		
		// 주소 확인
		System.out.println(su);
		System.out.println(su[0]);
		System.out.println(su[1]);
		
		// 데이터 확인
		System.out.println(su[0][0]);
		System.out.println(su[0][1]);
		System.out.println(su[0][2]);
		System.out.println(su[1][0]);
		System.out.println(su[1][1]);
		System.out.println(su[1][2]);
		System.out.println();
		
		// 2차원 배열은 다중 for 문을 이용한 데이터 출력
		for (int i = 0; i < su.length; i++) {
			for (int j = 0; j < su[1].length; j++) {
				System.out.println(su[i][j]);	
			}
		}
		

	}

}
