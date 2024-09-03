package exception.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

import exception.silsub1.CharCheckException;
import exception.silsub1.CharacterProcess;
import exception.silsub2.NumberProcess;
import exception.silsub2.NumberRangeException;
import make.exception.MyException;
import make.exception.NotDivideZeroException;

//예외처리 테스트를 위한 기능 제공용 클래스
public class ExceptionManager {
	
	//Method
	public void testException1() {
		//자바가 제공하는 클래스의 생성자 또는 메소드 사용시, 반드시 예외처리해야 되는 경우가 있음
		//생성자나 메소드 뒤쪽에 throws XXXXException 이 표기되어 있는 경우
		try {
			FileReader fr = new FileReader("sample1.txt"); //반드시 예외처리해야 되는 구문임
			System.out.println("작동되는지 확인");  //위의 구문에서 예외가 발생하면, 이 구문은 실행안 됨
		} catch (FileNotFoundException e) {
			// 해당 에러가 발생했을 때 처리 구문을 작성함
			//e.printStackTrace();
			System.out.println("대상 파일이 존재하지 않습니다. 확인하고 다시 사용하세요.");
			return; //Menu 로 돌려보냄
		} catch(IOException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//예외가 발생해도 작동됨, 예외가 발생하지 않아도 작동됨
			//반드시 실행시켜야 되는 구문을 작성함
			System.out.println("finally 작동됨.....");
		}
	}
	
	public void testException2() throws FileNotFoundException {
		methodA();
	}
	
	public void methodA() throws FileNotFoundException {
		methodB();  
	}
	
	public void methodB() throws FileNotFoundException {
		methodC();  //메소드 사용 위치로 예외가 넘어옴
		//예외 처리 직접하지 않고 넘김 (throws)
	}
	
	public void methodC() throws FileNotFoundException {
		new FileReader("sample.txt");  //반드시 예외 처리해야 하는 구문
		//예외를 직접 해결 처리하지 않고 처리할 예외를 넘겨버림
	}
	
	//사용자 정의 예외 클래스 사용 테스트 ------------------------------------------
	public void testCalculator() {
		Calculator calc = new Calculator();
		
		try {
			System.out.println("더하기 결과 : " + calc.sum(23, 55));
			System.out.println("빼기 결과 : " + calc.sub(23, 55));
			System.out.println("곱하기 결과 : " + calc.mul(23, 55));
			System.out.println("나누기 결과 : " + calc.div(23, 55));
			
			//System.out.println("나누기 결과 : " + calc.div(23, 0));
			System.out.println("더하기 결과 : " + calc.sum(23, -55));
		} catch (MyException | NotDivideZeroException e) {
			//상속관계에서 형재 관계인 예외 클래스들은 하나의 catch 로 다룰 수 있음
			System.out.println(e.getMessage());
			e.printStackTrace();
		} /*
			 * catch (NotDivideZeroException e) { 
			 * System.out.println(e.getMessage());
			 * e.printStackTrace(); }
			 */
	}
	
	//예외 실습 1 : 문제1
	public void testSilsub1() {
//		키보드로 문자열을 입력받아(Scanner 사용)
//		countAlpha 메소드로 문자열 전달하고, 실행결과 받아 출력함.
//		- 반드시 try ~ catch 문 사용
		Scanner sc = new Scanner(System.in);
		try {
			System.out.println("문자열 입력 : ");
			int count = new CharacterProcess().countAlpha(sc.nextLine());
			System.out.println("포함된 알파벳 문자 갯수 : " + count);
		} catch (CharCheckException e) {
			System.out.println(e.getMessage());
		}
	}
	
	//예외 실습 1 : 문제2
	public void testSilsub2() {
		Scanner sc = new Scanner(System.in);
		System.out.print("첫번째 정수 : ");
		int first = sc.nextInt();
		System.out.print("두번째 정수 : ");
		int second = sc.nextInt();
		
		try {
			if(new NumberProcess().checkDouble(first, second))
				System.out.println(first + "는 " + second + "의 배수이다.");
			else
				System.out.println(first + "는 " + second + "의 배수가 아니다.");
		} catch (NumberRangeException e) {
			System.out.println(e.getMessage());
		}

	}
}
















