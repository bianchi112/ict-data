package io.silsub1;

import java.util.Scanner;

public class TestMyNote {

    public static void main(String[] args) {
        menu();
    }

    public static void menu() {
        MyNote note = new MyNote();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("******   MyNote  *******");
            System.out.println("1. 노트 새로 만들기");
            System.out.println("2. 노트 열기");
            System.out.println("3. 노트 열어서 수정하기");
            System.out.println("4. 끝내기");
            System.out.print("메뉴 선택 : ");

            int choice = sc.nextInt();
            sc.nextLine(); // 개행 문자 제거

            switch (choice) {
                case 1:
                    note.fileSave();
                    break;
                case 2:
                    note.fileOpen();
                    break;
                case 3:
                    note.fileEdit();
                    break;
                case 4:
                    System.out.println("프로그램을 종료합니다.");
                    return;
                default:
                    System.out.println("잘못된 선택입니다. 다시 입력해주세요.");
            }
        }
    }
}