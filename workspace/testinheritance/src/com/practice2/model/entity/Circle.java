package com.practice2.model.entity;

public class Circle extends Point {
    // 필드
    private int radius;

    // 기본 생성자
    public Circle() {
        super();
        this.radius = 0;
    }

    // 매개변수 있는 생성자
    public Circle(int x, int y, int radius) {
        super(x, y);  // 부모(Point)의 생성자 호출
        this.radius = radius;
    }

    // getter, setter 메서드
    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    // draw 메서드: 원의 좌표, 면적, 둘레 계산 출력
    @Override
    public void draw() {
        double area = Math.PI * radius * radius;
        double circumference = 2 * Math.PI * radius;
        System.out.printf("원의 좌표: (%d, %d), 면적: %.1f, 둘레: %.1f%n", x, y, area, circumference);
    }
}
