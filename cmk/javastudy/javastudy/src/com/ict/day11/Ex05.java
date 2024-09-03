package com.ict.day11;

public class Ex05 {
	private String name ="";
	private int price =  0;
	
	// 변수들이 private 이므로 외부에서 접근 불가 
	// => 메서드를 만들어서 내부에서 접근하자
	
	// name 값을 변경
	public void play01(String k1) {
		name =k1;
	}
	// price 값을 변경
	public void play02(int k1) {
		price = k1;
	}
	
	// name을 보내자
	public String play03() {
		return name;
	}
	public int play04() {
		return price;
	}
}
