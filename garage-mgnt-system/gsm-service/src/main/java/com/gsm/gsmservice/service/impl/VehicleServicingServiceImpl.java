package com.gsm.gsmservice.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.gmsdao.dao.VehicleServicingDAO;
import com.gms.gmsdao.entities.VehicleService;
import com.gsm.gsmservice.service.abs.CustomerService;
import com.gsm.gsmservice.service.abs.VehicleServicingService;

@Service
@Transactional
public class VehicleServicingServiceImpl implements VehicleServicingService {
	
	@Autowired
	private VehicleServicingDAO vehicleServicingDAO; 
	
	@Autowired
	private CustomerService customerService;

	@Override
	public String addVehicleService(VehicleService vehicleService) {
		if(vehicleService != null) {
			if(vehicleService.getCustomer() != null) {
				customerService.addCustomer(vehicleService.getCustomer());
			}
			vehicleService.setCustomerId(vehicleService.getCustomer().getId());
			vehicleServicingDAO.save(vehicleService);
		}
		return null;
	}

	@Override
	public String updateVehicleService(VehicleService customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String deleteVehicleService(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
