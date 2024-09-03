package inherit.run;

import com.practice1.model.vo.Book;
import com.practice2.model.entity.Circle;
//import com.practice2.model.entity.Point;
import com.practice2.model.entity.Rectangle;
import com.uni.Student;

import inherit.sample.Point;
import inherit.sample.Shape;
import oop.encapsulation.Employee;

public class Menu {
	
	//static (정적 메모리 : 메모리 영역의 크기가 고정된 영역)
	//실행될 때 메모리에 로드되어 기록되는 위치가 정적 메모리에 할당한다는 의미임
	//static 은 프로그램이 실행될 때(main 이 start 될 때) 자동으로 메모리에 기록할당됨
	//프로그램 종료(main 종료)시 자동 삭제됨 => 프로그램 구동되는 동안에는 계속 존재함 (객체간 자원 공유시 이용)
	//public static int value = 123;
	//public static String value2 = "정적메모리";
	
	public static void display() {
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		do {
			System.out.println("\n*** 상속 테스트 ***\n");
			System.out.println("1. this 레퍼런스 객체 인스턴스 주소 전달 확인");
			System.out.println("2. equals() 오버라이딩 확인");
			System.out.println("3. clone() 오버라이딩 확인");
			System.out.println("4. 상속 확인 : Shape");
			System.out.println("5. 상속 실습2 : Student");
			System.out.println("6. 상속 실습1 : Book 메소드 오버라이딩");
			System.out.println("7. 상속 실습2 : 여러 후손에 대한 객체 배열");
			System.out.println("8. 객체지향 캡슐화 연습 : 생성자, 초기화블럭");
			System.out.println("9. 프로그램 끝내기");
			
			System.out.print("선택 번호 입력 : ");
			int no = sc.nextInt();
			
			switch(no) {
			case 1:  testThis();		break;
			case 2:	testEquals();	break;
			case 3:	testClone();	break;
			case 4:	testShape();	break;
			case 5:	testStudent();	break;
			case 6:	testBook();	break;
			case 7:	testObjectArray();	break;
			case 8:	testEnCapsulation();	break;
			case 9: testPointArray(); break;
			case 0:	System.out.println("정말로 종료하시겠습니까? (종료: y, 취소: n) : ");
					if(sc.next().toUpperCase().charAt(0) == 'Y') {
						return;  //main() 으로 돌려보냄 => 프로그램 종료
					}else {
						break;  //switch 을 끝냄
					}
			default:	System.out.println("잘못 입력하셨습니다. 확인하고 다시 입력하세요.");
			}
		}while(true);
	}  //display()
	
	private static void testPointArray() {
		// 상속 실습문제 1 - 3
		// 1. Point 형 객체 배열 선언, 생성 : 5개
		com.practice2.model.entity.Point[] pArray = new com.practice2.model.entity.Point[5];
		
		// 2. 각 index별로 Circle, Rectangle 객체 생성, 초기화함(임의대로)
		// 부모 래퍼런스에는 후손 객체의 주소를 저장할 수 있음
		pArray[0] = new Circle(100, 100, 50);
		pArray[1] = new Rectangle(200, 200, 50, 50);
		pArray[2] = new Circle(150, 150, 30);
		pArray[3] = new Circle(100, 100, 50);
		pArray[4] = new Rectangle(400, 400, 150, 150);
		
//		Circle cir = new Rectangle(); // 에러 : 부모 자식관계에서만 대입이 가능함
		
		// 3. for 문 사용 : draw() 메소드 실행함
		for(int i = 0; i < pArray.length; i++) {
			pArray[i].draw();
		}
		System.out.println("-----------------------------");
		// for each 문 사용
		for(com.practice2.model.entity.Point p : pArray) {
			p.draw(); // 컴파일시에는 Point(부모)의 draw() 메소드가 연결됨 : 정적 바인딩
			// 실행시 참조하는 객체 타입에 따라 후손의 오버라이딩 draw() 로 연결을 바꾸면서 실행함
			// => 동적 바인딩
		}
	}
	
	private static void testBook() {
		// 상속 실습문제1 : 1번
		Book b1 = new Book("자바의 정석", "남궁성", 30000);
		Book b2 = new Book("뇌자극 자바", "홍길동", 27000);

		System.out.println("b1 : " + b1);
		System.out.println("b2 : " + b2);
		System.out.println("b1과 b2의 내용이 같은지? " + b1.equals(b2));

		Book b3 = (Book) b1.clone();
		System.out.println("b3 : " + b3);
		System.out.println("b1과 b3 의 주소가 같은지? " + (b1 == b3));
		System.out.println("b1과 b3 의 내용이 같은지? " + b1.equals(b3));

	}
	

