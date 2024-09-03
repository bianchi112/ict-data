package com.ict.day05;

public class Ex06 {
	public static void main(String[] args) {
		// break 와 continue
		// break : 현재 위치의 블록(switch, 반복문)을 탈출할 때 사용하는 예약어
		// continue : 반복문에서 continue 를 만나면 이하 수행문을 포기하고
		//			  다음 회차로 진항하는 예약어 ( for -> 증감식 이동, while -> 조건식 이동)
		// 보통 if 문과 함께 사용
		
		// 1-10 출력
		for(int i=1; i<11; i++) {
			System.out.print(i+" ");
		}
		System.out.println();
		
		// i 가 6일때 break
		for(int i=1; i<11; i++) {
			if(i==6) {
				break;
			}
			System.out.print(i+" ");
		}
		System.out.println();
		
		// i 가 6일때 continue
		for(int i=1; i<11; i++) {
			if(i==6) {
				continue;
			}
			System.out.print(i+" ");
		}
		System.out.println();
		
		// continue 를 이용해서 1-10까지 짝수만 출력하자
		for(int i=1; i<11; i++) {
			if(i%2==1) {
				continue;
			}
			System.out.print(i+" ");
		}
		System.out.println();
		
		
		
	}
}
