package poly.model.vo;

public class Rectangle extends Shape {
	private double width;
	private double height;
	
	public Rectangle() {}
	
	public Rectangle(double width, double height) {
		super();
		this.width = width;
		this.height = height;
	}	

	public double getWidth() {
		return width;
	}

	public void setWidth(double width) {
		this.width = width;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	@Override
	public double area() {
		// 사각형 면적 계산 리턴
		return this.width * this.height;
	}

	@Override
	public double perimeter() {
		// 사각형 둘레 계산 리턴
		return 2 * (this.width + this.height);
	}

}
