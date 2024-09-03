package com.ict.day06;

public class Ex05 {

	public static void main(String[] args) {
		String str = "강남 한국 ICT 인재개발원 4층 1강의실";

		// 1. charAt(int index) : char
		// 위치값 (= index = 0부터 시작) 숫자가 들어오면 해당 위치에 있는 글자를 반환한다.
		char c1 = str.charAt(3);
		System.out.println(c1);

		// 소문자를 대문자로 변경 ( 대문자 == 소문자 - 32)
		str = "한국 I Love You 1004";
		for (int i = 0; i < str.length(); i++) {
//			System.out.println(str.charAt(i));
			char ch = str.charAt(i);
			if (ch >= 'a' && ch <= 'z') {
				ch = (char) (ch - 32);
			}
			System.out.println(ch);
		}
		System.out.println();
		System.out.println("=================");

		// 2. concat(String str) : String
		// 현재 문자열과 입력된 문자열을 합친다.("문자열"++"문자열" 과 같은 효과)
		String s1 = "대한민국";
		String s2 = s1 + "파이팅";
		System.out.println(s2);

		String s3 = s1.concat(" KOREA");
		System.out.println(s3);

		// 3. contains(CharSequence s) : boolean
		// CharSequence는 char 값을 순서대로 읽는다.
		// 지금은 String 이라고 생각하자
		// 입력된 문자열이 현재 문자열에 포함되어 있으면 true, 없으면 false

		String s4 = "nojm73@gmail.com";
		boolean result = s4.contains("@");
		System.out.println("결과 : " + result);

		// 4. equals(Object anObject) : boolean
		// Object anObject => String
		// 입력된 문자열과 현재 문자열의 내용이 같으면 true, 아니면 false (대소문자 구별)
		// String 의 같다 라는 비교는 숫자처럼 == 를 사용하지 않습니다.

		// 5. equalsIgnoreCase(String snotherString) : boolean
		// 입력된 문자열과 현재 문자열의 내용이 같으면 true, 아니면 false (대소문자 구별 안함)

		String s5 = "Korea";
		String s6 = "KOREA";
		if (s5.equals(s6)) {
			System.out.println("같다");
		} else {
			System.out.println("다르다");
		}
		System.out.println();

		if (s5.equalsIgnoreCase(s6)) {
			System.out.println("같다");
		} else {
			System.out.println("다르다");
		}
		System.out.println();

		// 6. format(String format, Object...args) : static String
		// 형식을 지정하면 형식에 맞게 문자열 생성

		String s7 = "한국 ICT 인재 개발원";

		// %s => 문자열
		String s8 = String.format("@@ %s !! 파이팅", s7);
		System.out.println(s8);

		// %30s => 30자리 차지하는 문자열 (남은 자리는 비워둔다.) 오른쪽 정렬
		String s9 = String.format("%30s", s7);
		System.out.println(s9);

		// - 는 왼쪽 정렬
		String s10 = String.format("%-30s", s7);
		System.out.println(s10);

		// 문자열의 길이보다 작으면 글자 수 만큼 확장 된다.
		String s11 = String.format("%6s", s7);
		System.out.println(s11);

		// %d 정수 형식
		int k = 2134;
		String s12 = String.format(" ^^ %d ~~~", k);
		System.out.println(s12);

		String s13 = String.format("%10d", k);
		System.out.println(s13);

		String s14 = String.format("%-10d", k);
		System.out.println(s14);

		String s15 = String.format("^ ^ %2d", k);
		System.out.println(s15);

		// %f 실수 형식 : 소수점을 지정하면 반올림 처리된다.
		double s16 = 123.445678;
		String s17 = String.format("%f", s16);
		System.out.println(s17);

		String s18 = String.format("%.1f", s16);
		System.out.println(s18);

		String s19 = String.format("%.3f", s16);
		System.out.println(s19);

		System.out.println();

		// 7. getBytes() : byte[]
		// 해당 문자열을 byte[]로 반환한다. => 입력/출력 스트림에 사용된다.
		// byte 는 영어 대소문자, 숫자, 일부 특수문자를 숫자로 표현
		// 영어를 제외한 나머지 글자는 제대로 안나옴 => toCharArray() 가 해결함
		String s20 = "java";
		byte[] b1 = s20.getBytes();
		for (int i = 0; i < b1.length; i++) {
			System.out.println(b1[i]);
		}
		System.out.println("----------------------");
		
		s20 = "ifc 인재개발원 2 center";
		b1 = s20.getBytes();
		for(int i=0; i<b1.length;i++) {
			System.out.println(b1[i] + ":"+(char)(b1[i]));
		}
		System.out.println("----------------------");
				
		// 7-1 toCharArray() : char[]
		// 해당 문자열을 Char[]로 반환 => 입력/출력 스트림에 사용된다.
		// 영어 대소문자, 숫자 뿐만 아니라 전 세꼐문자도 가능하다.
		char[] ch = s20.toCharArray();
		for (int i = 0; i < ch.length; i++) {
			System.out.println(ch[i]);
		}
		
		

		// 8. indexOf(int ch), indexOf(String str) : int
		// 입력된 문자(ch), 문자열(str) 의 첫번째 위치값을 알려준다.
		// 문자나 문자열이 없으면 -1 반환된다.
		String s21 = "BufferedReader";
		int n1 = s21.indexOf('e');
		System.out.println("첫번째 e위 위치 : " + n1);

		int n2 = s21.indexOf("er");
		System.out.println("첫번째 er의 위치 : " + n2);

		int n3 = s21.indexOf("err");
		System.out.println("첫번째 err의 위치 : " + n3);

		// 9. indexOf(int ch, int forIndex), indexOf(String str, int fromIndex) : int
		// fromIndex => 시작위치를 뜻한다.
		// fromIndex 를 이용하면 2번째, 3번째 문자나 글자를 찾을 수 있다.

		// 일단은 첫번째를 찾자
		int n4 = s21.indexOf("e"); // 4
		int n5 = s21.indexOf("e", n4 + 1);
		System.out.println("두번째 e의 위치 : " + n5);
		
		// 10. laseIndexOf(int ch), lastIndexOf(String str) : int
		// 마지막 문자나 문자열의 위치를 찾을 때 사용
		int n6 = s21.lastIndexOf("e");
		System.out.println("마지막 e의 위치 : " + n6); // 12
		
		// 11/ length():int
		// 해당 문자열의 길이를 구한다.(길이, 개수 는 1 부터 시작)
		String s22 = "Hello World";
		System.out.println("길이 : " + s22.length()); // 11
		
		// 12. replace(char oldChar, char newChar) : String
		//	   replace(CharSequence target, CharSequence replacement)
		//	   replace(String oldString, String newString)으로 생각하자
		//     새로운 문자나 문자열을 받아서 모두 치환(바꾸기)한다.
		String s23 = "대한민국";
		String s24 = s23.replace('민', '民');
		System.out.println(s23);
		System.out.println(s24);

		String s25 = s23.replace("민", "민 @");
		System.out.println(s25);
		
		String s26 = "010-9797-1110";
		String s27 = s26.replace("-", "");
		System.out.println(s27);
		
		// 12. split(String regex) : String[]
		//	   split(String regex, int limit)
		// regex 는 구분자, limit : 배열의 수 지정
		String[] s28 = s26.split("-");
		for (int i = 0; i < s28.length; i++) {
			System.out.println(s28[i]);
		}
		System.out.println();
		
		String[] s29 = s26.split("-", 4);
		// 3이 나온다는 의미는 더 많이 나눌수 없다.
		for (int i = 0; i < s29.length; i++) {
			System.out.println(s29[i]);	
		}
//		System.out.println(s29.length);
		
		// 14. substring(int beginIndex) : String
		//     beginIndex : 시작 위치
		//     시작위치 부터 끝까지 문자열 추출

		// 	   substring(int beginIndex, int ednIndex)
		//     beginIndex : 시작 위치, endIndex : 끝 위치(포함하지 않음)
		
		String s30 = "010-9999-1111";
		String s31 = s30.substring(4);
		System.out.println(s31);
		
		String s32 = s30.substring(9);
		System.out.println(s32);
		
		String s33 = s30.substring(4, 8);
		System.out.println(s33);
		
		String s34 = "****";
		System.out.println(s30.replace(s30.substring(9), s34));
		System.out.println(s30.replace(s30.substring(4,8), s34));
		
		String s35 = "홍길동";
		s34 = "*";
		System.out.println(s35.replace(s35.subSequence(1, 2), s34));
		// 숙제) 이름이 4개 이상일때 * 표시하기 (for문 이용)
		
		// 15. toLowerCase() : String
		//     해당 문자열의 대문자를 소문자로 변경
		//	   toUpperCase() : String
		// 	   해당 문자열의 소문자를 대문자로 변경
		s35 = "한국 ICT 인재 개발원 Love You !!!";
		String s36 = s35.toLowerCase();
		String s37 = s35.toUpperCase();
		System.out.println(s36);
		System.out.println(s37);
		
		// 16. toString : String
		//     모든 클레스에 toString
		//     모든 객체(클래스)가 가지고 있는 정보나 데이터(값)들을
		//     문자열로 만들어서 반환 하는 메서드다
		//     String 클래스에서는 문자열 자체를 반환한다.
		
		String s38 = "JAVA 17 자바 17";
		String s39 = s38.toString();
		System.out.println(s38);
		System.out.println(s39);
		
		// 17. trim() : String
		//  해당 문자열에 앞, 뒤 공백 제거, 
		//  해당 문자열의 중간 공백은 제거하지 않는다.
		String s40 = "  java  자바   ";
		String s41 = s40.trim();
		System.out.println("길이 : " + s40.length());
		System.out.println("길이 : " + s41 .length());
		
		// 18. startWith(String prefix) : boolean
		//     입력된 문자열로 시작하면 true
		
		//     endsWith(String suffix) boolean
		//     입력된 문자열로 끝나면 true
		
		boolean bo1 = s40.startsWith("j");
		System.out.println("결과 : "+bo1);
		
		boolean bo2 = s41.startsWith("j");
		System.out.println("결과 : "+bo2);
		System.out.println("=========================");
		
		// 19. valudOf(각종 기본자료형) : String
		//     어떤 기본자료형이든지 String 으로 변경시킴 ( 기본자료형 + "")
		boolean boo = true;
		char cha = 'c';
		int number =34;
		long number2 = 458L;
		float number3 = 3789.16f;
		double number4 = 34578.14;
		
		// 실제 자료형에 +1 을 한다
//		System.out.println(boo + 1);
		System.out.println(cha + 1);
		System.out.println(number + 1);
		System.out.println(number2 + 1);
		System.out.println(number3 + 1);
		System.out.println(number4 + 1);
		System.out.println();
		
		System.out.println(cha + "1");
		System.out.println(number + "1");
		System.out.println(number2 + "1");
		System.out.println(number3 + "1");
		System.out.println(number4 + "1");
		System.out.println();
		
		System.out.println(String.valueOf(boo)+1);	   // "true" + 1 
		System.out.println(String.valueOf(cha)+1);     // "c" + 1
		System.out.println(String.valueOf(number)+1);  // "34" + 1
		System.out.println(String.valueOf(number2)+1); // "458" + 1
		System.out.println(String.valueOf(number3)+1); // "3789.16" + 1
		System.out.println(String.valueOf(number4)+1); // "34578.14" + 1
		System.out.println("---------------------------");
		
		// 20. Wrapper 클래스
		//     기본자료형을 객체로 만들 때 사용하는 클래스
		//     기본자료형의 형태를 가진 문자열을 해당 자료형으로 변경시키는 클래스들
		// 20-1. Boolean 클래스 : "true" 나 "flase"를 true, false 로 만듦
		//                      "true"가 문자열이면 false를 만든다.
		String str1 = "true";
		boolean str2 = Boolean.parseBoolean(str1);
		System.out.println(str1);
		System.out.println(str2);
//		if(str1) {}
//		if(str2) {}
		
		// 20-2. Integer 클래스 : 정수형태의 문자열("10", "2145")을 int 형으로 변경 시키는 클래스
		String str3 = "14";
		int str4 = Integer.parseInt(str3);
		System.out.println(str3 + 10); // 1410
		System.out.println(str4 + 10); // 24
		
		// 20-3. Long 클래스 : 정수형태의 문자열("10", "2145")을 long 형으로 변경 시키는 클래스
		String str5 = "123";
		long str6 = Long.parseLong(str5);
		System.out.println(str5 + 100); // 123100
		System.out.println(str6 + 100); // 223
		
		//20-4. Float 클래스 : 실수형태의 문자열("234.12")을 float 형으로 변경 시키는 클래스
		String str7 = "234.12";
		float str8 = Float.parseFloat(str7);
		System.out.println(str7 + 1.5); // 234.12.1.5
		System.out.println(str8 + 1.5); // 235.62
		
		// 20-5. Double 클래스 : 실수형태의 문자열("234.12")을 double 형으로 변경 시키는 클래스
		String str9 = "234.12";
		double str10 = Double.parseDouble(str9);
		System.out.println(str9 + 1.5);  // 234.121.5
		System.out.println(str10 + 1.5); // 235.62
		
		// 20-6. Character 클래스 : Character.parseCharacter()는 존재하지 않는다.
		//						  String 클래스 charAt()를 사용하면 char 를 만들수 있다.
		String str11 = "G";
		char str12 = str11.charAt(0);
		System.out.println(str11 + 1); // G1
		System.out.println((char)(str12 + 1)); // H
		
	}

}
