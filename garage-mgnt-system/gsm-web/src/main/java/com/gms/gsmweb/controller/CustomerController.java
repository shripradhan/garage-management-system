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
import com.gsm.gsmservice.service.abs.CustomerService;
import com.gsm.gsmweb.utility.GsmResponse;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	@Autowired
	private CustomerService service;
	
	@RequestMapping(value = "/new")
	public String newCustomer(@RequestParam(required = false) Long id,Map<String,Object>  map) {
		if (id != null) {
			map.put("customerModel", service.getOneCustomer(id));
			map.put("oprText", "Update");
		} else {
			map.put("customerModel", new Customer());
			map.put("oprText", "Save");
		}
		return "newCustomer";
	}
	
	@ResponseBody
	@RequestMapping(value = "/list")
	public List<Customer> listCustomers() {
		return service.getCustomers();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/{id}")
	public Customer getCustomer(@PathVariable(value = "id") Long id) {
		try {
			return service.getOneCustomer(id);
		}catch(Exception e) {
			e.printStackTrace();
			//GsmResponse<Customer>response = new GsmResponse<Customer>("ERROR","Something wrong please try again..!");
			return null;
		}
		
		
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST,consumes="application/json")
	public @ResponseBody ResponseEntity<GsmResponse<Customer>> saveOrUpdateCustomer(@Valid @RequestBody Customer customer) {
		GsmResponse<Customer> response = null;
		try {
			if(customer.getId() != null) {
				service.updateCustomer(customer);
				response = new GsmResponse<Customer>("UPDATE","Customer modified successfully", customer);
			}else {
				String msg = service.addCustomer(customer);
				if(msg.equalsIgnoreCase("NOT EXIST"))
					response = new GsmResponse<Customer>("SAVE","Customer save successfully", customer);
				else if(msg.equalsIgnoreCase("EXIST"))
					response = new GsmResponse<Customer>("EXIST","Customer already registered with "+customer.getVehicleNo()+" Vehicle No.", customer);
			}
			
			return new ResponseEntity<GsmResponse<Customer>>(response,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			response = new GsmResponse<Customer>("ERROR","Something wrong please try again..!", customer);
			return new ResponseEntity<GsmResponse<Customer>>(response,HttpStatus.EXPECTATION_FAILED);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/delete")
	public GsmResponse<Customer> deleteCustomer(@PathVariable(value = "id") Long id) {
		try {
			service.deleteCustomer(id);
			return new GsmResponse<Customer>("OK","Deleted Successfully");
		}catch(Exception e) {
			e.printStackTrace();
			GsmResponse<Customer>response = new GsmResponse<Customer>("ERROR","Something wrong please try again..!");
			return response;
		}
		
		
	}

}
