package com.ict.day08;

public class Ex03 {
	public static void main(String[] args) {
		// 가변길이
		// 1. 선언 : 자료형[][] 이름 ; 또는 자료형 이름[][];
		int[][] su;

		// 생성 : 이름 = new 자료형[1차원배열의 크기][]
		su = new int[3][];

		// 1차원 배열의 크기 없으면 오류 발생
		// su = new int[][];
		// su = new int[][2];

		// 데이터 입력 (고정길이처럼 => 오류)
//		su[0][0] = 10;
//		su[0][1] = 20;

//		su[1][0] = 100;
//		su[1][1] = 200;

//		su[2][0] = 1000;
//		su[2][1] = 2000;

		int[] k1 = { 10, 20 };
		int[] k2 = { 100, 200, 300, 400 };
		int[] k3 = { 1000, 2000, 3000 };

		su[0] = k1;
		su[1] = k2;
		su[2] = k3;

		for (int i = 0; i < su.length; i++) {
			for (int j = 0; j < su[i].length; j++) {
				System.out.println(su[i][j]);
			}
		}
		System.out.println();

		// 선언, 생성 한번에
		char[][] ch = new char[4][2];

		char[] c1 = { 'j', 'a', 'v', 'a' };
		char[] c2 = { 'j', 's', 'p' };
		char[] c3 = { 's', 'p', 'r', 'i', 'n', 'g' };
		char[] c4 = { 'r', 'e', 'a', 'c', 't' };

		ch[0] = c1;
		ch[1] = c2;
		ch[2] = c3;
		ch[3] = c4;
		
		for (int i = 0; i < ch.length; i++) {
			for (int j = 0; j < ch[i].length; j++) {
				System.out.print(ch[i][j]);
			}
			System.out.println();
		}
		System.out.println();
		
		char[][] ch2 = new char[4][];
		char[] c11 = "java".toCharArray();
		char[] c21 = "jsp".toCharArray();
		char[] c31 = "spring".toCharArray();
		char[] c41 = "react".toCharArray();
		
		ch2[0] = c11;
		ch2[1] = c21;
		ch2[2] = c31;
		ch2[3] = c41;
		
		for (int i = 0; i < ch2.length; i++) {
			for (int j = 0; j < ch2[i].length; j++) {
				System.out.print(ch2[i][j]);
			}
			System.out.println();
		}
		System.out.println();
		
	}
}
