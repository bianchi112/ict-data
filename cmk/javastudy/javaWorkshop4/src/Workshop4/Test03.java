package Workshop4;

public class Test03 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] arr = { 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
		int tmp; // 임시로 값을 저장할 변수
		// 배열을 내림차순으로 정렬
		for (int i = 0; i < arr.length; i++) {
			// 현재 인덱스와 다음 숫자를 비교
			for (int j = i + 1; j < arr.length; j++) {
				// 현재 숫자가 다믕 숫자보다 작으면 두 숫자를 교체
				if (arr[i] < arr[j]) {
					tmp = arr[i];
					arr[i] = arr[j];
					arr[j] = tmp;
				}
			}
		}
		// 배열에 정렬된 숫자들을 출력
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		System.out.println();
		
	}

}
