package com.gms.gsmweb.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gms.gmsdao.entities.Customer;
import com.gms.gmsdao.entities.Employee;
import com.gms.gmsdao.entities.VehicleService;
import com.gsm.gsmservice.service.abs.CustomerService;
import com.gsm.gsmservice.service.abs.EmployeeService;
import com.gsm.gsmservice.service.abs.VehicleServicingService;
import com.gsm.gsmweb.utility.GsmResponse;

@Controller
@RequestMapping(value = "/servicing")
public class VehicleServicingController {
	
	@Autowired
	private VehicleServicingService vehicleServicingService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private EmployeeService employeeService;
	
	
	
	@RequestMapping(value = "/new")
	public String newVehicleServicing(@RequestParam(required = false) Long id,Model  model) {
	//	if(id != null)
			model.addAttribute("vehicleServiceModel", new VehicleService());
			model.addAttribute("employeesList", employeeService.getEmployees());
		
		return "newServicing";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST,consumes="application/json")
	public @ResponseBody ResponseEntity<GsmResponse<VehicleService>> saveOrUpdateVehicleServicing(@Valid @RequestBody VehicleService vehicleService) {
		GsmResponse<VehicleService> response = null;
		try {
			if(vehicleService.getId() != null) {
				vehicleServicingService.updateVehicleService(vehicleService);
				response = new GsmResponse<VehicleService>("UPDATE","Servicing modified successfully", vehicleService);
			}else {
				vehicleServicingService.addVehicleService(vehicleService);
				response = new GsmResponse<VehicleService>("SAVE","Servicing save successfully", vehicleService);
			}
			
			return new ResponseEntity<GsmResponse<VehicleService>>(response,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			response = new GsmResponse<VehicleService>("ERROR","Something wrong please try again..!", vehicleService);
			return new ResponseEntity<GsmResponse<VehicleService>>(response,HttpStatus.EXPECTATION_FAILED);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/vehicles")
	public List<String> getCustsByVehicleNo(@RequestParam("term") String vehicleNo){
		return customerService.getAllVehicleNo(vehicleNo);
	}

	@ResponseBody
	@RequestMapping(value="/labours")
	public List<Employee> getLabourByName(@RequestParam("employeeName") String employeeName){
		return employeeService.getEmployeesByName(employeeName);
	}
	
	@ResponseBody
	@RequestMapping(value="/vehicle")
	public Customer getCustomerByVehicleNo(@RequestParam("vehicleNo") String vehicleNo){
		return customerService.getCustomerByVehicle(vehicleNo);
	}
	
	@ResponseBody
	@RequestMapping(value="/vehicle/list")
	public List<Customer> getCustomersByVehicleNo(@RequestParam("vehicleNo") String vehicleNo){
		return customerService.getCustomersByVehicleNo(vehicleNo);
	}

}
