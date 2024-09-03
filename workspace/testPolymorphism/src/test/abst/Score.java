package test.abst;

//클래스가 인터페이스를 상속받을 때는 implements 사용함
//인터페이스는 다중 상속 가능함
public class Score implements Calculator, Grade {

	@Override
	public char getGrade(int score) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sum(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sub(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mul(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int div(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

}
