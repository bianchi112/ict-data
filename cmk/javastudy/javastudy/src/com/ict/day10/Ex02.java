package com.ict.day10;

import javax.swing.plaf.synth.SynthOptionPaneUI;

public class Ex02 {

	public static void main(String[] args) {
		// Ex01의 인스턴스 변수와 메서들르 사용하기 위해서는
		// 무조건 객체 생성해야 된다.
		// 생성자가 없으면 무조건 기본생성자로 만들어야 한다.
		
		// 객체 생성 : 클래스이름 참조변수 = new 생성자([인자]);
		Ex01 t1 = new Ex01();
		
		// Ex01에 있는 인스턴스변수가 접근제한자가 생략되어 있
		// 같은 패키지에서는 접근이 가능하다.
		String n = t1.name;
		System.out.println(n);

		// 현재 sum은 변경하지 않았으므로 0이다.
		int k1 = t1.sum;
		System.out.println(k1);
		
		System.out.println(1);
		// **메서드를 호출해야 메서드가 실행된다.
		t1.play01();
		System.out.println(4);
		
		int k2 = t1.sum;
		System.out.println(k2);

		System.out.println("=================");
		
		int k3 = t1.play02();
		System.out.println("k3 : " + (k3+1));
		
		String k4 = t1.play04();
		System.out.println("k4 : " + (k4+1));
		
		Ex01 t2 = new Ex01();
		// Ex01의 초기값은 변경
		t2.name =  "고길동";
		t2.kor = 95;
		t2.eng = 85;
		t2.math = 90;
		
		System.out.println("이름 : " + t2.name);
		System.out.println("sum : " + t2.sum);
		
		t2.play01();
		System.out.println("sum : " + t2.sum);
		
	}
	

}
