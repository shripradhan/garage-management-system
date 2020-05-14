package com.gms.gmsdao.extra;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


public class GsmGenericDAO<T extends Serializable> {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	
	
	public void showEntityManager() {
		System.out.println("Entity Manager : "+entityManager.getClass());
	}
	
	
	public void saveEntity(T entity) {
		 entityManager.persist(entity);
	}

	public void updateEntity(T entity) {
		entityManager.merge(entity);
	}

/*	public void deleteEntity(Long id) {
		T entity  =  (T) entityManager.find(Customer.class, id);
		entityManager.remove(entity);;
	}*/
/*
	public T getOneEntity(Long id) {
		return (T) entityManager.find(Customer.class, id);
	}*/

	@SuppressWarnings("unchecked")
	public List<T> getEntities() {
		return entityManager.createQuery("FROM Customer").getResultList();
	}

}
