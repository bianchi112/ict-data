package book.mvc.view;

import book.mvc.controller.BookController;
import book.mvc.model.vo.Book;
import java.sql.Date;
import java.util.Scanner;

public class BookMenu {
	private Scanner sc = new Scanner(System.in);
	private BookController controller = new BookController();

	public void displayMenu() {
		int choice;
		do {
			System.out.println("\n*** 도서 관리 프로그램 ***");
			System.out.println("1. 도서 추가");
			System.out.println("2. 도서 정보 수정");
			System.out.println("3. 도서 삭제");
			System.out.println("4. 도서 아이디로 조회");
			System.out.println("5. 도서 제목으로 조회");
			System.out.println("6. 도서 목록 전체 조회");
			System.out.println("9. 끝내기");
			System.out.print("번호 선택: ");
			choice = sc.nextInt();
			sc.nextLine();

			switch (choice) {
			case 1:
				controller.insertBook(inputBook());
				break;
			case 2:
				controller.updateBook(inputBookIdForUpdate());
				break;
			case 3:
				controller.deleteBook(inputBookId());
				break;
			case 4:
				controller.searchBook(inputBookId());
				break;
			case 5:
				controller.searchBookTitle(inputBookTitle());
				break;
			case 6:
				controller.selectAll();
				break;
			case 9:
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("잘못된 선택입니다. 다시 입력해주세요.");
			}
		} while (choice != 9);
	}

	public Book inputBook() {
		System.out.print("제목: ");
		String title = sc.nextLine();
		System.out.print("저자: ");
		String author = sc.nextLine();
		System.out.print("출판사: ");
		String publisher = sc.nextLine();
		System.out.print("출판일(YYYY-MM-DD): ");
		Date publishDate = Date.valueOf(sc.nextLine());
		System.out.print("가격: ");
		double price = sc.nextDouble();
		sc.nextLine();

		return new Book(0, title, author, publisher, publishDate, price);
	}

	public Book inputBookIdForUpdate() {
		System.out.print("수정할 도서 아이디: ");
		int bookId = sc.nextInt();
		sc.nextLine();
		Book b = inputBook();
		b.setBookId(bookId);
		return b;
	}

	public int inputBookId() {
		System.out.print("도서 아이디: ");
		return sc.nextInt();
	}

	public String inputBookTitle() {
		System.out.print("도서 제목: ");
		return sc.nextLine();
	}
}
