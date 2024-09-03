package workshop5;

public class AccountTest {
    public static void main(String[] args) {
        // Account 객체 생성
        Account account = new Account("441-0290-1203", 500000, 7.3);

        // 기본 정보 출력
        System.out.println("계좌정보: " + account.getAccount() + " " + account.getBalance() + " " + account.getInterestRate());

        // 입금 처리 및 결과 출력
        String depositResult = account.deposit(-10);
        System.out.println(depositResult);

        // 출금 처리 및 결과 출력
        String withdrawResult = account.withdraw(600000);
        System.out.println(withdrawResult);

        // 이자 출력
        System.out.println("이자: " + account.calculateInterest());
        
        
    }
}