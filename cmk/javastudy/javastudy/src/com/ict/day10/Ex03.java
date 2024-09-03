package com.ict.day10;

public class Ex03 {
	String name = "홍길동";
	static int kor = 85;
	static int eng = 85;
	static int math = 85;
	static int sum = 0;

	// static 메서드
	public static void play01() {
		// sum, kor, eng, math 가
		// static 메서드에서는 인스턴스 변수를 사용할 수 없다.
		sum = kor + eng + math;
	}

	public static int play02() {
		// 메서드 안에서 선언한 변수는 지역변수라고 하자
		// 그래서 k는 지역변수이다.
		// 메서드 안에서 만들어진 k는 메서드가 끝나서
		// 자기를 호출한 곳으로 되돌아 갈때 사라진다.
		int k = kor + eng + math;
		return k;
	}
	/*
	public static int play03() {
		// 지역 변수를 static 으로 사용 할 수 없다.
		static int q = kor + eng+math;
		return 1;
	}
	*/

}
