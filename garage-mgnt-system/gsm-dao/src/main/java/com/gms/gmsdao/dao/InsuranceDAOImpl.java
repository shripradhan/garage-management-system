package com.gms.gmsdao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gms.gmsdao.entities.Insurance;
import com.gms.gmsdao.util.GmsGenericJpaDao;

@Repository
public class InsuranceDAOImpl extends GmsGenericJpaDao<Insurance, Long> implements InsuranceDAO {

	public InsuranceDAOImpl() {
		super(Insurance.class);
	}

	@Override
	public boolean checkAvailableInsCompany(String companyName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<String> findInsCompanyByName(String companyName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Insurance> findInsCompanysByName(String employeeName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Insurance> findAllInsCompany() {
		return entityManager.createQuery("FROM Insurance",Insurance.class).getResultList();
	}

}
