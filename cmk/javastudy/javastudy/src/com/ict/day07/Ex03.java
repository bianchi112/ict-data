package com.ict.day07;

public class Ex03 {

	public static void main(String[] args) {
		String[] name = { "홍", "김", "이", "박", "고" };
		int[] kor = { 80, 90, 80, 70, 100 };
		int[] eng = { 85, 95, 95, 75, 100 };
		int[] math = { 100, 100, 80, 70, 100 };

		int[] sum = { 0, 0, 0, 0, 0 };
		double[] avg = { 0.0, 0.0, 0.0, 0.0, 0.0 };
		String[] hak = { "A", "A", "A", "A", "A" };
		int[] rank = { 1, 1, 1, 1, 1 };

		// 총점, 평균, 학점 구하기
		for (int i = 0; i < rank.length; i++) {
			for (int j = 0; j < rank.length; j++) {
				sum[i] = kor[i] + eng[i] + math[i];
				avg[i] = (int) (sum[i] / 3.0 * 100) / 100.0;
				if (avg[i] >= 90) {
					hak[i] = "A학점";
				} else if (avg[i] >= 80) {
					hak[i] = "B학점";
				} else if (avg[i] > 70) {
					hak[i] = "C학점";
				} else {
					hak[i] = "D학점";
				}

			}
		}
		// 순위 구하기
		for (int i = 0; i < rank.length; i++) {
			for (int j = 0; j < rank.length; j++) {
				if (sum[i] < sum[j]) {
					rank[i]++;
				}
			}
		}

		// 출력하기
		System.out.println("이름\t총점\t평균\t학점\t순위");
		for (int i = 0; i < rank.length; i++) {
			System.out.print(name[i] + "\t");
			System.out.print(sum[i] + "\t");
			System.out.print(avg[i] + "\t");
			System.out.print(hak[i] + "\t");
			System.out.println(rank[i] + "\t");
		}

	}

}
