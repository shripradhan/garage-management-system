package com.gsm.gsmservice.service.abs;

import java.util.List;

import com.gms.gmsdao.entities.Employee;

public interface EmployeeService {

	public String addEmployee(Employee employee);

	public String updateEmployee(Employee employee);

	public String deleteEmployee(Long id);

	public Employee getOneEmployee(Long id);

	public List<Employee> getEmployees();

	public List<String> getEmployeeByName(String employeeName);
	
	public List<Employee> getEmployeesByName(String employeeName);
}
