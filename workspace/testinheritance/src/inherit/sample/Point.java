package inherit.sample;

public class Point {
	// Field : 캡슐화(EnCapsulation)
	// 접근제한자 [예약어] 자료형 변수명 [= 초기값];
	private double x;
	private double y;
	
	// Constructor
	// public 클래스명() : 기본생성자 => 매개변수 없는 생성자
	// 클래스에 생성자가 하나도 없으면 jvm 이 기본생성자 자동 추가하면서 컴파일함
	// 상속에 사용될 부모클래스일 때는 기본생성자 반드시 있어야 함
	public Point() {
		System.out.println("Point 기본생성자 this : " + this.hashCode());
	} //jvm 이 준비해 놓은 기본값으로 초기화됨
	// 정수 : 0, 실수 : 0.0, boolean : false, char : '\u0000', 래퍼런스타입 : null
	
	// 생성자는 오버로딩(overloading) 가능
	// 오버로딩 : 한 클래스 안에서 이름이 같은 함수 여러 개 작성하는 것 (중복 작성)
	// 오버로딩 주의사항 : 매개변수가 반드시  달라야 함 (갯수, 자료형 다르게 구성)
	
	// 매개변수 있는 생성자
	public Point(double x, double y) {
		// 생성자 안에는 this 래퍼런스(객체 주소 저장 변수)가 존재함
		// new 할 때 자유메모리 heap 에 할당되는 객체의 주소를 this가 자동 전달받음
		System.out.println("Point 매개변수 있는 생성자 this : " + this.hashCode());
		// + hashCode() : int => 메모리에 할당된 객체 인스턴스의 주소를 10진수로 리턴
		// java.lang.Object 클래스가 소유한 메소드임 => 모든 클래스는 Object 의 후손임
		this.x = x;
		this.y = y;
	}
	
	// Method
	// getters : 필드값 조회용 메소드
	// public 필드자료형 get필드명(){ return this.필드명; }
	public double getX() {
		return this.x;
	}
	
	public double getY() {
		return this.y;
	}
	
	// setters : 필드값 변경용 메소드
	// public void set필드명(필드자료형 매개변수){ this.필드 = 매개변수; }
	public void setX(double  x) {
		this.x = x;
	}
	
	public void setY(double y) {
		this.y = y;
	}
	
	// 일반메소드
	// 오버라이딩(overriding) : 부모 메소드를 후손이 재작성하는 것
	// 오버라이딩 규칙1 : 부모 메소드의 시그니쳐(signiture) 그대로 사용해야 함, 메소드 안의 실행내용만 변경함
	@Override //annotation : 컴파일러용  주석(comment), 컴파일러 알림용
	public String toString() {
		// Object 클래스 : this 가 참조하는 "클래스명@16진수해시코드값" 리턴
		// 오버라이딩 구현 병경 : this 가 참조하는 인스턴스 안의 필드값 출력 확인용 문자 리턴
		
		System.out.println("this 가 받은 주소 : " + this.hashCode());
		return "x : " + this.x + ", y : " + this.y;
	}
	
	@Override
	public boolean equals(Object obj) {
		// Object 클래스의 원래 기능 : return this == obj; => 두 주소가 같은지 비교
		// 두 래퍼런스가 참조하는 객체 안의 필드 값이 같은지로 변경함
		
		// 메소드 사용시 Point 객체의 주소를 전달하면, Object 타입의 매개변수가 받게 됨 : 다형성 적용됨
		// 그런데 Object obj 는 Point 가 가진 x 에 접근할 수 없음 : obj 에는 x가 없음
		// 다형성 : 부모 클래스형 래퍼런스가 후손들의 주소를 받는 것을 말함
		// 클래스 형변환 필요함 : Object 에서 Point 형으로 바꿈 => 부모와 후손간에만 형변환 가능함
		Point pobj = (Point)obj;
		return (this.x == pobj.x) && (this.y == pobj.y);
	}
	
	// 오버라이딩 규칙2 : 부모 메소드의 접근제한자를 더 넓은 범위의 접근자로 변경할 수 있음
	// 오버라이딩 규칙3 : 부모 메소드의 예외는 갯수를 줄일 수 있음
	@Override
	public Object clone() {
		// Object 클래스 : return this; => 주소 복사 (얕은 복사)
		// deep copy(깊은 복사) : 새 객체를 만들어서 기존 객체의 필드값을 복사해 넣음
		//		같은 값을 가진 새 객체의 주소를 리턴함 => 오버라이딩 구현함
		return new Point(this.x, this.y);
	}
	
	
	
}
