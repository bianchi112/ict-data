package com.practice2.model.entity;

public class Rectangle extends Point {
    // 필드
    private int width;
    private int height;

    // 기본 생성자
    public Rectangle() {
        super();
        this.width = 0;
        this.height = 0;
    }

    // 매개변수 있는 생성자
    public Rectangle(int x, int y, int width, int height) {
        super(x, y);  // 부모(Point)의 생성자 호출
        this.width = width;
        this.height = height;
    }

    // getter, setter 메서드
    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    // draw 메서드: 사각형의 좌표, 면적, 둘레 계산 출력
    @Override
    public void draw() {
        int area = width * height;
        int perimeter = 2 * (width + height);
        System.out.printf("사각형의 좌표: (%d, %d), 면적: %d, 둘레: %d%n", x, y, area, perimeter);
    }
}
