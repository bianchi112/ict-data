package test.abst;

import java.io.Serializable;

//인터페이스끼리의 상속에도 extends 사용함
//인터페이스는 다중 상속을 허용함
public interface Calculator extends Serializable, Cloneable {
	//추상 메소드만 멤버로 가진 추상클래스의 변형체
	/* public abstract */ int sum(int a, int b);
	/* public abstract */ int sub(int a, int b);
	public abstract int mul(int a, int b);
	public abstract int div(int a, int b);
	//인터페이스 안에서는 메소드 앞에 public abstract 를 생략함
	//오버라이딩 시에는 반드시 public  표기해야 함 : 주의
}