	private static void testObjectArray() {
		// 상속 실습문제1 : 2번
		Circle[] cArray = new Circle[] { 
				new Circle(10, 10, 50), 
				new Circle(100, 100, 35), 
				new Circle(200, 200, 40) };

		Rectangle[] rArray = new Rectangle[] { 
				new Rectangle(50, 50, 100, 100), 
				new Rectangle(150, 150, 200, 200),
				new Rectangle(250, 250, 300, 300) };

		// Circle 배열 : for loop 문 사용한 경우
		for (int i = 0; i < cArray.length; i++)
			cArray[i].draw();

		// Rectangle 배열 : for each 문 사용한 경우
		// 객체배열, 리스트에서 주로 사용함
		for (Rectangle r : rArray)
			r.draw();

	}

	
	private static void testEnCapsulation() {
		//Employee 클래스 사용 테스트
		Employee emp = new Employee();  //기본생성자 사용해서 객체 생성과 초기화처리
		//클래스의 사용 : 클래스타입 레퍼런스변수 = new 클래스생성자(초기값, ....);
		
		//자료형(Data Type) : 값의 종류를 구분하기 위한 단어
		//기본자료형(Primitive Type), 참조자료형(Reference Type) 두 가지로 구분함
		//기본자료형 : 값을 취급함, 자료형 변수명 = 값; 
		//(8가지 : boolean(1), char(2), byte(1), short(2), int(4, 기본), long(8), float(4), double(8, 기본) 
		//참조자료형 : 주소를 취급함, 클래스타입 레퍼런스 = 객체의 주소;
		
		System.out.println("emp 가 가진 주소 : " + emp.hashCode());
		System.out.println("emp가 참조하는 객체 안의 값 확인 : " + emp.toString());
		//Employee 의 오버라이딩된 toString() 이 실행됨
		
		System.out.println("할당된 Employee 객체 수 : " + Employee.getCount()); 
		
		//매개변수 있는 생성자 사용해서 객체 생성 및 초기화
		Employee emp2 = new Employee("777", "황지니", 7890000, 1.25, 
				new java.sql.Date(System.currentTimeMillis()));
		System.out.println("emp2가 가진 주소 : " + emp2.hashCode());
		System.out.println(emp2.toString());  //Employee 의 오버라이딩된 toString() 이 실행됨
		System.out.println(emp2);  //Employee 의 오버라이딩된 toString() 이 실행됨
		
		System.out.println("할당된 Employee 객체 수 : " + Employee.getCount()); 
		
		//초기값 처리 순서 (초기화 순서)
		//jvm 이 준비한 기본값 => 명시된 초기값 => 초기화블럭 => 매개변수 있는 생성자
	}

	
	private static void testStudent() {
		//상속 실습문제 2
		//객체 배열 : Student 객체 3개 초기화 생성
		Student arrays [] = new Student[3];
		
		arrays[0] = new Student("홍길동", 15, 171, 81, "201101", "영문");
		arrays[1] = new Student("한사람", 13, 183, 72, "201102", "건축");
		arrays[2] = new Student("임걱정", 16, 175, 65, "201103", "무영");
		
		//for loop 문 사용한 경우
		for(int i = 0; i < arrays.length; i++)
			System.out.println(arrays[i].printInformation());
		System.out.println();
		
		//for each 문 사용한 경우 : 객체배열, 컬렉션
		//for(클래스타입 레퍼런스 : 배열 또는 컬렉션) { 레퍼런스.메소드 사용 }
		for(Student s : arrays)
			System.out.println(s.printInformation());
		System.out.println();

	}
	
	private static void testShape() {
		Shape s = new Shape();
		System.out.println("s가 가진 주소 : " + s.hashCode());
		System.out.println("s가 참조 객체 필드값 : " + s);
		
		//부모 멤버는 후손이 사용할 수 있다.
		s.setX(120);
		s.setY(230);
		System.out.println("값 확인 : " + s.getX() + ", " + s.getY());
		
		//super() 이용해서 부모의 매개변수 있는 생성자로 초기값 전달 확인
		Shape s2 = new Shape(10, 10, 100, 100);
		System.out.println("s2 : " + s2/* .toString() */);
	} 
	
	private static void testClone() {
		Point p1 = new Point(100, 100);
		System.out.println("p1 이 가진 주소 : " + p1.hashCode());
		
		Point p2 = (Point)p1.clone();  //리턴타입 Object => Point 로 형변환함
		//다형성 : 부모(Object)가 여러 후손타입을 받을 수 있다.
		//후손은 부모 타입을 못 받음 => 상속관계에 있으면 형변환 가능함
		System.out.println("p2가 가진 주소 : " + p2.hashCode());
		
		System.out.println("p1 필드값 : " + p1);
		System.out.println("p2 필드값 : " + p2);  
		
		System.out.println("값 비교 : " + p1.equals(p2));  //true
		System.out.println("주소 비교 : " + (p1 == p2));  //false
	}
	
	private static void testEquals() {
		Point p1 = new Point(10, 10);
		System.out.println("p1 이 가진 주소 : " + p1.hashCode());
		System.out.println("p1이 참조하는 객체 안의 필드값 : " + p1/* .toString() */);
		
		Point p2 = new Point(20, 20);
		System.out.println("p2 가 가진 주소 : " + p2.hashCode());
		System.out.println("p2가 참조하는 객체 안의 필드값 : " + p2/* .toString() */);
		
		System.out.println("두 객체가 가진 값들이 일치하느냐 : " + p1.equals(p2));  //false
		
		Point p3 = p1;  //shallow copy (얕은 복사) : 주소 복사
		System.out.println("두 객체가 가진 값들이 일치하느냐 : " + p1.equals(p3)); //true
	}
	
	private static void testThis() {
		Point p1 = new Point();  //힙 메모리에 객체 생성하고, 그 주소를 p1에 기록함
		//객체 생성시 자동 실행된 생성자 안의 this 레퍼런스도 자동으로 객체의 주소를 전달받게 됨
		System.out.println("p1이 가진 객체의 주소 : " + p1.hashCode());
		System.out.println("p1이 참조하는 객체안의 인스턴스 변수값 확인 : " + p1.toString());
		//레퍼런스.메소드명() 실행하면, 레퍼런스가 가진 객체주소를 메소드 안의 this에게 자동 전달되게 됨 
		
		System.out.println("Object 의 toString() : " + new Object().toString());
	}
}