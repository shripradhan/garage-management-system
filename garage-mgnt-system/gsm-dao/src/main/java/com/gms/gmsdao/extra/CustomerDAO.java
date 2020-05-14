package com.gms.gmsdao.extra;

import java.io.Serializable;
import java.util.List;

public class CustomerDAO<Customer> extends GmsGenericDAO<Serializable> {
	
	@SuppressWarnings("unchecked")
	public List<Customer> findAll() {
		return super.entityManager.createQuery("FROM Customer").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public Customer findOneEntity(long id) {
		return (Customer) entityManager.createQuery("FROM Customer c WHERE c.id = "+id).getSingleResult();
	}
	
	public void deleteCustomer(Long id) {
		@SuppressWarnings("unchecked")
		Customer customer  = (Customer) entityManager.createQuery("FROM Customer c WHERE c.id = "+id).getSingleResult();
		entityManager.remove(customer);
	}
	

}
