package com.uni;

public class Student extends Human {
    private String number;  // 학번
    private String major;   // 전공

    // 기본 생성자
    public Student() {}

    // 매개변수가 있는 생성자
    public Student(String name, int age, int height, int weight, String number, String major) {
        super(name, age, height, weight); // Human 클래스의 생성자 호출
        this.number = number;
        this.major = major;
    }
    
    // 정보 출력 메서드 오버라이딩
    @Override
    public String printInformation() {
        return super.printInformation() +  this.number + "\t" + this.major;
    }

    // getter, setter 메서드
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

    
}
