package com.ict.day09;

public class Ex02 {
	// 클래스 구성요소 : 멤버필드, 멤버메서드, 생성자
	// 멤버필드 : 데이터, 상태값, 속성
	//		   변수 : 언제 변경할 수 있는 상태, 메모리 상태
	// 		   상수 : 한번 지정되면 변경할 수 없는 상태, 메모리상태

	// instance 변수와 static 변수
	// instance 변수 : 객체 생성할 때 같이 생성된 변수
	//		호출 방법 : 참조변수.변수 이름
	
	// static 변수 : 객체 생성과 상관없이 미리 만들어진 변수	
	//	   호출방법 : 클래스이름.변수이름
	// static 은 반드시 static 이라고 표시한다.

	// final 변수 => 상수
	// static 변수 => static
	String name = "홍길동";		 // instance 변수
	final int SUM = 280; 	 	 // instance 상수
	static double avg = 93.33;	 // static 변수
	static final char HAK = 'A'; // static 상수
	
	
}
