package io.view;

import java.util.Scanner;

import test.bytestream.FileIOSample;
import test.objectio.MemberManager;

public class Menu {
	// 의존성 주입
	private static FileIOSample fsamp = new FileIOSample();
	private static test.charstream.FileIOSample csamp = new test.charstream.FileIOSample();
	private static MemberManager manager = new MemberManager();

	public static void display() {
		Scanner sc = new Scanner(System.in);

		do {
			System.out.println("\n*** 입출력 관련 클래스 사용 테스트 ***\n");

			System.out.println("1. 파일 출력 : FileOutputStream - 새로 쓰기 모드");
			System.out.println("2. 파일 읽기 : FileInputStream");
			System.out.println("3. 파일 출력 : FileOutputStream - 추가 쓰기 모드");
			System.out.println("4. 파일 출력 : FileWriter - 새로 쓰기 모드");
			System.out.println("5. 파일 읽기 : FileReader");
			System.out.println("6. 파일 출력 : FileWriter - 추가 쓰기 모드");
			System.out.println("7. Member 객체");
			System.out.println("8. ");

			System.out.println("9. 끝내기");

			System.out.println("번호 선택 : ");
			int no = sc.nextInt();

			switch (no) {
			case 1:
//				fsamp.fileSave();
				fsamp.fileSave2();
				break;
			case 2:
//				fsamp.fileRead();
				fsamp.fileRead2();
				break;
			case 3:
//				fsamp.fileAppend();
				fsamp.fileAppend2();
				break;
			case 4:
//				fsamp.fileSave();
				csamp.fileSave();
				break;
			case 5:
//				fsamp.fileRead();
				csamp.fileRead();
				break;
			case 6:
//				fsamp.fileAppend();
				csamp.fileAppend();
				break;
			case 7:
				manager.fileSave();
				break;
			case 8:
				manager.fileRead();
				break;
			case 9:
				System.out.println("프로그램을 종료합니다.");
			default:
				System.out.println("잘못된 번호입니다.");
			}

		} while (true);
	}
}
