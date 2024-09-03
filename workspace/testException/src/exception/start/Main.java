package exception.start;

import java.io.FileNotFoundException;

import exception.view.Menu;

public class Main {

	public static void main(String[] args) throws FileNotFoundException {
		// 예외(Exception) 처리 테스트
		Menu.display();  //예외 넘어옴 => 예외 처리할 구문이 됨
	}

}
