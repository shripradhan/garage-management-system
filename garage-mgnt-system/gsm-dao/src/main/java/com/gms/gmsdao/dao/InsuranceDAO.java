package com.gms.gmsdao.dao;

import java.util.List;

import com.gms.gmsdao.entities.Insurance;
import com.gms.gmsdao.util.GmsGenericDAO;

public interface InsuranceDAO extends GmsGenericDAO<Insurance, Long> {

	public boolean checkAvailableInsCompany(String companyName);

	public List<String> findInsCompanyByName(String companyName);

	public List<Insurance> findInsCompanysByName(String employeeName);
	
	public List<Insurance> findAllInsCompany();
	
}
