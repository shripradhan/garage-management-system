package com.gms.gsmweb.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gms.gmsdao.entities.Customer;
import com.gms.gmsdao.entities.Employee;
import com.gsm.gsmservice.service.abs.EmployeeService;
import com.gsm.gsmweb.utility.GsmResponse;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	//new employee
	@RequestMapping(value = "/new")
	public String newCustomer(Map<String,Object>  map) {
		map.put("employeeModel", new Employee());
		return "newEmployee";
	}
	
	@ResponseBody
	@RequestMapping(value  = "/update")
	public Employee updateLounch(@RequestParam(required = false) Long id) {
		return service.getOneEmployee(id);
	}
	
	
	@ResponseBody
	@RequestMapping(value  = "/list")
	public List<Employee> listCustomers() {
		return service.getEmployees();
	}
	
	//save employee
	@RequestMapping(value = "/save", method = RequestMethod.POST,consumes="application/json")
	public @ResponseBody ResponseEntity<GsmResponse<Employee>> saveOrUpdateCustomer(@Valid @RequestBody Employee employee) {
		GsmResponse<Employee> response = null;
		try {
			if(employee.getId() != null) {
				service.updateEmployee(employee);
				response = new GsmResponse<Employee>("UPDATE","Employee modified successfully", employee);
			}else {
				service.addEmployee(employee);
				response = new GsmResponse<Employee>("SAVE","Employee save successfully", employee);
			}
			
			return new ResponseEntity<GsmResponse<Employee>>(response,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			response = new GsmResponse<Employee>("ERROR","Something wrong please try again..!", employee);
			return new ResponseEntity<GsmResponse<Employee>>(response,HttpStatus.EXPECTATION_FAILED);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/delete")
	public GsmResponse<Customer> deleteCustomer(@PathVariable(value = "id") Long id) {
		try {
			service.deleteEmployee(id);
			return new GsmResponse<Customer>("OK","Deleted Successfully");
		}catch(Exception e) {
			e.printStackTrace();
			GsmResponse<Customer>response = new GsmResponse<Customer>("ERROR","Something wrong please try again..!");
			return response;
		}
		
		
	}
	

}
