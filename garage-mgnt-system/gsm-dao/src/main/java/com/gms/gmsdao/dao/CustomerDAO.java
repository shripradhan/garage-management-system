package com.gms.gmsdao.dao;

import java.util.List;

import com.gms.gmsdao.entities.Customer;
import com.gms.gmsdao.util.GmsGenericDAO;

public interface CustomerDAO extends GmsGenericDAO<Customer, Long> {
	
	/**
	 * @param customerName
	 * @return boolean
	 */
	public boolean checkAvailableCustomer(String customerName);
	
	public List<Customer> findCustomersByVehicleNo(String vehicleNo);
	
	public List<String> findAllVehicleNo(String vehicleNo);
	
	public Customer findCustomerByVehicleNo(String vehicleNo);

}
