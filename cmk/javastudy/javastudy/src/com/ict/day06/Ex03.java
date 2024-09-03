package com.ict.day06;

public class Ex03 {

	public static void main(String[] args) {
		// 배열의 선언, 생성, 초기값(데이터저장) 까지 한번에 처리
		char[] ch = { 'j', 'a', 'v', 'a' };
		int[] su = { 10, 20, 30, 40, 50 };
		double[] num = { 12.25, 154.21 };
		String[] str = { "둘리", "희동이", "마이콜" };

		for (int i = 0; i < ch.length; i++) {
			System.out.println(ch[i]);
		}
		System.out.println("====================");

		for (int i = 0; i < su.length; i++) {
			System.out.println(su[i]);
		}

		System.out.println("====================");

		for (int i = 0; i < num.length; i++) {
			System.out.println(num[i]);
		}
		
		System.out.println("====================");

		for (int i = 0; i < str.length; i++) {
			System.out.println(str[i]);
		}
	}

}
