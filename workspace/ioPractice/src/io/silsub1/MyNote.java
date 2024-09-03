package io.silsub1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class MyNote {
	private Scanner sc;

	public MyNote() {
		sc = new Scanner(System.in);
	}

	public void fileSave() {
		System.out.println("파일에 저장할 내용을 입력하시오.");
		StringBuilder content = new StringBuilder();
		String input;

		while (!(input = sc.nextLine()).equalsIgnoreCase("exit")) {
			content.append(input).append("\n");
		}

		System.out.println("저장하시겠습니까? (y/n) : ");
		if (sc.nextLine().equalsIgnoreCase("y")) {
			System.out.println("저장할 파일명 : ");
			String fileName = sc.nextLine();

			try (BufferedWriter bw = new BufferedWriter(new FileWriter(fileName))) {
				bw.write(content.toString());
				System.out.println(fileName + " 파일에 성공적으로 저장하였습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void fileOpen() {
		System.out.println("열기할 파일명 : ");
		String fileName = sc.nextLine();

		try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
			String line;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void fileEdit() {
		System.out.println("수정할 파일명 : ");
		String fileName = sc.nextLine();

		StringBuilder content = new StringBuilder();

		try (BufferedReader br = new BufferedReader(new FileReader(fileName))) {
			String line;
			while ((line = br.readLine()) != null) {
				content.append(line).append("\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}

		System.out.println("파일에 추가할 내용을 입력하시오.");
		String input;
		while (!(input = sc.nextLine()).equalsIgnoreCase("exit")) {
			content.append(input).append("\n");
		}

		System.out.println("변경된 내용을 파일에 추가하시겠습니까? (y/n) : ");
		if (sc.nextLine().equalsIgnoreCase("y")) {
			try (BufferedWriter bw = new BufferedWriter(new FileWriter(fileName))) {
				bw.write(content.toString());
				System.out.println(fileName + " 파일의 내용이 변경되었습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}