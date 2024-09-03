package com.ict.day01;

public class Ex04 {

	public static void main(String[] args) {
		// 문자형 = char
		// 저장은 숫자로 저장된다.(0-65535)
		// 만약 문자를 사용하려면 홑따옴표를 사용해야 한다.
		// 그리고 한글자에만 사용가능
		
		// 선언
		char ch1;
		// 아스키코드는 영어 대소문자, 숫자(0-9), 일부 특수문자를 표현
		ch1 = 97 -32;
		
		char ch2 = 'a';

		char ch3 = '가';
		
		// 유니코드 전 세계문자를 표현할 수 있는 문자코드
		char ch4 = '\uD55C';
		
		System.out.println(ch1);
		System.out.println(ch2);
		System.out.println(ch3);
		System.out.println(ch4);
				
		
	}

}
