package Workshop4;

public class Account {
	private String account;
	private int balance;
	private double interestRate;

	// 기본 생성자
	public Account() {
	}

	// 3개의 매개변수를 받는 생성자
	public Account(String account, int balance, double interestRate) {
		this.account = account;
		this.balance = balance;
		this.interestRate = interestRate;
	}

	// 계좌정보를 셋팅
	public void setAccount(String account) {
		this.account = account;
	}

	// 계좌정보를 리턴
	public String getAccount() {
		return account;
	}

	// 잔액정보를 리턴
	public int getBalance() {
		return balance;
	}

	// 이자율정보를 리턴
	public double getInterestRate() {
		return interestRate;
	}

	// 이자율을 설정
	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	// 현재 잔액을 기준으로 이자를 계산
	public double calculateInterest() {
		return balance * (interestRate / 100);
	}

	// 입금을 통해 잔액정보를 증가
	public int deposit(int money) {
		balance += money;
		return balance;
	}

	// 출금을 통해 잔액정보를 감소
	public void withdraw(int money) {
		if (balance >= money) {
			balance -= money;
		} else {
			System.out.println("잔액이 부족합니다.");
		}
	}

	// AccountTest2
	// Account 의 모든 정보를 출력할수 있는 메서드
	public void accountInfo() {
		System.out.print("계좌번호: " + account + " 잔액: " + balance + "원 이자율: " + interestRate + "%");
	}
}
