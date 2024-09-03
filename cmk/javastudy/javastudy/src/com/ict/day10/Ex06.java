package com.ict.day10;

public class Ex06 {

	public static void main(String[] args) {
		Ex05 t1 = new Ex05();
		t1.countUp();
		t1.countUp2();
		
		t1.countUp();
		t1.countUp2();
		
		t1.countUp();
		t1.countUp2();
		
		System.out.println("cnt1 : " + t1.cnt1);
		System.out.println("cnt2 : " + t1.cnt2);
		System.out.println("=================");
		
		Ex05 t2 = new Ex05();
		System.out.println("cnt1 : " + t2.cnt1);
		System.out.println("cnt2 : " + t2.cnt2);
		
		t2.countUp();
		t2.countUp2();
		System.out.println("cnt1 : " + t2.cnt1);
		System.out.println("cnt2 : " + t2.cnt2);
		System.out.println("=================");
		
		Ex05 t3 = new Ex05();
		System.out.println("cnt1 : " + t3.cnt1);
		System.out.println("cnt2 : " + t3.cnt2);
		
	}

}
