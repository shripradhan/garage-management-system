package com.gsm.gsmservice.service.abs;

import java.util.List;

import com.gms.gmsdao.entities.Customer;


public interface CustomerService {
	
	public String addCustomer(Customer customer);
	
	public String updateCustomer(Customer customer);
	
	public String deleteCustomer(Long id);
	
	public Customer getOneCustomer(Long id);
	
	public List<Customer> getCustomers();
	
	public List<Customer> getCustomersByVehicleNo(String vehicleNo);
	
	public List<String> getAllVehicleNo(String vehicleNo);
	
	public Customer getCustomerByVehicle(String vehicleNo);
	 

}
