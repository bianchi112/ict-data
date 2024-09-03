package com.ict.day06;

import java.util.Arrays;
import java.util.Collections;

public class Ex04 {
	public static void main(String[] args) {
		// Arrays 클래스 : 배열을 다루기 위한 다양한 메서드가 포함되어 있는 클래스
		// 클래스가 가질수 있는 요소 3개 : 필드, 메서드, 생성자
		// 1. 필드 : 변수와 상수 => 데이터, 상태, 특성
		// 2. 메서드 : 동작, 기능, 행동 하는 것
		// 3. 생성자 : 나중에 배우자

		int[] arr = new int[100];

		// for문을 이용한 데이터 저장
		for (int i = 0; i < arr.length; i++) {
			arr[i] = i * 5;
			System.out.println("arr[" + i + "] = " + (i * 5));
		}
		System.out.println();
		System.out.println("===============");
		// binarySearch(배열, 찾을값) : 해당 배열에서 값을 검색 한 후 있는 위치값(index)을 반환
		// 반환 : 해당 메서드 실행 시킨 주체에게 결과값을 준다. ( 없으면 음수 나온다.)
		int su = Arrays.binarySearch(arr, 48);
		System.out.println(su);
		System.out.println();
		System.out.println("===============");
		// copyOf(배열, 새로만든 배열의 길이)
		int[] arr1 = Arrays.copyOf(arr, 3);
		for (int i = 0; i < arr1.length; i++) {
			System.out.println(arr1[i]);
		}
		System.out.println();
		System.out.println("===============");
		int[] arr2 = Arrays.copyOf(arr, 103);
		for (int i = 0; i < arr2.length; i++) {
			System.out.println(arr2[i]);
		}
		System.out.println();
		System.out.println("arr2===============");
		// copyOfRange(배열, 시작위치, 끝위치(포함안됨))
		int[] arr3 = Arrays.copyOfRange(arr, 10, 20);
		for (int i = 0; i < arr3.length; i++) {
			System.out.println(arr3[i]);
		}
		System.out.println();
		System.out.println("arr3===============");
		int[] arr4 = new int[10];
		// fill(배열, 초기값) : 해당 배열의 초기값을 지정
		Arrays.fill(arr4, 3);
		for (int i = 0; i < arr4.length; i++) {
			System.out.println("arr4[" + i + "]=" + arr4[i]);
		}
		System.out.println();
		System.out.println("===============");

		int[] arr5 = { 7, 4, 3, 1, 5, 6, 2 };
		// sort(배열) : 해당 배열 오름차순 정렬
		Arrays.sort(arr5);
		for (int i = 0; i < arr5.length; i++) {
			System.out.println("arr5[" + i + "]=" + arr5[i]);
		}
		System.out.println();
		System.out.println("===============");
		// ** 기본자료형은 내림차순을 만들 수 있는 메소드는 없다.
		// 단, 오름차순된 배열을 반대로 호출 할 수 는 있다.
		int[] arr6 = Arrays.copyOf(arr5, arr5.length);
		int k = 0;
		for (int i = arr5.length - 1; i >= 0; i--) {
			System.out.println("arr5[" + i + "]=" + arr5[i]);
			// arr6[k] = arr5[i] ;
			// k=k+1;
			arr6[k++] = arr5[i];
		}
		System.out.println();
		System.out.println("===============");
		for (int i = 0; i < arr6.length; i++) {
			System.out.println("arr6[" + i + "]=" + arr6[i]);
		}
		System.out.println();
		System.out.println("===============");
		System.out.println("컬렉션을 사용해서 내림차순 만들기(자세하 내용은 뒤에서)");
		// 주의 사항 ; int X, Integer 클래스 사용
		Integer[] arr7 = { 7, 4, 3, 1, 5, 6, 2 };
		Arrays.sort(arr7, Collections.reverseOrder());
		for (int i = 0; i < arr7.length; i++) {
			System.out.println("arr7[" + i + "]=" + arr7[i]);
		}

		// Arrays.asList() : 배열을 리스트(컬렉션)으로 만들기
		// List의 toArray() : 리스트를 배열로 만들기

	}
}
