package com.ict.day08;

public class Ex02 {

	public static void main(String[] args) {
		// 선언과 생성을 하나로
		// 자료형[][] 이름 = new 자료형[1차원배열의 크기][1차원배열안에 있는 배열의 크기]
		System.out.println("고정길이 일때만 사용 가능");
		char[][] ch = new char[3][2];
		ch[0][0] = 'a';
		ch[0][1] = 'A';

		ch[1][0] = 'b';
		ch[1][1] = 'B';

		ch[2][0] = 'c';
		ch[2][1] = 'C';

		for (int i = 0; i < ch.length; i++) {
			for (int j = 0; j < ch[i].length; j++) {
				System.out.println(ch[i][j]);
			}
		}
		System.out.println();
		System.out.println("고정길이, 가변길이 모두 사용가능");
		int[][] su = new int[3][2];
		
		int[] k1 = {10,20};
		int[] k2 = {100,200};
		int[] k3 = {1000,2000};
		
		System.out.println(su);
		System.out.println(k1);
		System.out.println(k2);
		System.out.println(k3);
		
		su[0] = k1;
		su[1] = k2;
		su[2] = k3;
		System.out.println();
		System.out.println(su[0]);
		System.out.println(su[1]);
		System.out.println(su[2]);
		
		// 출력
		for (int i = 0; i < su.length; i++) {
			for (int j = 0; j < su[i].length; j++) {
				System.out.println(su[i][j]);
			}
		}
		
		System.out.println("===========================");
		// 선언, 생성, 데이터저장을 한번에
		// int[] num = {10,20,30,40};
		int[][] num = {{40,10},{80,60},{10,100},{50,500}};

	}

}

