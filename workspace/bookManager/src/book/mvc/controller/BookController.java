package book.mvc.controller;

import book.mvc.model.service.BookService;
import book.mvc.model.vo.Book;

public class BookController {
	private BookService service = new BookService();

	public void insertBook(Book b) {
		service.insertBook(b);
	}

	public void updateBook(Book b) {
		service.updateBook(b);
	}

	public void deleteBook(int bookId) {
		service.deleteBook(bookId);
	}

	public void searchBook(int bookId) {
		service.searchBook(bookId);
	}

	public void searchBookTitle(String bookTitle) {
		service.searchBookTitle(bookTitle);
	}

	public void selectAll() {
		service.selectAll();
	}
}
