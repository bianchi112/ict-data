package com.ict.day10;

public class Ex05 {

	int cnt1 = 0;
	static int cnt2 = 0;
	
	// cnt1 의 값을 1 증가 시키는 메서드 (인스턴스)
	public void countUp() {
		cnt1 = cnt1+1;
	}
	
	
	// cnt2 의 값을 1 증가시키는 메서드 (static)
	public static void countUp2() {
		cnt2 = cnt2 + 1;	
	}
}
