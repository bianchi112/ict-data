package com.practice2.model.entity;

public class Point {
    // 필드 (protected로 설정하여 상속받은 클래스에서 접근 가능)
    protected int x;
    protected int y;

    // 기본 생성자
    public Point() {
        this.x = 0;
        this.y = 0;
    }

    // 매개변수 있는 생성자
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // getter, setter 메서드
    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    // 3번 draw 메서드
    public void draw() {
    	// points 배열의 각 요소가 Point 타입이지만 
    	// 실제로는 Circle 또는 Rectangle 객체로 인스턴스화 되었기 때문에, 
    	// 각 객체의 draw 메소드가 호출됨
    }
}
