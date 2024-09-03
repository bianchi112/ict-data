package Workshop4;

//AccountTest.java
public class AccountTest {
 public static void main(String[] args) {
     // Account 객체 생성
     Account account = new Account("441-0290-1203", 500000, 7.3);

     // 계좌 기본 정보 출력
     System.out.println("계좌정보: " + account.getAccount() + " 현재잔액: " + account.getBalance());

     // account 에 20000원 입금
     account.deposit(20000);

     // 계좌 변경 정보 출력
     System.out.println("계좌정보: " + account.getAccount() + " 현재잔액: " + account.getBalance());

     // 이자 출력
     double interest = account.calculateInterest();
     System.out.println("이자: " + interest);
 }
}
