package com.ict.day08;

public class Ex04 {

	public static void main(String[] args) {
		int[][] arr = new int[5][8];

		// 1명의 모든 정보가 들어간다.(String 이라 안됨)
		// 번호, 총점, 평균, 학점, 순위
		int[] p1 = { 1, 90, 90, 90, 270, 90, 'A', 1 };
		int[] p2 = { 2, 80, 80, 80, 240, 80, 'B', 1 };
		int[] p3 = { 3, 100, 100, 100, 300, 100, 'A', 1 };
		int[] p4 = { 4, 85, 85, 85, 255, 85, 'B', 1 };
		int[] p5 = { 5, 70, 70, 70, 210, 70, 'C', 1 };

		arr[0] = p1;
		arr[1] = p2;
		arr[2] = p3;
		arr[3] = p4;
		arr[4] = p5;

		// 순위
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr.length; j++) {
				if (arr[i][4] < arr[j][4]) {
					arr[i][7]++;
				}
			}
		}

		
		// 정렬하기(각 사람의 순위를 이용해서)
		int[] tmp = new int[8]; //임시 저장
		
		// 정렬
		for (int i = 0; i < arr.length; i++) {
			for (int j = i+1; j < arr.length; j++) {
				if(arr[i][7] > arr[j][7]) {
					tmp = arr[i];
					arr[i] = arr[j];
					arr[j] = tmp;
							
				}
			}
		}
		
		// 출력하기
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				if (j == 6) {
					System.out.print((char) arr[i][j] + " ");
				} else {
					System.out.print(arr[i][j] + " ");
				}
			}
			System.out.println();
		}

	}

}
