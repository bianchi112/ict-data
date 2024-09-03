package Workshop4;

public class Test01 {

	public static void main(String[] args) {
		int[][] arr2 = { { 5, 5 }, 
						 { 10, 10, 10, 10, 10 }, 
						 { 20, 20, 20 }, 
						 { 30, 30, 30, 30 } };
		int sum = 0;   // 합
		double avg;    // 평균
		int count = 0; // 배열 안의 값 개수

		for (int i = 0; i < arr2.length; i++) {
			for (int j = 0; j < arr2[i].length; j++) {
				sum += arr2[i][j];
				count++; // 배열 안의 값 개수 체크
			}
		}
		
		avg = (double) sum / count;

		System.out.println("total=" + sum);
		System.out.println("average=" + avg);

	}

}
