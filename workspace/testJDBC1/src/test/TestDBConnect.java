package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDBConnect {
	
	public TestDBConnect() {}
	
	public void oracleConnect() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		try {
			//1. 오라클 jdbc 드라이브 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. db 연결
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			System.out.println(conn);
			
			//3. 문장(Statement) 객체 만들기
			stmt = conn.createStatement();
			
			//4. SQL 전송하고 결과받기
			String query = "select * from employee";  //executeQuery(query) : ResultSet 사용함
			//dml(insert, update, delete) 문 : executeUpdate(query) : int (처리된 행갯수)
			rset = stmt.executeQuery(query);
			System.out.println(rset);
			
			//5. 받은 결과 처리하기
			while(rset.next()) { //데이터가 기록된 행이 있다면 true 반환됨
				//rset 이 참조하는 행의 각 컬럼값을 추출함 : get자료형("컬럼명"), get자료형(컬럼순번)
				System.out.println(rset.getString("emp_id") + ", " + rset.getString(2) + ", "
						+ rset.getString("emp_no") + ", " + rset.getString("email") + ", "
						+ rset.getString("phone") + ", " + rset.getDate("hire_date") + ", "
						+ rset.getString(7) + ", " + rset.getInt("salary") + ", "
						+ rset.getDouble("bonus_pct") + ", " + rset.getString("marriage").charAt(0)
						+ ", " + rset.getString("mgr_id") + ", " + rset.getString("dept_id"));			
			}
			
		} catch (ClassNotFoundException e) {	
			//드라이브 패키지명, 클래스명 오타, ojdbc8.jar 추가하지 않았을 때
			e.printStackTrace();
		} catch (SQLException e) {	
			//url, user, password 오타
			//쿼리문 잘못 작성시, get자료형() 사용시 컬럼명 오타, 컬럼자료형과 일치하지 않을 때
			e.printStackTrace();
		} finally {
			try {
				//6. 반드시 닫기 : 생성과 반대 순서로 닫기함
				rset.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		// oracle db 연결 테스트
		new TestDBConnect().oracleConnect();
	}

}
