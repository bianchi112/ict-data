package com.ict.day06;

public class Ex01 {
	public static void main(String[] args) {
		// 배열 : 같은 자료형의 데이터들을 한 곳에 모아둔 묶음
		// ** 같은 자료형 이어야 한다.
		// 생성할 때 크기를 지정해야 한다.(크기가 없으면 생성 안됨)
		// 한번 지정한 크기는 변경 할 수 없다.
		// 단, 복사등을 이용하면 크기가 변경된 배열을 만들 수 있다.
		// 배열 안에 데이터를 가져오기 위해서는 for 문을 사용

		// 배열 생성 순서 : 선언 -> 생성 -> 초기화(배열에 데이터 저장)
		// 1. 선언 : 자료형[] 이름 또는 자료형 이름[] ;
		int[] su;
		double num[];

		// 2. 생성 : 이름 = new 자료형[배열크기=개수]
		// 배열 크기는 반드시 지정해야 된다.
		// new 예약어는 heep 메모리에 데이터를 저장할 공간을 만든다.
		// => 인스턴스, 객체 생성

		su = new int[4];
		num = new double[4];

		// 만들어진 주소가 저장된다.
		System.out.println(su);
		System.out.println(num);

		// 3. 데이터 저장 : 이름[index = 위치값 = 0부터 시작] = 데이터
		su[1] = 10;

		// 데이터가 배열의 자료형보다 작으면 저장 가능
		su[0] = 'c';

		// 데이터가 배열의 자료형보다 크면 오류
		// su[2] = 3.0;

		su[2] = 20;

		// 기존에 정보가 있으면 사라진다.
		su[0] = 30;

		// 없는 공간에 저장하므로 실행할때 오류(run time error)
//		su[4] = 15;
		
		System.out.println(su[0]);
		System.out.println(su[1]);
		System.out.println(su[2]);
		System.out.println(su[3]);
		System.out.println("=========");
		
		// 여기서 4는 배열의 크기를 말한다.
		for(int i=0; i<4; i++) {
			System.out.println(su[i]);
		}
		
		System.out.println("=========");
		
		// su.length => su 배열의 길이(크기) => 4
		for(int i=0; i<su.length; i++) {
			System.out.println(su[i]);
		}

	}
}
