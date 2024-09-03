package practice3;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Arrays;
import java.util.Comparator;

import practice2.Book;

public class BookManagerMap {
	private HashMap booksMap;

	// 기본 생성자
	public BookManagerMap() {
		this.booksMap = new HashMap();
	}

	// 매개변수 있는 생성자
	public BookManagerMap(HashMap booksMap) {
		this.booksMap = booksMap;
	}

	// 도서 추가
	public void putBook(Book book) {
		booksMap.put(book.getbNo(), book);
	}

	// 도서 제거
	public void removeBook(String key) {
		if (booksMap.containsKey(key)) {
			booksMap.remove(key);
		} else {
			System.out.println("해당 도서번호가 존재하지 않습니다.");
		}
	}

	// 도서 검색 (도서명으로)
	public String searchBook(String bTitle) {
		Set<Map.Entry> entries = booksMap.entrySet();
		for (Map.Entry entry : entries) {
			Book book = (Book) entry.getValue();
			if (book.getTitle().equalsIgnoreCase(bTitle)) {
				return book.getbNo();
			}
		}
		return null;
	}

	// 모든 도서 정보 출력
	public void displayAll() {
		Set<String> keys = booksMap.keySet();
		for (String key : keys) {
			System.out.println(booksMap.get(key));
		}
	}

	// 도서명으로 오름차순 정렬하여 반환
	public Book[] sortedBookMap() {
		Book[] booksArray = new Book[booksMap.size()];
		booksMap.values().toArray(booksArray);

		Arrays.sort(booksArray, new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				Book b1 = (Book) o1;
				Book b2 = (Book) o2;
				return b1.getTitle().compareToIgnoreCase(b2.getTitle());
			}
		});

		return booksArray;
	}

	// 정렬된 도서 배열 출력
	public void printBookMap(Book[] books) {
		for (Book book : books) {
			System.out.println(book);
		}
	}

	// 특정 도서번호의 도서 정보 출력
	public void printBook(String key) {
		if (booksMap.containsKey(key)) {
			System.out.println(booksMap.get(key));
		} else {
			System.out.println("해당 도서번호가 존재하지 않습니다.");
		}
	}
}
