package com.ict.day10;

public class Ex12 {
	private String name = "";
	private int sum = 0;
	private double avg = 0.0;
	private String hak = "";

	// 이름
	public String play01(String k1) {
		name = k1;
		return name;
	}

	// 총점 = 국어, 영어, 수학
	public int play02(int k1, int k2, int k3) {
		sum = k1 + k2 + k3;
		return sum;
	}

	// 평균 ( 총점을 받아서 처리)
	public double play03(int k1) {
		avg = (int) (sum / 3.0 * 10) / 10.0;
		return avg;
	}

	// 학점 (평균을 받아서 처리)
	public String play04(double k1) {
		if (k1 >= 90) {
			hak = "A학점";
		} else if (k1 >= 80) {
			hak = "B학점";
		} else if (k1 >= 70) {
			hak = "C학점";
		} else {
			hak = "F학점";
		}
		return hak;
	}

	// 출력
	public String play05() {
		return "이름 : " + name + "\n총점 : " + sum + "\n평균 : " + avg + "\n 학점 : " + hak;
	}
	
	public void play06(String k1, int k2, double k3, String k4) {
		System.out.println("Ex02");
		System.out.println("main");
		System.out.println("이름 : " + k1);
		System.out.println("총점 : " + k2);
		System.out.println("평균 : " + k3);
		System.out.println("학점 : " + k4);
	}

}
