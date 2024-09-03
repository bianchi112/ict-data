package inherit.sample;

// 자바는 클래스 간의 상속, 인터페이스 간의 상속시에는 extends 사용함
// 자바는 클래스 간의 상속에는 단일상속만 허용함 : 부모클래스 1개 상속
// 다중상속은 부모 클래스가 여러 개 : 허용 안 함 => 에러 발생함
public class Shape extends Point/* , String */ implements Draw{
	// Field
	private double area;
	private double perimeter;
	
	// Constructor
	public Shape() {
		// 모든 후손클래스 생성자 안에 첫 줄에는 자동으로 부모 기본생성자 호출구문이 숨겨져 있음
		super(); // 부모 기본생성자 실행함, 반드시 첫줄에 기입해야 함
		System.out.println("Shape 기본생성자 this : " + this.hashCode());
	}
	
	public Shape(double area, double perimeter) {
		super();
		System.out.println("Shape 매개변수 있는 생성자 this : " + this.hashCode());
		this.area = area;
		this.perimeter = perimeter;
	}
	
	public Shape(double x, double y, double area, double perimeter) {
		super(x, y); // 부모의 매개변수 있는 생성자를 실행함
//		Point(x,y); // 생성자와 초기화블럭은 상속 안 됨
		System.out.println("Shape 매개변수 있는 4개 생성자 this : " + this.hashCode());
//		this.x = x; // 같은 주소위치의 Shape 객체 안에 있지만 private 이므로 접근 못함
//		this.y = y;
		this.area = area;
		this.perimeter = perimeter;
	}
	
	// getter and setter
	public void setArea(double area) {
		this.area = area;
	}
	
	public double getArea() {
		return this.area;
	}
	
	public void setPerimeter(double perimeter) {
		this.perimeter = perimeter;
	}
	
	public double getPerimeter() {
		return this.perimeter;
	}
	
	// Method
	@Override
	public String toString() {
		// 후손 메소드 안에서 이름이 같은 부모 메소드를 실행하려면
		// super.부모메소드명() 으로 표기하면 됨
		return this.toString() + ", area = " + this.area + ", perimeter : " + this.perimeter;
	}
}
