package test.objectio;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;

public class MemberManager {
	private Scanner sc = new Scanner(System.in);
	private Member[] marray;
	
	// 초기화블럭
	{
		marray = new Member[] {
				new Member("홍길동", 29, '남', "hong77@test.org", "010-1234-5678", 13500.77),
				new Member("신사임당", 45, '여', "sin59@test.org", "010-5959-5678", 26578.77),
				new Member("황지니", 23, '여', "hwang99@test.org", "010-9999-5678", 35741.77)
		};
	}
	
	public MemberManager() {}

	// 생성자에서 객체배열의 주소를 전달받아 초기화 처리
	public MemberManager(Member[] array) {
		marray = array;
	}

	public void fileSave() {
		System.out.print("저장할 파일명 (.dat): ");
		String fileName = sc.next();

//		try(FileOutputStream fout = new FileOutputStream(fileName);
//				ObjectOutputStream objOut = new ObjectOutputStream(fout);){
		try (ObjectOutputStream objOut = new ObjectOutputStream(
				new FileOutputStream(fileName));) {

			// 준비된 객체 배열을 파일에 저장 처리
			for(Member m : marray) {
				objOut.writeObject(m);
			}
			
			System.out.println(fileName + " 파일에 저장 완료!");
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return;
		}
	}

	public void fileRead() {
		System.out.print("읽을 파일명 : ");
		String fileName = sc.next();
		
		try (ObjectInputStream objIn = new ObjectInputStream(
				new FileInputStream(fileName));){
			// 읽어 들일 객체 저장할 객체 배열 선언 및 할당함
			Member[] members = new Member[marray.length];
			
			for (int i = 0; i <members.length; i++) {
				members[i] = (Member)objIn.readObject();
				System.out.println(members[i]);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return;
		}
	}
	
}
