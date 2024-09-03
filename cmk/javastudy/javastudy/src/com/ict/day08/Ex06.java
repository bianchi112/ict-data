package com.ict.day08;

import java.util.Iterator;
import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		System.out.print("학생 수 : ");
		int cnt = scan.nextInt();

		String[][] arr = new String[cnt][8];
		for (int i = 0; i < arr.length; i++) {
			// arr 2차원 배열에 넣을 1차원 배열 : 한사람 정보를 담은 배열
			String[] p = new String[8];

			System.out.print("이름 : ");
			p[0] = scan.next();

			System.out.print("국어 : ");
			p[1] = scan.next();

			System.out.print("영어 : ");
			p[2] = scan.next();

			System.out.print("수학 : ");
			p[3] = scan.next();

			int kor = Integer.parseInt(p[1]);
			int eng = Integer.parseInt(p[2]);
			int math = Integer.parseInt(p[3]);
			int sum = kor + eng + math;

			p[4] = String.valueOf(sum);

			double avg = (int) (sum / 3.0 * 100) / 100.0;

			p[5] = String.valueOf(avg);

			// 학점
			if (avg >= 90) {
				p[6] = "A";
			} else if (avg >= 80) {
				p[6] = "B";
			} else if (avg >= 70) {
				p[6] = "C";
			} else {
				p[6] = "F";
			}
			// 순위
			p[7] = "1";

			// 2차원 배열에 저장
			arr[i] = p;

		}

		// 순위
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr.length; j++) {
				if (Integer.parseInt(arr[i][4]) < Integer.parseInt(arr[j][4])) {
					int rank = Integer.parseInt(arr[i][7]);
					arr[i][7] = String.valueOf(++rank);
				}
			}
		}

		// 정렬
		// 임시
		String[] tmp = new String[8];
		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (Integer.parseInt(arr[i][7]) > Integer.parseInt(arr[j][7])) {
					tmp = arr[i];
					arr[i] = arr[j];
					arr[j] = tmp;
				}
			}
		}

		// 출력
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}

	}
}
