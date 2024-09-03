package test.entity;

public class Employee {
	private int eId;
	private String eName;
	private String dept;
	private int salary;
	private double bonusPoint;

	// 기본 생성자
	public Employee() {
	}

	// 매개변수가 있는 생성자
	public Employee(int eId, String eName, String dept, int salary, double bonusPoint) {
		this.eId = eId;
		this.eName = eName;
		this.dept = dept;
		this.salary = salary;
		this.bonusPoint = bonusPoint;
	}

	// Getters and Setters
	public int geteId() {
		return eId;
	}

	public void seteId(int eId) {
		this.eId = eId;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public double getBonusPoint() {
		return bonusPoint;
	}

	public void setBonusPoint(double bonusPoint) {
		this.bonusPoint = bonusPoint;
	}

	@Override
	public String toString() {
		return eId + "=" + eName + ", " + dept + ", " + salary + ", " + bonusPoint;
	}
}
