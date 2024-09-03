package com.ict.day02;

public class Ex03 {

	public static void main(String[] args) {
		// 형 변환(cast): 자동 형 변환(프로며선), 강제 형 변환(디모션)
		// 자동형 변환 : 작은 자료형이 큰 자료형으로 변환하는 것(저장되는 것)
		
		char ch = 'A';
		
		// 큰 자료형 = 작은자료형 (자동형변환) : 정보가 변경될 일이 없음
		int su = ch;
		double do1 = ch;
		
		// 강제 형 변환 : 큰 자료형이 작은 자료형으로 젼환하는 것 (저장되는것)
		//				데이터가 변경될 수 있다.
		
		// 자료형 이름 = (왼쪽자료형)(데이터)
		int su2 = (int)34.1;
		System.out.println(su2);
		
		byte su3 = (byte)(128);
		System.out.println(su3);

		int su4 = 65;
		char ch2 = (char)su4;
		System.out.println(ch2);
		
		double num = 486.2145745;
		num = num*100;
		System.out.println(num); //48621.45745
		
		int su5 = (int)num;
		System.out.println(su5); // 48621
		//		   su5가 int고 100도 int => int 계산 int = int
		int su6 = su5 / 100; //486
		System.out.println(su6);
		
		//		su5가 int고 100도 int => int 계산 int = int
		double su7 = su5 / 100;
		System.out.println((su7));
		
		//		su5가 int고 100.0은 double => int 계산 double  = double
		double su8 = su5 / 100.0;
		System.out.println(su8); // 486.21

		// num을 소수점 둘째자리까지 구하기
		double su9 = (int)(num * 100) / 100.0;
		System.out.println(su9);
		
		double num2 = 486.218745;
		num2 = num2 / 10; // 48.62148745
		System.out.println(num2);
		
		int k = (int)(num2);
		System.out.println(k); // 48
		
		int k2 = k * 10;
		System.out.println(k2); // 480
		
		// 일의 자리 절삭하기
		num2 = 486.218745;
		int k3 = (int)(num2 / 10) * 10;
		System.out.println(k3);
		
		
	}

}
