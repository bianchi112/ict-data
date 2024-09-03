package Workshop4;

import java.util.Scanner;

public class Test05 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		int sum = 0;	  // 합계를 저장
		int num[];        // 조건을 만족하는 숫자들을 저장할 변수
		int numcount = 0; // 배열에 저장된 숫자의 개수를 세는 변수
		while (true) {
			System.out.print("입력 : ");
			int input = sc.nextInt();
			// 입력값이 1~5가 아니면 경고 메시지 출력 후 재입력
			if (input < 1 || input > 5) {
				System.out.println("1~5 사이의 숫자로 입력하세요.");
				
			} else { // 입력 값이 1~5 사이면
				// 배열 초기화 (입력 받은 수부터 10까지의 합)
				num = new int[10 - input + 1];
				for (int i = input; i <= 10; i++) {
					// 숫자가 3의 배수, 5의 배수가 모두 아닌 경우
					if (i % 3 != 0 && i % 5 != 0) {
						num[numcount] = i; // 조건 만족하는 수를 배열에 저장
						numcount++;		   // 배열에 저장된 숫자의 개수를 증가
						sum += i;		   // 조건 만족하는 수를 합계에 더하기
					}
				}
				// 조건 만족하는 숫자가 1개 이상 있으면
				if (numcount > 0) {
					// 첫번째 숫자 출력
					System.out.print(num[0]);
					// 두번째 숫자부터는 앞에 "+" 를 뭍여서 출력
					for (int i = 1; i < numcount; i++) {
						System.out.print("+" + num[i]);
					}
				}
				// 합계 출력
				System.out.println("\n결과: " + sum);
				// 1~5 사이로 입력이 되었으니 반복문 종료
				break;
			}
		}
		// scanner 종료
		sc.close();
	}
}
