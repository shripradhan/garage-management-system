package com.gms.gmsdao.util;

import java.io.Serializable;
import java.util.List;

public interface GmsGenericDAO<T, ID extends Serializable> {
	
	T save (T entity);
	
	T update(T entity);
	
	void delete(ID id);
	
	T findById(ID id);
	
	List<T> findAll();
	
	/**
	 * @param id
	 * @return
	 *//*
	public E findOne(final long id);

	*//**
	 * @return
	 *//*
	public List<E> findAll();

	public void create(final E entity);

	*//**
	 * @param entity
	 * @return
	 *//*
	public void update(final E entity);

	*//**
	 * @param entity
	 *//*
	public void delete(final E entity);

	*//**
	 * @param entityId
	 *//*
	public void deleteById(final long entityId);*/

}
