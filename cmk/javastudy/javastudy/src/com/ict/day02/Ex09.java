package com.ict.day02;

public class Ex09 {

	public static void main(String[] args) {
		// 카페모카가 6500원이다.
		// 친구와 둘이서 15000원 내고 주문했다.
		// 잔돈은 얼마인가? (단, 부가세 10% 포함한다.)
		
		int moca = 6500;
		int vat = moca/10;
		int money = 15000;
		int changes = money - (moca*2) - (vat*2);
		
		System.out.println("잔돈은 " + changes + "원 입니다.");
		
	}

}
