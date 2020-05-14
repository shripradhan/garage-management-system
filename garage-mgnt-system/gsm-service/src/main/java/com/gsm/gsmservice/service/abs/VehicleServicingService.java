package com.gsm.gsmservice.service.abs;

import com.gms.gmsdao.entities.VehicleService;

public interface VehicleServicingService {

	
	public String addVehicleService(VehicleService customer);
	
	public String updateVehicleService(VehicleService customer);
	
	public String deleteVehicleService(Long id);
	
	/*public Customer getOneCustomer(Long id);
	
	public List<Customer> getCustomers();
	
	public List<Customer> getCustomersByVehicleNo(String vehicleNo);
	
	public List<String> getAllVehicleNo(String vehicleNo);
	
	public Customer getCustomerByVehicle(String vehicleNo);*/
	
}
