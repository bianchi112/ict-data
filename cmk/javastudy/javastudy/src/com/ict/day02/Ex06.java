package com.ict.day02;

public class Ex06 {

	public static void main(String[] args) {
		// 이름이 홍길동인 사람의 성적이
		// 국어 90, 영어 80, 수학 80이다.
		// 총점과 평균을 구하자
		// 출력 이름, 총점, 평균 만 출력 (단, 평균은 소수점 둘째자리 까지)
		
		// 1. 입력데이터를 변수에 저장
		String name = "홍길동";
		int kor = 90;
		int eng = 80;
		int math = 80;
		
		// 2. 처리 = 비지니스 로직
		//, 총점, 평균(소수점 둘째자리 까지)
		int sum = kor+eng+math;
		double avg = sum / 3.0; // 83.333333
//		double avg = sum / 3; // 83.0
		
		avg = (int)(avg * 100) / 100.0; // 83.33
		
		double avg2 = (int)(sum / 3.0 * 100) / 100.0;

		System.out.println("이름 : " + name);
		System.out.println("총점 : " + sum);
		System.out.println("평균 : " + avg);
		System.out.println("평균 : " + avg2);
	}

}
