package com.ict.day02;

public class Ex08 {

	public static void main(String[] args) {
		// 9630초는 몇시 몇분 몇초인가?
		
		int total = 9630;
		int h = total / 3600;
		int m = (total % 3600) / 60;
		int s = total % 60;
				
		System.out.println(h + "시 " + m + "분 " + s + "초");
		
		

	}

}
