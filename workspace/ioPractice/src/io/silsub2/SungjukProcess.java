package io.silsub2;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class SungjukProcess {
	private Scanner sc;

	public SungjukProcess() {
		sc = new Scanner(System.in);
	}

	// 점수를 입력받아 파일에 저장하는 메소드
	public void sungjukSave() {
		try (DataOutputStream dos = new DataOutputStream(new FileOutputStream("score.dat", true))) {
			while (true) {
				System.out.print("국어 점수: ");
				int kor = sc.nextInt();

				System.out.print("영어 점수: ");
				int eng = sc.nextInt();

				System.out.print("수학 점수: ");
				int math = sc.nextInt();

				int total = kor + eng + math;
				double avg = total / 3.0;

				dos.writeInt(kor);
				dos.writeInt(eng);
				dos.writeInt(math);
				dos.writeInt(total);
				dos.writeDouble(avg);

				System.out.print("계속 저장하시겠습니까? (y/n): ");
				sc.nextLine(); // 개행 문자 제거
				if (!sc.nextLine().equalsIgnoreCase("y")) {
					break;
				}
			}
			System.out.println("score.dat 에 저장 완료.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 파일에서 데이터를 읽어와 출력하는 메소드
	public void scoreRead() {
		int totalSum = 0;
		double avgSum = 0.0;
		int count = 0;

		try (DataInputStream dis = new DataInputStream(new FileInputStream("score.dat"))) {
			while (true) {
				try {
					int kor = dis.readInt();
					int eng = dis.readInt();
					int math = dis.readInt();
					int total = dis.readInt();
					double avg = dis.readDouble();

					totalSum += total;
					avgSum += avg;
					count++;

					System.out.printf("국어: %d, 영어: %d, 수학: %d, 총점: %d, 평균: %.2f\n", kor, eng, math, total, avg);
				} catch (EOFException e) {
					break;
				}
			}

			if (count > 0) {
				System.out.printf("전체 총점: %d, 전체 평균: %.2f, 데이터 개수: %d\n", totalSum, avgSum / count, count);
			}
			System.out.println("score.dat 파일 읽기 완료.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// main 메소드: 테스트 코드 포함
	public static void main(String[] args) {
		SungjukProcess sp = new SungjukProcess();

		sp.sungjukSave(); // 데이터를 저장하는 메소드 호출
		sp.scoreRead(); // 저장된 데이터를 읽는 메소드 호출
	}
}