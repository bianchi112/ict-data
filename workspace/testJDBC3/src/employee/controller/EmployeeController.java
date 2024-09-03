package employee.controller;

import java.util.ArrayList;

import employee.exception.EmployeeException;
//import employee.model.dao.Employeeservice;
import employee.model.dto.Employee;
import employee.model.service.EmployeeService;

// mvc 패턴 : view(사용자화면) -> 요청 -> controller 가 받음 -> service model 로 전달함
// => service model 은 Connection 연결 요청
// => dao model 로 Connection 과 전달값을 전달 => dao model 이 결과 리턴 => service model 이 결과 받음, 트랜잭션 관리함
// => controller로 넘김 -> controller 가 받아서 view 로 리턴함 -> view 가 받아서 출력 
// view -> controller ->  service -> dao
public class EmployeeController {
	private EmployeeService eservice;

	public EmployeeController() throws EmployeeException {
		eservice = new EmployeeService();
	}

	// dao 가 가진 메소드와 맞춰서 메소드 구성함
	// view 에서 받은 데이터 가공 처리나 유효성 검사 등을 해서 모델로 넘김

	public ArrayList<Employee> selectList() throws EmployeeException {
		return eservice.selectAll();
	}

	public Employee selectEmp(String empId) throws EmployeeException {
		return eservice.selectOne(empId);
	}

	public int insertEmp(Employee emp) throws EmployeeException {
		return eservice.insertEmployee(emp);
	}

	public int updateEmp(Employee emp) throws EmployeeException {
		return eservice.updateEmployee(emp);
	}

	public int deleteEmp(String empId) throws EmployeeException {
		return eservice.deleteEmployee(empId);
	}

	public ArrayList<Employee> selectDept(String deptId) throws EmployeeException {
		return eservice.selectDept(deptId);
	}

	public ArrayList<Employee> selectJob(String jobId) throws EmployeeException {
		return eservice.selectJob(jobId);
	}
}
