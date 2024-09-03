package com.ict.day03;

public class Ex01 {

	public static void main(String[] args) {
		// 논리연산자 : &&(AND, 논리곱, 교집합)
		// 			  ||(OR, 논리합, 합집합)
		// 			  ! (NOT, 논리부정)
		
		// 연산 대상 : 비교연산자, 논리연산자, 논리형(true, false)
		// 결과는 boolean 형이다.
		// 주로 조건식에 사용 된다.
		
		// || (OR, 논리합, 합집합)
		// 주어진 조건들 중에 하날도 true가 있으면 겨로가는 true;
		// 조건들 중에 true가 있으면 이후 연산을 하지 않는다.
		
		int su1 = 10;
		int su2 = 7;
		boolean res;
		
		//        true   ||    true
		res = (su1 >= 7) || (su2 >= 5);
		System.out.println("결과 : " + res);

		//        true   ||    false
		res = (su1 >= 7) || (su2 <= 5);
		System.out.println("결과 : " + res);
		
		//       false   ||    true
		res = (su1 <= 7) || (su2 >= 5);
		System.out.println("결과 : " + res);

		//       false   ||    false
		res = (su1 <= 7) || (su2 <= 5);
		System.out.println("결과 : " + res);
		System.out.println();
		
		// OR은 true를 만나면 결과가 true 이므로 이후 연산을 하지 않는다.
		su1 = 10;
		su2 = 7;
		res = ((su1 = su1 + 2) < su2) || (su2 == (su2 + 5));
		System.out.println("결과 : " + res);
		System.out.println("su1 : " + su1);
		System.out.println("su2 : " + su2);
		System.out.println();
		
		// NOT ( !, 논리부정)
		// 주어진 논리값을 반대로 출력
		// true -> false, false -> true
		
		res = true;
		System.out.println(res);
		System.out.println(!res);
		System.out.println(!!res);
		System.out.println(!!!res);
		
	}

}
