package practice2;

import java.io.Serializable;

public class Book implements Serializable {
	private String bNo; // 도서번호
	private int category; // 도서분류코드
	private String title; // 책제목
	private String author; // 저자

	// 기본 생성자
	public Book() {
	}

	// 매개변수 있는 생성자
	public Book(String bNo, int category, String title, String author) {
		this.bNo = bNo;
		this.category = category;
		this.title = title;
		this.author = author;
	}

	// Getters and Setters
	public String getbNo() {
		return bNo;
	}

	public void setbNo(String bNo) {
		this.bNo = bNo;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

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

	// toString() 오버라이딩
	@Override
	public String toString() {
		return "Book{" + "bNo='" + bNo + '\'' + ", category=" + category + ", title='" + title + '\'' + ", author='"
				+ author + '\'' + '}';
	}
}
