package com.ict.day07;

import java.util.Scanner;

public class Ex04 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("학생 수 : ");
		int cnt = sc.nextInt();
//		sc.nextLine(); // 버퍼 지우기

		String[] name = new String[cnt];
		int[] kor = new int[cnt];
		int[] eng = new int[cnt];
		int[] math = new int[cnt];

		int[] sum = new int[cnt];
		double[] avg = new double[cnt];
		String[] hak = new String[cnt];
		int[] rank = new int[cnt];

		// 학생들의 정보 입력 받기
		for (int i = 0; i < cnt; i++) {
			System.out.print((i + 1) + "번째 학생 이름 : ");
			name[i] = sc.next(); // .nextLine()을 쓰면 버퍼를 지워줘야 한다.

			System.out.print(name[i] + "의 국어 점수 : ");
			kor[i] = sc.nextInt();

			System.out.print(name[i] + "의 영어 점수 : ");
			eng[i] = sc.nextInt();

			System.out.print(name[i] + "의 수학 점수 : ");
			math[i] = sc.nextInt();

//			sc.nextLine();	

			// 총점과 평균 계산
			sum[i] = kor[i] + eng[i] + math[i];
			avg[i] = (int) (sum[i] / 3.0 * 100) / 100.0;
			// 학점 계산
			if (avg[i] >= 90) {
				hak[i] = "A학점";
			} else if (avg[i] >= 80) {
				hak[i] = "B학점";
			} else if (avg[i] >= 70) {
				hak[i] = "C학점";
			} else {
				hak[i] = "D학점";
			}
		}

		// 순위 구하기
		for (int i = 0; i < cnt; i++) {
			rank[i] = 1; // 초기 순위를 1로 설정

			for (int j = 0; j < cnt; j++) {
				if (sum[i] < sum[j]) {
					rank[i]++;
				}
			}
		}

		// 출력하기
		System.out.println("이름\t총점\t평균\t학점\t순위");
		for (int i = 0; i < cnt; i++) {
			System.out.print(name[i] + "\t");
			System.out.print(sum[i] + "\t");
			System.out.print(avg[i] + "\t");
			System.out.print(hak[i] + "\t");
			System.out.println(rank[i]);
		}
	}
}
