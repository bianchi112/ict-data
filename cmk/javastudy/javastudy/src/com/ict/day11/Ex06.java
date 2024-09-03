package com.ict.day11;

import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {
		Ex05 coffee = new Ex05();
		coffee.play01("coffee");
		coffee.play02(1800);

		Ex05 ion = new Ex05();
		ion.play01("ion");
		ion.play02(2300);

		Ex05 cola = new Ex05();
		cola.play01("cola");
		cola.play02(2000);

		// 위 3개의 객체를 배열에 넣자
		// 모두 같은 클래스로 만든 객체 이어야 한다.
		Ex05[] arr = { coffee, ion, cola };

		Ex05[] arr2 = new Ex05[3];
		arr2[0] = coffee;
		arr2[1] = ion;
		arr2[2] = cola;

		Scanner scan = new Scanner(System.in);
		System.out.print("금액을 투입하세요 >>");
		int input = scan.nextInt();

		if (input < 1800) {
			System.out.println("금액이 부족합니다.");
			System.out.println("잔돈 : " + input);
		} else {
			System.out.println("1.커피\t2.이온\t3.탄산");

			// 각 음료수의 가격과 입력한 금액을 비교하자
			for (int i = 0; i < arr.length; i++) {
				if (input >= arr[i].play04()) {
					System.out.print("0\t");
				} else {
					System.out.print("X\t");
				}
			}
			System.out.println();
			System.out.print("선택하세요 >>");
			int res = scan.nextInt();
			int output = 0; // 잔돈
			switch (res) {
			case 1:
				output = input - arr[0].play04();
				break;
			case 2:
				output = input - arr[1].play04();
				break;
			case 3:
				output = input - arr[2].play04();
				break;
			}
			
			System.out.println("잔돈 : " + output);

		}

	}

}
