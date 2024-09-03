package poly.model.vo;

public abstract class Shape {
	protected Shape() {}
	
	abstract public double area();  //면적 계산 리턴용
	abstract public double perimeter();  //둘레 계산 리턴용
}
