package io.silsub3;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Book implements Serializable {
	private String title;
	private String author;
	private int price;
	private Calendar dates;
	private double discountRate;

	// 디폴트 생성자
	public Book() {
	}

	// 매개변수 있는 생성자
	public Book(String title, String author, int price, Calendar dates, double discountRate) {
		this.title = title;
		this.author = author;
		this.price = price;
		this.dates = dates;
		this.discountRate = discountRate;
	}

	// Getters and Setters
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

	public Calendar getDates() {
		return dates;
	}

	public void setDates(Calendar dates) {
		this.dates = dates;
	}

	public double getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(double discountRate) {
		this.discountRate = discountRate;
	}

	// toString() 메소드 오버라이드
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy'년' MM'월' dd'일 출간'");
		return "Book 제목=" + title + ", 저자=" + author + ", 가격=" + price + ", 출판날짜="
				+ sdf.format(dates.getTime()) + ", 할인율=" + discountRate + "]";
	}
}