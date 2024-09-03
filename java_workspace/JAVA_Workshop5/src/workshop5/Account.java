package workshop5;


public class Account {
    private String account;
    private double balance;
    private double interestRate;

    // 기본 생성자
    public Account() {}

    // 3개의 클래스 변수를 받는 생성자
    public Account(String account, double balance, double interestRate) {
        this.account = account;
        this.balance = balance;
        this.interestRate = interestRate;
    }

    // 이자 계산 메소드
    public double calculateInterest() {
        return  balance * (interestRate / 100);
    }

    // 입금 처리 메소드
    public String deposit(double money) {
        if (money <= 0) {
        	System.out.println();
            return "입금 금액이 0보다 적습니다.";
        }
        balance += money;
        return "입금 성공: " + money + "원";
    }

    // 출금 처리 메소드
    public String withdraw(double money) {
        if (money <= 0 || money > balance) {
            return "출금 금액이 0보다 적거나 현재 잔액보다 많습니다.";
        }
        balance -= money;
        return "출금 성공: " + money + "원";
    }

    // Getter와 Setter 메소드
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public double getInterestRate() {
        return interestRate;
    }

    public void setInterestRate(double interestRate) {
        this.interestRate = interestRate;
    }
}
