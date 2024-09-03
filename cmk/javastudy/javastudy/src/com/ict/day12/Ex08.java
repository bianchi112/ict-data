package com.ict.day12;

public class Ex08 {
	// this 와 this([인자])
	// this : 지역변수와 전역변수의 이름이 같을 때 전역 변수를 지정하려면 this.변수
	//		  객체 내부에서 객체 자신의 가리키는 예약어
	
	// this() : 객체 내부에서 객체 자신의 생성자를 지정할 때 사용하는 예약어
	// 			생성자가 다른 생성자를 호출 할 때 사용(메서트 처럼 인자에 맞는 생성자를 찾는다.)
	//			반드시 첫번째 줄에 존재해야 한다.
	private String name = "희동이";
	private int age = 3;
	
	public Ex08() {
		
		System.out.println("기본생성자 : " + this);
	}
}
