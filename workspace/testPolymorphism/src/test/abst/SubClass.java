package test.abst;

public class SubClass extends AbstractSample {
	public SubClass() {
		super();  //부모의 기본 생성자가 없으면 에러남
	}
	
	public SubClass(int value) {
		super(value);
	}

	@Override
	public void methodA() {  //여러 후손들의 메소드 사용 형식의 통일을 주기 위함
		// 상속받은 부모의 추상(미완성) 메소드를 후손이 반드시 오버라이딩해서 재구현(재작성)해야 함
		// 내용이 없는 추상메소드에 내용을 작성해 넣는 것이 목적임
		
	}
	
//	@Override
//	public void printInformation() {  //에러, 부모의 final 메소드는 오버라이딩 못 함
//		System.out.println("오버라이딩 가능한지 확인");
//	}
}
