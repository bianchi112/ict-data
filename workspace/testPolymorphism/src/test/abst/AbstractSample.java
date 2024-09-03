package test.abst;

//abstract (추상) : 미완성을 의미함
//상속을 통해서 후손이 부모의 미완성 부분을 강제로 완성시키도록 하기 위한 목적으로 만들어지는 클래스임
//후손에게 추상메소드 오버라이딩 강제화가 목적임
public abstract class AbstractSample {
	//Field
	private int value;
	
	//Constructor
	//abstract 클래스의 생성자는 후손이 super() 구문으로 자동 호출되므로 필요함
	//해당 클래스 자신의 객체 생성은 못함 => 후손을 위한 생성자가 됨 => 후손만 사용하게 처리함
	//public AbstractSample() {
	protected AbstractSample() {
		super();  //Object 의 기본생성자 호출
	}
	
	//public AbstractSample(int value) {
	protected AbstractSample(int value) {
		super();  //Object 의 기본생성자 호출
		this.value = value;
	}
	
	//Method
	//추상(abstract) 메소드 : 미완성 메소드 를 멤버로 가진 클래스는 반드시 class 앞에 abstract 를 붙여야 함
	//메소드 해드 (메소드 선언부 : 시그니쳐)만 있고, 메소드 바디(구현부)가 없는 메소드 
	//접근제한자 abstract 반환자료형 메소드명(자료형 매개변수, ....);
	public abstract void methodA();
	
	public int getValue() {
		return this.value;
	}
	
	public void setValue(int value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "value : " + this.value;
	}
	
	//final 메소드는 후손이 오버라이딩 못하게 하기 위해 사용함
	public final void printInformation() {
		System.out.println("오버라이딩 가능한지 확인");
	}
}




