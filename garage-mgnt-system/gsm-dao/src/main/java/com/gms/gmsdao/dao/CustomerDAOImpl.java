package com.gms.gmsdao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gms.gmsdao.entities.Customer;
import com.gms.gmsdao.util.GmsGenericJpaDao;

@Repository	
public class CustomerDAOImpl extends GmsGenericJpaDao<Customer, Long> implements CustomerDAO{

	public CustomerDAOImpl() {
		super(Customer.class);
	}

	@Override
	public boolean checkAvailableCustomer(String customerName) {
		List<Customer> customers =   super.entityManager.createQuery("FROM Customer c WHERE c.fullName = " + customerName,Customer.class).getResultList();
		if(customers.size() == 0)
			return false;
		else
			return true;
	}

	@Override
	public List<Customer> findCustomersByVehicleNo(String vehicleNo) {
		List<Customer> customers = super.entityManager.createQuery("SELECT c FROM Customer c WHERE c.vehicleNo LIKE '"+vehicleNo+"%'",Customer.class).getResultList();
		return customers;
	}

	@Override
	public List<String> findAllVehicleNo(String vehicleNo) {
		List<String> vehicleNos = super.entityManager.createQuery("SELECT c.vehicleNo FROM Customer c WHERE c.vehicleNo LIKE '"+vehicleNo+"%'",String.class).getResultList();
		return vehicleNos;
	}

	@Override
	public Customer findCustomerByVehicleNo(String vehicleNo) {
		Customer customer = super.entityManager.createQuery("SELECT c FROM Customer c WHERE c.vehicleNo ='"+vehicleNo+"'",Customer.class).getResultList().stream().findFirst().orElse(null);
		return customer;
	}

	
}
