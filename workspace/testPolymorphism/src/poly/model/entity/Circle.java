package poly.model.entity;

public class Circle implements IShape {
	private double radius;
	
	public Circle() {}
	
	public Circle(double radius) {
		this.radius = radius;
	}
	
	public void setRadius(double radius) {
		this.radius = radius;
	}
	
	public double getRadius() {
		return this.radius;
	}

	@Override
	public double area() {
		// 원 면적 계산 리턴
		return Math.PI * Math.pow(this.radius, 2);
	}

	@Override
	public double perimeter() {
		// 원 둘레 계산 리턴
		return 2 * Math.PI * this.radius;
	}

}
