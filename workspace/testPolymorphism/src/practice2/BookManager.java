package practice2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class BookManager {
    private ArrayList bookList;

    // 기본 생성자
    public BookManager() {
        this.bookList = new ArrayList();
    }

    // 매개변수 있는 생성자
    public BookManager(ArrayList bookList) {
        this.bookList = bookList;
    }

    // 도서 추가
    public void addBook(Book book) {
        bookList.add(book);
    }

    // 도서 삭제
    public void deleteBook(int index) {
        if (index >= 0 && index < bookList.size()) {
            bookList.remove(index);
        } else {
            System.out.println("유효하지 않은 인덱스입니다.");
        }
    }

    // 도서 검색
    public int searchBook(String bTitle) {
        for (int i = 0; i < bookList.size(); i++) {
            Book book = (Book) bookList.get(i);
            if (book.getTitle().equalsIgnoreCase(bTitle)) {
                return i;
            }
        }
        return -1;
    }

    // 도서 정보 출력
    public void printBook(int index) {
        if (index >= 0 && index < bookList.size()) {
            System.out.println(bookList.get(index));
        } else {
            System.out.println("유효하지 않은 인덱스입니다.");
        }
    }

    // 전체 도서 출력
    public void displayAll() {
        for (int i = 0; i < bookList.size(); i++) {
            System.out.println(bookList.get(i));
        }
    }

    // 도서 목록 정렬 후 반환 (카테고리 오름차순)
    public Book[] sortedBookList() {
        Book[] books = new Book[bookList.size()];
        bookList.toArray(books);
        Arrays.sort(books, new AscCategory());
        return books;
    }

    // 도서 목록 출력
    public void printBookList(Book[] books) {
        for (int i = 0; i < books.length; i++) {
            System.out.println(books[i]);
        }
    }
}
