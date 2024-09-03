package Workshop4;

public class Calc {
	// 입력 값을 받아서 짝수의 합을 계산하는 메서드
	public int calculate(int data) {
		int sum = 0;
		for (int i = 1; i <= data; i++) {
			if (i % 2 == 0) { // 짝수일 경우에만
				sum += i;	  // 합계에 더하기
			}
		}
		return sum; // 짝수의 합 반환
	}
	
}