package com.ict.day05;

public class Ex03 {
	public static void main(String[] args) {
		// while 문
		// 형식2)
		//		초기식
		//		while(true){
		//		  [ if(빠져나갈 조건)] break;]
		//		  실행할 내용 ;
		//		  [ if(빠져나갈 조건)] break;]	
		//			증감식;
		//		}
		
		// 1-10까지 출력
		int i =1;
		while(true) {
			if(i>11) break;
			System.out.println(i+" ");
			i++;
		}
		System.out.println();
		
		i = 1;
		while(true) {
			System.out.println(i+" ");
			if(i>=10) {
				break;
			}
			i++;
		}
		System.out.println();
		
	}
}
