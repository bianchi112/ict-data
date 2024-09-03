package Workshop4;

import java.util.Scanner;

public class Test04 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int input;

        // 올바른 입력을 받을 때까지 반복
        while (true) {
            System.out.print("입력 값: ");
            input = sc.nextInt();

            // 입력 값이 5~10 사이인지 확인
            if (input >= 5 && input <= 10) {
                break; // 올바른 입력이 들어오면 반복 종료
            } else {
            	// 올바른 입력이 아니면 경고 메시지 출력 후 재입력
                System.out.println("5~10 사이로 입력해주세요");
            }
        }
        
        Calc calc = new Calc(); // Calc 클래스 인스턴스 생성
        int result = calc.calculate(input); // 입력값을 Calc 클랫의 calculate 함수로 전달(계산수행)
        // 입력 값 내 짝수만 출력
        System.out.print("짝수: ");
        for (int i = 1; i <= input; i++) {
            if (i % 2 == 0) {
                System.out.print(i + " ");
            }
        }
        System.out.println();
        System.out.println("결과: " + result);
        // scanner 종료
        sc.close();
    }
}
