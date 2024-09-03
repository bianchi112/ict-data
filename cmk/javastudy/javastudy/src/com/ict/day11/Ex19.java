package com.ict.day11;

import java.util.Scanner;

public class Ex19 {
	public static void main(String[] args) {
		// 음료수 객체 배열 생성
		Ex17 coffee = new Ex17("커피", 1800);
		Ex17 ion = new Ex17("이온", 2300);
		Ex17 cola = new Ex17("탄산", 2000);

		Ex17[] arr = { coffee, ion, cola };
		Scanner scan = new Scanner(System.in);

		System.out.print("금액 투입 >> ");
		int input = scan.nextInt();
		// 잔돈
		int pay = input;

		System.out.println("선택 가능한 음료 : ");
		for (int i = 0; i < arr.length; i++) {
			if (pay >= arr[i].getPrice()) {
				System.out.println((i + 1) + "." + arr[i].getName() + "(" + arr[i].getPrice() + "원)");
			}
		}
		System.out.println();

		while (pay > 0) {
			System.out.print("음료 선택 >> ");
			int choice = scan.nextInt();
			// 입력한 숫자 0 보다는 크고 배열 갯수보다는 작아야 한다.
			// 잔돈이 음료수 값 보다는 커야 한다.
			if (choice < 1 || choice > arr.length || pay < arr[choice - 1].getPrice()) {
				continue;
			}

			Ex17 drink = arr[choice - 1];
			pay = pay - drink.getPrice();
			System.out.println(drink.getName() + "를 선택하셨습니다.");
			System.out.println("남은 잔돈 : " + pay + "원");

			// 남은 잔돈으로 더 구매할 수 있는 음료 표시
			boolean payChk = false;
			for (int i = 0; i < arr.length; i++) {
				if (pay >= arr[i].getPrice()) {
					if (!payChk) {
						System.out.println("남은 금액으로 구매 가능한 음료 : ");
					}
					System.out.println((i + 1) + "." + arr[i].getName() + "(" + arr[i].getPrice() + "원)");
					payChk = true;
				}
			}
			if (!payChk) {
				break;
			
			}

			// 추가 구매 여부 확인
			System.out.print("더 구매할까요?(1.예 / 2.아니오) >> ");
			int result = scan.nextInt();
			// 1이 아니면 아니오 선택 => 탈출
			if (result != 1) {
				break;
			}

		}
		// 잔돈 반환
		System.out.println("종료합니다.");
		System.out.println("잔돈 : " + pay + "원");
	}
}