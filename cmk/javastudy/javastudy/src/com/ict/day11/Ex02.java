package com.ict.day11;

public class Ex02 {
	public static void main(String[] args) {
		Ex01 t = new Ex01();

		int s1 = 100;
		int s2 = t.add(s1);

		System.out.println("s1 : " + s1);
		System.out.println("s2 : " + s2);
		System.out.println("=======");

		int[] s3 = { 10, 20, 30, 40, 50 };
		t.add2(s3);
		;
		for (int i = 0; i < s3.length; i++) {
			System.out.println(s3[i]);
		}
	}
}
