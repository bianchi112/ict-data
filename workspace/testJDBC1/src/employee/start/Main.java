package employee.start;

import employee.view.EmployeeMenu;

public class Main {

	public static void main(String[] args) {
		// jdbc 사용 테스트 : Employee 테이블 사용하는 직원 관리 프로그램 구동 테스트
		new EmployeeMenu().display();
	}

}
