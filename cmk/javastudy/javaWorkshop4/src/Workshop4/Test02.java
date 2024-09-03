package Workshop4;

import java.util.Random;

public class Test02 {

    public static void main(String[] args) {
        int[] arr3 = new int[5];
        int sum = 0; 				  // 합계 
        double avg; 				  // 평균
        Random random = new Random(); // 랜덤
        int index = 0;
        
        while (index < arr3.length) {
            int num = random.nextInt(10) + 1; // 1부터 10까지의 랜덤 숫자
            boolean randumDup = false;

            // 중복 확인 (처음은 당연히 중복 아님, 고로 배열의 첫번째는 for 문 안돔)
            for (int i = 0; i < index; i++) {
                if (arr3[i] == num) {
                    randumDup = true;
                    break;
                }
            }
            // 중복이 없으면 배열에 추가
            if (!randumDup) {
                arr3[index] = num;
                index++; // 두번째부터 index 가 1이 되며 증감하니 중복검사 for 문 실행
            }
        }
        
        // 배열의 값을 출력하고 합계 계산
        for (int i = 0; i < arr3.length; i++) {
            System.out.print(arr3[i] + " ");
            sum += arr3[i];
        }
        
        // 평균 계산
        avg = (double) sum / arr3.length; // 평균을 실수형으로 계산
        
        // 결과 출력
        System.out.println("\nsum=" + sum);
        System.out.println("avg=" + avg);
    }
}
