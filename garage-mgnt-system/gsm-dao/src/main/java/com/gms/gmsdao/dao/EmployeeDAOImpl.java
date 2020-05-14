package com.gms.gmsdao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gms.gmsdao.entities.Employee;
import com.gms.gmsdao.util.GmsGenericJpaDao;

@Repository
public class EmployeeDAOImpl extends GmsGenericJpaDao<Employee, Long> implements EmployeeDAO{

	public EmployeeDAOImpl() {
		super(Employee.class);
	}

	@Override
	public boolean checkAvailableEmployee(String employeeName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> findEmployeeByName(String employeeName) {
		List<String> employeeNames = super.entityManager.createQuery("SELECT e.empName FROM Employee e WHERE e.empName LIKE '"+employeeName+"%'",String.class).getResultList();
		return employeeNames;
	}
	
	@Override
	public List<Employee> findEmployeesByName(String employeeName) {
		List<Employee> employeeNames = super.entityManager.createQuery("SELECT e FROM Employee e WHERE e.empName LIKE '"+employeeName+"%'",Employee.class).getResultList();
		return employeeNames;
	}

	@Override
	public List<Employee> findAllEmployees() {
		return entityManager.createQuery("FROM Employee",Employee.class).getResultList();
	}
	
	



}
