package io.silsub3;

import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Calendar;
import java.util.Scanner;

public class BookManager {
	private Scanner sc;

	// 디폴트 생성자
	public BookManager() {
		sc = new Scanner(System.in);
	}

	// Book 객체를 파일에 저장하는 메소드
	public void fileSave() {
		Book[] books = new Book[5];
		books[0] = new Book("자바", "홍길동", 30000, Calendar.getInstance(), 0.15);
		books[1] = new Book("오라클", "스미스", 25000, Calendar.getInstance(), 0.10);
		books[2] = new Book("HTML", "크리스", 35000, Calendar.getInstance(), 0.20);
		books[3] = new Book("CSS", "제임스", 28000, Calendar.getInstance(), 0.12);
		books[4] = new Book("스프링", "레이첼", 40000, Calendar.getInstance(), 0.25);

		try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("books.dat"))) {
			for (Book book : books) {
				oos.writeObject(book);
			}
			System.out.println("books.dat 에 저장 완료!");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 파일에서 Book 객체를 읽어오는 메소드
	public void fileRead() {
		Book[] books = new Book[10];

		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("books.dat"))) {
			int i = 0;
			while (true) {
				try {
					books[i] = (Book) ois.readObject();
					i++;
				} catch (EOFException e) {
					break;
				}
			}

			for (Book book : books) {
				if (book != null) {
					System.out.println(book);
				}
			}

			System.out.println("books.dat 읽기 완료!");
		} catch (IOException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}