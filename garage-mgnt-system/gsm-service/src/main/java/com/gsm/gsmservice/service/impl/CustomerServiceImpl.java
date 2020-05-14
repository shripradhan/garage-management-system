package com.gsm.gsmservice.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.gmsdao.dao.CustomerDAO;
import com.gms.gmsdao.entities.Customer;
import com.gsm.gsmservice.service.abs.CustomerService;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO; 
	
	/*@Autowired
	private VehicleServicingDAO vehicleServicingDAO;*/

	@Override
	public String addCustomer(Customer customer) {
		String msg = "";
		Customer existCustomer = customerDAO.findCustomerByVehicleNo(customer.getVehicleNo());
		if(existCustomer == null) {
			customerDAO.save(customer);
			/*if(customer.getListVehicleService().size() != 0) {
				for(VehicleService objVehicleService : customer.getListVehicleService()) {
					objVehicleService.setCustomerId(customer.getId());
			 		vehicleServicingDAO.save(objVehicleService);
				}
			}*/
			msg = "NOT EXIST";
		}else {
			/*if(customer.getListVehicleService().size() != 0) {
				for(VehicleService objVehicleService : customer.getListVehicleService()) {
					objVehicleService.setCustomerId(existCustomer.getId());
			 		vehicleServicingDAO.save(objVehicleService);
				}
			}
			*/
			msg = "EXIST";
		}
			
		return msg;
	}

	@Override
	public String updateCustomer(Customer customer) {
		customerDAO.update(customer);
		 return "";
	}

	@Override
	public String deleteCustomer(Long id) {
		customerDAO.delete(id);
		 return "";
	}

	@Override
	public Customer getOneCustomer(Long id) {
		return (Customer) customerDAO.findById(id);
	}

	@Override
	public List<Customer> getCustomers() {
		List<Customer> customerList = customerDAO.findAll();
		for(int i = 0 ; i < customerList.size() ; i++) {
			customerList.get(i).setSerialNo(i+1);
		}
		return customerList;
	}

	@Override
	public List<Customer> getCustomersByVehicleNo(String vehicleNo) {
		return customerDAO.findCustomersByVehicleNo(vehicleNo);
	}

	@Override
	public List<String> getAllVehicleNo(String vehicleNo){
		return customerDAO.findAllVehicleNo(vehicleNo);
	}

	@Override
	public Customer getCustomerByVehicle(String vehicleNo) {
		return customerDAO.findCustomerByVehicleNo(vehicleNo);
	}

}
