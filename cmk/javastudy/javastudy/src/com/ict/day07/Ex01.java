package com.ict.day07;

import java.util.Arrays;

public class Ex01 {
	public static void main(String[] args) {
		// 배열의 정렬하기
		int[] su = { 3, 4, 9, 8, 2, 1, 7, 10, 5, 6 };
		Arrays.sort(su);
		for (int i = 0; i < su.length; i++) {
			System.out.print(su[i] + " ");
		}
		System.out.println();

		int[] su2 = { 3, 4, 9, 8, 2, 1, 7, 10, 5, 6, 3 };
		int tmp = 0;
		for (int i = 0; i < su2.length - 1; i++) {
			for (int j = i + 1; j < su2.length; j++) {
				if (su2[i] < su2[j]) { // 오름차순(>), 내림차순(<)
					// 자리 변경
					tmp = su2[i];
					su2[i] = su2[j];
					su2[j] = tmp;
				}
			}
		}
		// 출력하기
		for (int i = 0; i < su2.length; i++) {
			System.out.print(su2[i] + " ");
		}

	}
}
