package com.ict.day01;

public class Ex03 {

	public static void main(String[] args) {
		// 기본 자료형 : 논리형 = boolean
		// 논리형에 사용할 수 있는 데이터 : true, false
		
		// 변수 선언 (변수 만들기)
		// 자료형 이름 ;
		
		// 변수에 데이터 넣기
		// 변수이름 = 데이터(선언한 자료형에 맞는 데이터);
		// = 같다라는 의미가 아니다. 
		// 저장, 대입한다라는 의미
		boolean bo;
		bo = true;
		// 변수를 호출(출력)하면 변수에 저장된 데이터가 나온다.
		System.out.println(bo);
		
		// 변수이므로 다른 데이터를 저장할 수 있다. 
		
		// 선언은 한번만 더 하면 오류발생
		// boolean bo;
		bo = false;
		System.out.println(bo);
		System.out.println();
		// 선언과 대입(저장)을 한번에 
		boolean bo2 = false;
		System.out.println(bo2);

		bo2 = true;
		System.out.println(bo2);
		
	}

}
