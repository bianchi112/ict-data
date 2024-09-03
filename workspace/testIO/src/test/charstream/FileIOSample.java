package test.charstream;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class FileIOSample {
	// DI
	private Scanner sc = new Scanner(System.in);
	
	public void fileSave() {
		System.out.print("저장할 파일명 (파일명.txt) : ");
		String fileName = sc.next();
		
		File saveFile = new File(fileName);
		System.out.println("파일 용량 : " + saveFile.length()); // 0 byte
		System.out.println("파일이냐? : " + saveFile.isFile()); // true
		System.out.println("디렉토리냐? : " + saveFile.isDirectory()); // false
		
		// 자동 close 처리할 객체 생성 구문을 try () 안에 작성하면 됨
		// try (클래스타입 레퍼런스 = new 생성자(초기값);)
		try(FileWriter fw = new FileWriter(saveFile);){
			// 대상 파일 없으면 파일을 자동으로 만듦
			// 대상 파일이 있으면, 기존 내용을 지우고 새로쓰기 상태로 열기함
			
			System.out.println(saveFile.getName() + " 에 저장할 내용을 입력하세요.");
			
		}catch(IOException e) {
//			e.printStackTrace();
			System.out.println(e.getMessage());
			return;
		}
	}
	
	public void fileRead() {}
	
	public void fileAppend() {}
	
}
