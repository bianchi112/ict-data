package com.ict.day10;

import java.lang.classfile.instruction.ReturnInstruction;

public class Ex01 {
	
	// 자료형과 상솬없이 저장 가능
	String name = "홍길동";
	int kor = 80;
	int eng = 80;
	int math = 80;
	int sum = 0;
	double avg = 0;
	char hak = 'B';
	
	// 메서드([인자]) : 기능, 동작, 하는것
	// 해당 메서드를 호출하면 실행 후 호출한 곳으로 되돌아 간다.
	// 되돌아 갈때  -- 데이터를 가지고 간다. (가지고 가는 데이터의 자료형 => 반환형)
	//			-- 그냥 간다 (가지고 가는 데이터의 자료형도 없다. => void)
	
	// 메서드 형식 : [접근제한자][메서드종류] 반환형 메서드 이름([인자 ...])
	// - 접근제한자 : public(누구나 접근 가능), private(외부에서는 접근불가), 생략(default), protected
	// - 메서드 종류 : static, instance(일반적인) => 생략
	// - 반환형 : 되돌아 갈대 -- 데이터를 가지고 간다. (가지고 가는 데이터의 자료형 => 반환형)
	//					    마지막 줄에 반드시 return 가지고 갈 데이터(변수);
	//					 -- 그냥 간다 (가지고 가는 데이터의 자료형도 없다. => void)
	// - 메서드 이름 : 소문자로 시작, 두 단어 이상이면 첫글자는 대문자로 하자
	
	// 인스턴스 메서드, 반환형이 없음
	// 자기를 호출한 곳으로 되돌아간다
	public void play01() {
		System.out.println(2);
		sum = kor + eng + math;
		System.out.println(3);
	}
	// 인스턴스 메서드
	public int play02() {
		int k = kor + eng + math;
		return k;
	} 

	// 인스턴스 메서드, 반환형이 있음
	public int play03() {
		return kor + eng + math;
	}
	// 인스턴스 메서드, 반환형이 있음
	public String play04() {
		return String.valueOf(kor+eng+math);
	}
	// 인스턴스 메서드, 반환형이 있음
	public double play05() {
		return kor + eng + math;
	}
	// 인스턴스 메서드, 반환형이 이씅ㅁ
//	public int play06() {
//		return (kor + eng + math)*1.0;
//	}
	
}
