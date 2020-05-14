package com.gms.gmsdao.dao;

import java.util.List;

import com.gms.gmsdao.entities.Employee;
import com.gms.gmsdao.util.GmsGenericDAO;

public interface EmployeeDAO extends GmsGenericDAO<Employee, Long> {

	public boolean checkAvailableEmployee(String employeeName);

	public List<String> findEmployeeByName(String employeeName);

	public List<Employee> findEmployeesByName(String employeeName);
	
	public List<Employee> findAllEmployees();
}
