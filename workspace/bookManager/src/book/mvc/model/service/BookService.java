package book.mvc.model.service;

import book.mvc.model.dao.BookDao;
import book.mvc.model.vo.Book;
import java.util.ArrayList;

public class BookService {
	private BookDao dao = new BookDao();

	public void insertBook(Book b) {
		int result = dao.insertBook(b);
		if (result > 0) {
			System.out.println("도서가 추가되었습니다.");
		} else {
			System.out.println("도서 추가 실패");
		}
	}

	public void updateBook(Book b) {
		int result = dao.updateBook(b);
		if (result > 0) {
			System.out.println("도서 정보가 수정되었습니다.");
		} else {
			System.out.println("도서 수정 실패");
		}
	}

	public void deleteBook(int bookId) {
		int result = dao.deleteBook(bookId);
		if (result > 0) {
			System.out.println("도서가 삭제되었습니다.");
		} else {
			System.out.println("도서 삭제 실패");
		}
	}

	public void searchBook(int bookId) {
		Book b = dao.selectBook(bookId);
		if (b != null) {
			System.out.println(b);
		} else {
			System.out.println("해당 도서가 존재하지 않습니다.");
		}
	}

	public void searchBookTitle(String bookTitle) {
		ArrayList<Book> list = dao.searchBookTitle(bookTitle);
		if (!list.isEmpty()) {
			for (Book b : list) {
				System.out.println(b);
			}
		} else {
			System.out.println("해당 제목의 도서가 존재하지 않습니다.");
		}
	}

	public void selectAll() {
		ArrayList<Book> list = dao.selectAllBooks();
		if (!list.isEmpty()) {
			for (Book b : list) {
				System.out.println(b);
			}
		} else {
			System.out.println("등록된 도서가 없습니다.");
		}
	}
}
