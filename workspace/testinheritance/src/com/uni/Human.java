package com.uni;

public class Human {
    protected String name;
    protected int age;
    protected int height;
    protected int weight;

    // 기본 생성자
    public Human() {}

    // 매개변수가 있는 생성자
    public Human(String name, int age, int height, int weight) {
        this.name = name;
        this.age = age;
        this.height = height;
        this.weight = weight;
    }

    // 정보 출력 메서드
    public String printInformation() {
    	return name + "\t" + age + "\t" + height + "\t" + weight + "\t";
    }
    
    // getter, setter 메서드
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

}
