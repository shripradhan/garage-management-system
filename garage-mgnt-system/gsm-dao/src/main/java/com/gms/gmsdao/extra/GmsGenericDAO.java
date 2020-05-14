package com.gms.gmsdao.extra;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public class GmsGenericDAO<E extends Serializable>{ 
	
	//private final Class<E> persistentClass;
	
	@PersistenceContext
	protected EntityManager entityManager;

	public GmsGenericDAO() {
		//this.persistentClass = (Class<E>) ((ParameterizedType) 
		//	getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
/*	public E findOne(long id) {
		return entityManager.find(persistentClass, id);
	}
	*/

	public void create(E entity) {
		entityManager.persist(entity);
	}


	public void update(E entity) {
		entityManager.merge(entity);
	}


	/*public void delete(Long id) {
		E entity  = entityManager.find(persistentClass, id);
		entityManager.remove(entity);
	}*/


	public void deleteById(long entityId) {
		// TODO Auto-generated method stub

	}

}
