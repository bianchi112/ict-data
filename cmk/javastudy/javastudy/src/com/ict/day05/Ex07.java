package com.ict.day05;

public class Ex07 {
	public static void main(String[] args) {
		// 다중 if 문에서 break, continue
		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2) {
					break;
				}
				System.out.println("i=" + i + ", j=	" + j);
			}
		}
		System.out.println();

		for (int i = 1; i < 4; i++) {
			if (i == 2) {
				break;
			}
			for (int j = 1; j < 6; j++) {
				System.out.println("i=" + i + ", j=	" + j);
			}
		}
		System.out.println();

		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (j == 2) {
					break;
				}
				System.out.println("i=" + i + ", j=	" + j);
			}
		}
		System.out.println("-----------------------");

		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (i == 2) {
					continue;
				}
				System.out.println("i=" + i + ", j=" + j);
			}
		}
		
		System.out.println();
		
		for (int i = 1; i < 4; i++) {
			if (i == 2) {
				continue;
			}
			for (int j = 1; j < 6; j++) {
				System.out.println("i=" + i + ", j=" + j);
			}
		}

		System.out.println();

		for (int i = 1; i < 4; i++) {
			for (int j = 1; j < 6; j++) {
				if (j == 2) {
					continue;
				}
				System.out.println("i=" + i + ", j=	" + j);
			}
		}	
		
		
		
		
		
	}
}
