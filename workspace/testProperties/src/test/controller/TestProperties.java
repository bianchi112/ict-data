package test.controller;

import test.entity.Employee;

import java.io.*;
import java.util.Properties;

public class TestProperties {

	public static void main(String[] args) {
		TestProperties test = new TestProperties();
		Properties prop = new Properties();

		Employee[] employees = test.readFile(prop);
		test.printConsole(prop);
		test.addEmpData(prop);
		test.printConsole(prop);
		test.saveEmpXML(employees);
	}

	public void addEmpData(Properties p) {
		p.setProperty("20140501", "김철수, 인사부, 42000000, 0.1");
		p.setProperty("20150601", "박영희, 재무부, 51000000, 0.15");
	}

	public Employee[] readFile(Properties p) {
		Employee[] employees = new Employee[5];
		try (BufferedReader reader = new BufferedReader(new FileReader("empData.txt"))) {
			String line;
			int index = 0;
			while ((line = reader.readLine()) != null) {
				String[] empData = line.split("=");
				String[] empFields = empData[1].split(", ");

				Employee emp = new Employee(Integer.parseInt(empData[0]), empFields[0], empFields[1],
						Integer.parseInt(empFields[2]), Double.parseDouble(empFields[3]));
				employees[index++] = emp;
				p.setProperty(empData[0], emp.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return employees;
	}

	public void printConsole(Properties p) {
		for (String key : p.stringPropertyNames()) {
			System.out.println(key + "=" + p.getProperty(key));
		}
	}

	public void saveEmpXML(Employee[] er) {
		try (BufferedWriter writer = new BufferedWriter(new FileWriter("empResult.xml"))) {
			for (Employee emp : er) {
				if (emp != null) {
					int totalSalary = (int) (emp.getSalary() + (emp.getSalary() * emp.getBonusPoint()));
					writer.write(emp.geteId() + "=" + emp.geteName() + ", " + emp.getDept() + ", " + emp.getSalary()
							+ ", " + emp.getBonusPoint() + ", " + totalSalary);
					writer.newLine();
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
