package practice4;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

public class TestProperties {
	public static void main(String[] args) {
		TestProperties test = new TestProperties();
		Student[] students = test.readFile();

		test.printConsole(students);
		test.saveXMLFile(students);
	}

	public Student[] readFile() {
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream("score.txt");
				InputStreamReader isr = new InputStreamReader(fis, "UTF-8")) { 
			props.load(isr);
		} catch (IOException e) {
			e.printStackTrace();
		}

		Student[] students = new Student[props.size()];
		int index = 0;

		for (String key : props.stringPropertyNames()) {
			String[] values = props.getProperty(key).split(", ");
			int sno = Integer.parseInt(key);
			String sname = values[0];
			int kor = Integer.parseInt(values[1]);
			int eng = Integer.parseInt(values[2]);
			int mat = Integer.parseInt(values[3]);

			students[index++] = new Student(sno, sname, kor, eng, mat);
		}

		return students;
	}

	public void printConsole(Student[] sr) {
		System.out.println("학생 정보:");
		for (Student student : sr) {
			System.out.println(student);
		}

		int totalKor = 0, totalEng = 0, totalMat = 0;

		for (Student student : sr) {
			totalKor += student.getKor();
			totalEng += student.getEng();
			totalMat += student.getMat();
		}

		System.out.println("국어 총합: " + totalKor + ", 평균: " + totalKor / sr.length);
		System.out.println("영어 총합: " + totalEng + ", 평균: " + totalEng / sr.length);
		System.out.println("수학 총합: " + totalMat + ", 평균: " + totalMat / sr.length);
	}

	public void saveXMLFile(Student[] sr) {
		Properties props = new Properties();

		for (Student student : sr) {
			props.setProperty(String.valueOf(student.getSno()), student.toString());
		}

		try (FileOutputStream fos = new FileOutputStream("student.xml")) {
			props.storeToXML(fos, "Student Data");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
