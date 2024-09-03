package poly.model.entity;

public class Triangle implements IShape {
	private double base;  //밑변
	private double height; //높이
	
	public Triangle() {}	
	
	public Triangle(double base, double height) {
		super();
		this.base = base;
		this.height = height;
	}	

	public double getBase() {
		return base;
	}

	public void setBase(double base) {
		this.base = base;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}
	
	//빗변길이 계산 리턴 메소드
	public double getHypotenuse() {
		//벳변길이 = Math.sqrt(밑변*밑변 + 높이*높이);
		//Math.sqrt(값) : 제곱근 반환
		return Math.sqrt(base * base + height * height);
	}

	@Override
	public double area() {
		// 삼각형의 넓이 = (밑변 * 높이) / 2
		return (base * height) / 2;
	}
	@Override
	public double perimeter() {
		// 둘레길이 = 밑변 + 높이 + 빗변길이
		return base + height + this.getHypotenuse();
	}	
	
}
