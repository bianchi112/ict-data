package io.silsub3;

public class TestBookManager {
	public static void main(String[] args) {
		BookManager bm = new BookManager();

		bm.fileSave(); // Book 객체를 파일에 저장
		bm.fileRead(); // 파일에서 Book 객체를 읽어와 출력
	}
}