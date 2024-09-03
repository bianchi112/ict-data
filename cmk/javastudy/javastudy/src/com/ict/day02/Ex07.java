package com.ict.day02;

public class Ex07 {

	public static void main(String[] args) {
		// 2시간 40분 30초를 초로 환산하자 (몇 초일까?)
		int h = 2 * 60 * 60; // 시간 * 60 * 60 => 초
		int m = 40 * 60;	 // 분 * 60 => 초
		int s = 30;			 // 초
		
		int total = h + m + s;
		System.out.println("2시간 40분 30초는 " + total + "초 입니다.");
		

	}

}
