package Workshop4;

public class AccountTest2 {
    public static void main(String[] args) {
        // 5개의 Account 형 객체 배열 선언
        Account[] accounts = new Account[5];

        // for 문을 이용하여 Account 객체를 배열에 생성
        for (int i = 0; i < accounts.length; i++) {
            // 계좌번호: 221-0101-211X (X 부분은 1부터 5까지의 정수)
            String accountNumber = "221-0101-211" + (i + 1);
            // 잔액 및 이자율은 모두 100000원, 4.5%
            accounts[i] = new Account(accountNumber, 100000, 4.5);
        }

        // for 문을 이용하여 Account 정보 출력(accountInfo() 함수 이용)
        for (int i = 0; i < accounts.length; i++) {
            accounts[i].accountInfo();
            System.out.println();
        }
        System.out.println();

        // for 문을 이용하여 이자율을 변경
        for (int i = 0; i < accounts.length; i++) {
            // 이자율을 3.7%로 변경
            accounts[i].setInterestRate(3.7);
            // 변경된 이자율로 이자 계산
            double interest = accounts[i].calculateInterest();
            // 정보 출력
            accounts[i].accountInfo();
            System.out.println(" "+(int) interest + "원");
        }
    }
}
