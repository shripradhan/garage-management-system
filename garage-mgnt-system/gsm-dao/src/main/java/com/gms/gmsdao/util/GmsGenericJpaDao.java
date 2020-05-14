package com.gms.gmsdao.util;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public abstract class GmsGenericJpaDao<T, ID extends Serializable> implements GmsGenericDAO<T, ID> {

	private Class<T> persistenceClass;

	@PersistenceContext
	protected EntityManager entityManager;

	public GmsGenericJpaDao(Class<T> persistenceClass) {
		this.persistenceClass = persistenceClass;
	}

	public T save(T entity) {
		entityManager.persist(entity);
		return entity;
		
	}

	public T update(T entity) {
		entityManager.merge(entity);
		return entity;
	}

	public void delete(ID id) {
		T entity =  entityManager.find(persistenceClass, id);
		entityManager.remove(entity);
	}

	public T findById(ID id) {
		T entity =  entityManager.find(persistenceClass, id);
		return entity;
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return entityManager.createQuery("FROM Customer").getResultList();
	}
}
