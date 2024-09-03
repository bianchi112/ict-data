package com.ict.day07;

import java.util.Scanner;

public class Ex05 {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("학생 수 : ");
		int cnt = scan.nextInt();
		// 아래서 nextLine() 바로 사용하기 때문에 입력버퍼에 남아있는 \n를 지워줘야 한다. 
		scan.nextLine();
		
		String[] name = new String[cnt];
		int[] kor = new int[cnt];
		int[] eng = new int[cnt];
		int[] math = new int[cnt];
		int[] sum = new int[cnt];
		double[] avg = new double[cnt];
		String[] hak = new String[cnt];
		int[] rank = new int[cnt];

		for (int i = 0; i < rank.length; i++) {
			System.out.print("이름,국어,영어,수학 입력 >> ");
//          구분자를 ,
//		    String str = scan.next();
//			String[] in =  str.split(",");
//			name[i] = in[0];
//			kor[i] = Integer.parseInt(in[1]);
//			eng[i] = Integer.parseInt(in[2]);
//			math[i] = Integer.parseInt(in[3]);
			
			// 구분자를 띄어쓰기 
			String str = scan.nextLine();
			System.out.println("str : " + str);
			String[] in =  str.split(" ");
			name[i] = in[0];
			kor[i] = Integer.parseInt(in[1]);
			eng[i] = Integer.parseInt(in[2]);
			math[i] = Integer.parseInt(in[3]);
			sum[i] = kor[i] + eng[i] + math[i];
			avg[i] = (int) (sum[i] / 3.0 * 100) / 100.0;
			if (avg[i] >= 90) {
				hak[i] = "A학점";
			} else if (avg[i] >= 80) {
				hak[i] = "B학점";
			} else if (avg[i] >= 70) {
				hak[i] = "C학점";
			} else {
				hak[i] = "F학점";
			}
			// 순위 초기값
			rank[i] = 1;
		}
		// 순위 구하기 
		for (int i = 0; i < rank.length; i++) {
			for (int j = 0; j < rank.length; j++) {
				if(sum[i] < sum[j]) {
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
			System.out.println(rank[i]);
		}
	}
}
