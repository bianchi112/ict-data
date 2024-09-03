package exception.controller;

import make.exception.MyException;
import make.exception.NotDivideZeroException;

public class Calculator {
	public int sum(int a, int b) throws MyException {
		// 전달된 두 정수의 값이 반드시 1 ~ 100 사이의 값이어야 함, 아니면 예외 발생
		int result = 0;
		if ((a >= 1 && a <= 100) && (b >= 1 && b <= 100)) {
			result = a + b;
		} else {
			// 예외 발생시킴 : throw new 예외클래스생성자("에러메세지");
			throw new MyException("1부터 100사이의 값만 연산이 가능합니다.");
		}

		return result;
	}

	public int sub(int a, int b) throws MyException {
		// 전달된 두 정수의 값이 반드시 1 ~ 100 사이의 값이어야 함, 아니면 예외 발생
		int result = 0;
		if ((a >= 1 && a <= 100) && (b >= 1 && b <= 100)) {
			result = a - b;
		} else {
			// 예외 발생시킴 : throw new 예외클래스생성자("에러메세지");
			throw new MyException("1부터 100사이의 값만 연산이 가능합니다.");
		}

		return result;
	}

	public int mul(int a, int b) throws MyException {
		// 전달된 두 정수의 값이 반드시 1 ~ 100 사이의 값이어야 함, 아니면 예외 발생
		int result = 0;
		if ((a >= 1 && a <= 100) && (b >= 1 && b <= 100)) {
			result = a * b;
		} else {
			// 예외 발생시킴 : throw new 예외클래스생성자("에러메세지");
			throw new MyException("1부터 100사이의 값만 연산이 가능합니다.");
		}

		return result;
	}

	public int div(int a, int b) throws MyException, NotDivideZeroException {
		//나눌 수 b 가 0 이면 예외 발생시킴
		int result = 0;
		if (b == 0) {			
			throw new NotDivideZeroException("0으로 나눌 수 없습니다.");
		} else {
			if ((a >= 1 && a <= 100) && (b >= 1 && b <= 100)) {
				result = a / b;
			} else {
				// 예외 발생시킴 : throw new 예외클래스생성자("에러메세지");
				throw new MyException("1부터 100사이의 값만 연산이 가능합니다.");
			}
		}

		return result;
	}
}
