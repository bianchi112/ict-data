package Workshop4;

import java.util.Random;
import java.util.Scanner;

public class Test06 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int rows = 0; // 입력받은 숫자 1
        int cols = 0; // 입력받은 숫자 2
        int[][] arr; 
        double sum = 0; // 총합 저장 변수

        while (true) {
            System.out.print("두 개의 정수를 입력하세요 (1~5): ");
            // 사용자 입력을 문자열로 받기
            String inputLine = scanner.nextLine();
            String[] parts = inputLine.split("\\s+"); // 공백을 기준으로 입력을 나누기

            // 입력된 데이터가 두 개인지 확인
            if (parts.length != 2) {
                System.out.println("다시 입력 하세요");
                continue; // while 문 다시 시작
            }

            // 입력받은 두개의 값을 정수로 변환
            rows = Integer.parseInt(parts[0]); 
            cols = Integer.parseInt(parts[1]); 

            // 변환된 값(입력한 값)이 5~10 사이에 있다면
            if (rows >= 1 && rows <= 5 && cols >= 1 && cols <= 5) {
                // 입력 받은 두개의 정수를 이용하여 2차원 배열 크기 생성
                arr = new int[rows][cols];
                Random rand = new Random();
                // 배열에 1~5까지의 랜덤한 숫자 삽입
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        arr[i][j] = rand.nextInt(5) + 1; // 1부터 5까지의 랜덤 숫자
                    }
                }

                System.out.println("배열의 내용:");
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        System.out.print(arr[i][j] + " ");
                    }
                    System.out.println();
                }

                // 총합과 평균 계산
                for (int i = 0; i < rows; i++) {
                    for (int j = 0; j < cols; j++) {
                        sum += arr[i][j]; // 배열의 각 숫자 더하기
                    }
                }
                double avg = sum / (rows * cols);

                // 총합과 평균 출력
                System.out.println("sum=" + sum);
                System.out.println("avg=" + avg);
                scanner.close(); // scanner 종료
                break; // 올바른 입력이 들어왔으므로 반복문 종료
            } else {
                System.out.println("숫자를 확인 하세요");
            }
        }
    }
}
