package practice3;

import java.util.Scanner;
import practice2.Book;

public class TestBookManagerMap {
	public static void main(String[] args) {
		BookManagerMap manager = new BookManagerMap();
		menu(manager);
	}

	public static void menu(BookManagerMap manager) { 
		Scanner sc = new Scanner(System.in);
		int choice;

		do {
			System.out.println("\n*** 도서 관리 프로그램 ***");
			System.out.println("1. 새 도서 추가");
			System.out.println("2. 도서정보 정렬후 출력");
			System.out.println("3. 도서 삭제");
			System.out.println("4. 도서 검색출력");
			System.out.println("5. 전체 출력");
			System.out.println("6. 끝내기");
			System.out.print("선택: ");
			choice = sc.nextInt();
			sc.nextLine(); // 개행 문자 처리

			switch (choice) {
			case 1:
				manager.putBook(inputBook());
				break;
			case 2:
				Book[] sortedBooks = manager.sortedBookMap();
				manager.printBookMap(sortedBooks);
				break;
			case 3:
				System.out.print("삭제할 도서의 도서번호: ");
				String deleteKey = sc.nextLine();
				manager.removeBook(deleteKey);
				break;
			case 4:
				String searchTitle = inputBookTitle();
				String searchKey = manager.searchBook(searchTitle);
				if (searchKey != null) {
					manager.printBook(searchKey);
				} else {
					System.out.println("해당 도서를 찾을 수 없습니다.");
				}
				break;
			case 5:
				manager.displayAll();
				break;
			case 6:
				System.out.println("프로그램을 종료합니다.");
				break;
			default:
				System.out.println("유효하지 않은 선택입니다.");
				break;
			}
		} while (choice != 6);
	}

	public static Book inputBook() {
		Scanner sc = new Scanner(System.in);

		System.out.print("도서 번호: ");
		String bNo = sc.nextLine();

		System.out.print("도서 분류 (1.인문/2.자연과학/3.의료/4.기타): ");
		int category = sc.nextInt();
		sc.nextLine(); // 개행 문자 처리

		System.out.print("책 제목: ");
		String title = sc.nextLine();

		System.out.print("저자: ");
		String author = sc.nextLine();

		return new Book(bNo, category, title, author);
	}

	public static String inputBookTitle() {
		Scanner sc = new Scanner(System.in);
		System.out.print("검색할 도서 제목: ");
		return sc.nextLine();
	}
}
