package exception.view;

import java.io.FileNotFoundException;
import java.util.Scanner;

import exception.controller.ExceptionManager;

public class Menu {
	//Field
	private static ExceptionManager manager = new ExceptionManager();  
	//의존성 주입 (Dependency Injection : DI)
	
	//Method
	public static void display() throws FileNotFoundException {
		//지역변수
		//ExceptionManager manager = new ExceptionManager();
		Scanner sc = new Scanner(System.in);
		
		do {
			System.out.println("\n*** 예외처리 테스트 ***\n");
			
			System.out.println("1. 예외 테스트 1");
			System.out.println("2. 예외 테스트 2 : throws 사용");
			System.out.println("3. 예외 테스트 3 : 사용자 정의 예외 클래스 사용");
			System.out.println("4. 예외 실습 문제 1 ");
			System.out.println("5. 예외 실습 문제 2 ");			
			System.out.println("9. 끝내기");
			
			System.out.print("번호 입력 : ");
			int no = sc.nextInt();
			
			switch(no) {
			case 1:	manager.testException1();	break;
			case 2:	manager.testException2();	break;
			case 3:	manager.testCalculator(); 	break;
			case 4:	manager.testSilsub1(); 	break;
			case 5:	manager.testSilsub2(); 	break;
			case 9:	System.out.println("프로그램을 종료합니다.");
					return;
			default:	System.out.println("잘못된 번호입니다. 확인하고 다시 입력하세요.");
			}
			
		} while(true);
		
	}  //display()
}








