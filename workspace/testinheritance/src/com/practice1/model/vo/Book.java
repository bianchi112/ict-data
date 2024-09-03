package com.practice1.model.vo;
// vo(value object) : 값 저장용 객체

public class Book implements Cloneable {  // Cloneable 인터페이스를 구현하여 clone() 메서드를 사용 가능하게 함
    // Field
    private String title;   // 책 제목
    private String author;  // 저자명
    private int price;      // 가격

    // Constructor
    // 생성자는 오버로딩(overloading) 가능 => 한 클래스 안에서 이름이 같은 함수 여러 개 작성 (중복 작성)
    // 오버로딩 작성 규칙 : 매개변수가 반드시 달라야 함 (갯수, 자료형, 나열순서)
    // 접근제한자, 리턴타입은 오버로딩  판단 대상이 아님 =>  함수명과 매개변수로만 중복을 판단함
    public Book() {} // 매개변수 없는 생성자 : 기본생성자
    
    // 매개변수 생성자: 필드 값을 초기화하는 생성자
    public Book(String title, String author, int price) {
        this.title = title;
        this.author = author;
        this.price = price;
    }

    // Getter and Setter 작성함
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // Object 클래스의 toString() 메소드 오버라이딩함
    // => 객체의 모든 필드값 문자열 합치기해서 리턴함
    @Override
    public String toString() {
        return title + "\t" + author + "\t" + price + "원";
    }

    // Object 클래스의 equals() 메소드 오버라이딩함
    //=> 두 객체의 모든 필드값이 일치하는지를 물어서
    //	모두 일치하면 true, 하나라도 다르면 false를 리턴함
    @Override
    public boolean equals(Object obj) {
        Book bobj = (Book)obj;
        return (this.title.equals(bobj.title)) && (this.author.equals(bobj.author)) && ((this.price == bobj.price));
    }

    // Object 클래스의  clone() 메소드 오버라이딩함
    // => 접근제한자는 public 으로 변경함
    // => 예외처리는 삭제함
    // => this 로 전달된 위치의 객체가 가진 값을 복사한 새 객체 생성하고 주소 리턴함
    @Override
    public Book clone() {  // clone() 메서드를 오버라이딩하며 예외 처리는 제거
        return new Book(this.title, this.author, this.price);  // 현재 객체의 필드 값을 복사한 새로운 객체를 반환
    }
}
