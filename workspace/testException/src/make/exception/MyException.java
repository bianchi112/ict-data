package make.exception;

//사용자 정의 예외클래스 : Exception 을 상속받으면 됨
public class MyException extends Exception {
	public MyException(String message) {
		super(message);
	}
}
