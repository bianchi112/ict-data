package com.ict.day05;

import java.util.Scanner;

public class Ex09 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		exit: while (true) {
			System.out.print("숫자 입력 : ");
			int su = scan.nextInt();
			String res = "";
			if (su % 2 == 0) {
				res = "짝수";
			} else {
				res = "홀수";
			}
			System.out.println(su + "는 " + res + "입니다");

			while (true) {
				System.out.print("계속할까요?(1.yes, 2.no) >> ");
				int result = scan.nextInt();
				if (result == 1) {
					continue exit;
				} else if (result == 2) {
					break exit;
				} else {
					System.out.println("제대로 입력하세요");
					continue;
				}
			}
		}
		System.out.println("수고하셨습니다.");
	}
}
