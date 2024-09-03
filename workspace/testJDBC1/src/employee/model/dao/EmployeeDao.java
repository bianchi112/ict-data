package employee.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import employee.model.dto.Employee;

//서비스 모델 : 비즈니스 로직(jdbc) 처리용 클래스
//dao (database access object) : db 접속 객체
public class EmployeeDao {
	// 실행시킬 쿼리문장 하나당 메소드 한개씩 작성함
//	System.out.println("1. 직원 전체 조회 출력");
	public ArrayList<Employee> selectAll() {
		ArrayList<Employee> list = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from employee";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset != null) { // select 쿼리문 실행이 성공했다면
				list = new ArrayList<Employee>();

				while (rset.next()) { // 조회해 온 데이터 행이 존재한다면, 반복 실행
					// 각 컬럼 값 꺼내서 객체에 저장 처리
					Employee emp = new Employee();

					// 결과 매핑 : 컬럼값 꺼내서 객체 필드에 기록 저장하는 것
					emp.setEmpId(rset.getString("emp_id"));
					emp.setEmpName(rset.getString("emp_name"));
					emp.setEmpNo(rset.getString("emp_no"));
					emp.setEmail(rset.getString("email"));
					emp.setPhone(rset.getString("phone"));
					emp.setJobId(rset.getString("job_id"));
					emp.setHireDate(rset.getDate("hire_date"));
					emp.setSalary(rset.getInt("salary"));
					emp.setBonusPct(rset.getDouble("bonus_pct"));
					emp.setMarriage(rset.getString("marriage"));
					emp.setMgrId(rset.getString("mgr_id"));
					emp.setDeptId(rset.getString("dept_id"));

					list.add(emp); // 리스트에 저장
				} // while
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

//	System.out.println("2. 사번으로 직원 조회 출력");
	public Employee selectOne(String empId) {
		Employee emp = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from employee where emp_id = '" + empId + "'";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) { // 조회해 온 데이터 행이 존재한다면
				// 각 컬럼 값 꺼내서 객체에 저장 처리
				emp = new Employee();

				// 결과 매핑 : 컬럼값 꺼내서 객체 필드에 기록 저장하는 것
				emp.setEmpId(empId);
				emp.setEmpName(rset.getString("emp_name"));
				emp.setEmpNo(rset.getString("emp_no"));
				emp.setEmail(rset.getString("email"));
				emp.setPhone(rset.getString("phone"));
				emp.setJobId(rset.getString("job_id"));
				emp.setHireDate(rset.getDate("hire_date"));
				emp.setSalary(rset.getInt("salary"));
				emp.setBonusPct(rset.getDouble("bonus_pct"));
				emp.setMarriage(rset.getString("marriage"));
				emp.setMgrId(rset.getString("mgr_id"));
				emp.setDeptId(rset.getString("dept_id"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return emp;
	}

//	System.out.println("3. 새 직원 등록");
	public int insertEmployee(Employee emp) {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;

		String query = "insert into employee (emp_id, emp_name, emp_no, email, phone, "
				+ "job_id, salary, bonus_pct, marriage, mgr_id, hire_date, dept_id) " + "values (seq_empid.nextval, '"
				+ emp.getEmpName() + "', '" + emp.getEmpNo() + "', '" + emp.getEmail() + "', '" + emp.getPhone()
				+ "', '" + emp.getJobId() + "', " + emp.getSalary() + ", " + emp.getBonusPct() + ", '"
				+ emp.getMarriage() + "', '" + emp.getMgrId() + "', '" + emp.getHireDate() + "', '" + emp.getDeptId()
				+ "')";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();

			result = stmt.executeUpdate(query);

			if (result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

//	System.out.println("4. 직원 정보 수정");
	public int updateEmployee(Employee emp) {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;

		String query = "update employee set salary = " + emp.getSalary() + ", bonus_pct = " + emp.getBonusPct()
				+ " where emp_id = '" + emp.getEmpId() + "'";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();

			result = stmt.executeUpdate(query);

			if (result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

//	System.out.println("5. 직원 삭제");
	public int deleteEmployee(String empId) {
		int result = 0;
		Connection conn = null;
		Statement stmt = null;

		String query = "delete from employee where emp_id = '" + empId + "'";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();

			result = stmt.executeUpdate(query);

			if (result > 0) {
				conn.commit();
			} else {
				conn.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

//	System.out.println("6. 부서로 조회");
	public ArrayList<Employee> selectDept(String deptId) {
		ArrayList<Employee> list = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from employee where dept_id = '" + deptId + "'";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset != null) { // select 쿼리문 실행이 성공했다면
				list = new ArrayList<Employee>();

				while (rset.next()) { // 조회해 온 데이터 행이 존재한다면, 반복 실행
					// 각 컬럼 값 꺼내서 객체에 저장 처리
					Employee emp = new Employee();

					// 결과 매핑 : 컬럼값 꺼내서 객체 필드에 기록 저장하는 것
					emp.setEmpId(rset.getString("emp_id"));
					emp.setEmpName(rset.getString("emp_name"));
					emp.setEmpNo(rset.getString("emp_no"));
					emp.setEmail(rset.getString("email"));
					emp.setPhone(rset.getString("phone"));
					emp.setJobId(rset.getString("job_id"));
					emp.setHireDate(rset.getDate("hire_date"));
					emp.setSalary(rset.getInt("salary"));
					emp.setBonusPct(rset.getDouble("bonus_pct"));
					emp.setMarriage(rset.getString("marriage"));
					emp.setMgrId(rset.getString("mgr_id"));
					emp.setDeptId(rset.getString("dept_id"));

					list.add(emp); // 리스트에 저장
				} // while
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

//	System.out.println("7. 직급으로 조회");
	public ArrayList<Employee> selectJob(String jobId) {
		ArrayList<Employee> list = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from employee where job_id = '" + jobId + "'";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "c##jdbc", "jdbc");
			//자동 커밋 안되게 설정
			conn.setAutoCommit(false);
			
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset != null) { // select 쿼리문 실행이 성공했다면
				list = new ArrayList<Employee>();

				while (rset.next()) { // 조회해 온 데이터 행이 존재한다면, 반복 실행
					// 각 컬럼 값 꺼내서 객체에 저장 처리
					Employee emp = new Employee();

					// 결과 매핑 : 컬럼값 꺼내서 객체 필드에 기록 저장하는 것
					emp.setEmpId(rset.getString("emp_id"));
					emp.setEmpName(rset.getString("emp_name"));
					emp.setEmpNo(rset.getString("emp_no"));
					emp.setEmail(rset.getString("email"));
					emp.setPhone(rset.getString("phone"));
					emp.setJobId(rset.getString("job_id"));
					emp.setHireDate(rset.getDate("hire_date"));
					emp.setSalary(rset.getInt("salary"));
					emp.setBonusPct(rset.getDouble("bonus_pct"));
					emp.setMarriage(rset.getString("marriage"));
					emp.setMgrId(rset.getString("mgr_id"));
					emp.setDeptId(rset.getString("dept_id"));

					list.add(emp); // 리스트에 저장
				} // while
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
}
