package com.ict.day06;

public class Ex02 {

	public static void main(String[] args) {
		// 배열의 선언과 생성을 한번에 하자
		// 자료형[] 이름 = new 자료형[배열크기];

		// 배열의 선언과 생성을 한번에 하자
		char[] ch = new char[4];

		// 데이터 넣기
		ch[0] = 'a';
		ch[1] = 97; // 0-65535;
		ch[2] = 'v';
		ch[3] = 'G';

		// 특정 하나만 출력
		System.out.println(ch[1]);
		System.out.println("=========================");
		// 모두 출력에서 처리
		for (int i = 0; i < ch.length; i++) {
			System.out.println(ch[i]);
		}
		System.out.println();

		String[] names = new String[4];
		names[0] = "홍길동";
		names[1] = "고길동";
		names[2] = "김길동";
		names[3] = "박길동";

		for (int i = 0; i < names.length; i++) {
			System.out.println(names[i]);
		}

	}

}
