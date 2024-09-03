package workshop5;

public class StudentTest {
    public static void main(String[] args) {
        // Student 객체 배열 생성
        Student studentArray[] = new Student[3];

        // Student 객체 3개 생성하여 배열에 넣기
        studentArray[0] = new Student("홍길동", 15, 171, 81);
        studentArray[1] = new Student("한사람", 13, 183, 72);
        studentArray[2] = new Student("임걱정", 16, 175, 65);

        // 헤더 출력
        System.out.println("이름\t나이\t신장\t몸무게");

        // 배열에 있는 객체 정보를 모두 출력 - 일반 for 문을 이용
        for (int i = 0; i < studentArray.length; i++) {
            Student student = studentArray[i];
            System.out.println(student.getName() + "\t" 
            				 + student.getAge() + "\t" 
            				 + student.getHeight() + "\t" 
            				 + student.getWeight());
        }

        // 나이, 신장, 몸무게의 합계 계산 - 일반 for 문을 이용
        double totalAge = 0;
        double totalHeight = 0;
        double totalWeight = 0;

        for (int i = 0; i < studentArray.length; i++) {
            totalAge += studentArray[i].getAge();
            totalHeight += studentArray[i].getHeight();
            totalWeight += studentArray[i].getWeight();
        }

        // 평균 계산
        double averageAge = totalAge / studentArray.length;
        double averageHeight = totalHeight / studentArray.length;
        double averageWeight = totalWeight / studentArray.length;

        // 평균 값 출력 (소수점 2자리까지 반올림하여 출력)
        System.out.printf("나이의 평균: %.2f%n", averageAge);
        System.out.printf("신장의 평균: %.2f%n", averageHeight);
        System.out.printf("몸무게의 평균: %.2f%n", averageWeight);
    }
}