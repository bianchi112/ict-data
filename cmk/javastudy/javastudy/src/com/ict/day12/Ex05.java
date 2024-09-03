package com.ict.day12;

public class Ex05 {
	private String name = "일지매";
	private int age = 24;

	public Ex05() {

	}

	public Ex05(String name) {
		this.name = name;
	}

	public Ex05(int age) {
		this.age = age;
	}

	public Ex05(String name, int age) {
		this.name = name;
		this.age = age;
	}

	public void prn() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
	}

}
