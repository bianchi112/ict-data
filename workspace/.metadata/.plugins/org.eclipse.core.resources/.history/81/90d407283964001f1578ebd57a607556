package test.properties;

import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.Properties;

public class PropertiesSample {
	public void test1() {
		// Properties 사용 :
		// 애플리케이션의 설정 값들을 저장하고, 실행시 읽어 들여서 프로그램에 적용하는 용도로 사용할 때
		// 주로 이용하는 클래스임
		Properties prop = new Properties(); // 설정값 저장 용도로 사용함
		// 키도 String, 값도 String 으로 정해진 클래스임
		// Properties 이름 옆에 <영문자, 영문자> 제네릭 표시가 없음

		// 설정값 저장시 : setProperty(String key, String value) 사용함
		prop.setProperty("driver", "oracle.jdbc.driver.OracleDriver");
		prop.setProperty("url", "jdbc:oracle:thin:@127.0.0.1:1521:xe");
		prop.setProperty("user", "c##student");
		prop.setProperty("passwd", "student");

		System.out.println(prop);

		// 파일에 출력 저장
		try {
			prop.store(new FileOutputStream("db_setting.dat"), "jdbc oracle connection setting");
			prop.store(new FileWriter("db_setting.txt"), "jdbc oracle connection setting");
			prop.storeToXML(new FileOutputStream("db_setting.xml"), 
					"jdbc oracle connection setting", "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
