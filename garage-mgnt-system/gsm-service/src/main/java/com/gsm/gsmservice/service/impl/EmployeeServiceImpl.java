package com.gsm.gsmservice.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.gmsdao.dao.EmployeeDAO;
import com.gms.gmsdao.entities.Employee;
import com.gsm.gsmservice.service.abs.EmployeeService;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	public String addEmployee(Employee employee) {
		employeeDAO.save(employee);
		return null;
	}

	@Override
	public String updateEmployee(Employee employee) {
		employeeDAO.update(employee);
		return null;
	}

	@Override
	public String deleteEmployee(Long id) {
		employeeDAO.delete(id);
		return null;
	}

	@Override
	public Employee getOneEmployee(Long id) {
		return employeeDAO.findById(id);
	}

	@Override
	public List<Employee> getEmployees() {
		List<Employee> employeeList = employeeDAO.findAllEmployees();
		for(int i = 0 ; i < employeeList.size() ; i++) {
			employeeList.get(i).setSerialNo(i+1);
		}
		return employeeList;
	}

	@Override
	public List<String> getEmployeeByName(String employeeName) {
		return employeeDAO.findEmployeeByName(employeeName);
	}
	
	@Override
	public List<Employee> getEmployeesByName(String employeeName) {
		return employeeDAO.findEmployeesByName(employeeName);
	}

}
