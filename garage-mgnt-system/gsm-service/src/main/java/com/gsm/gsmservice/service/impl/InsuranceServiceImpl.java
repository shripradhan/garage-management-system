package com.gsm.gsmservice.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gms.gmsdao.dao.InsuranceDAO;
import com.gms.gmsdao.entities.Insurance;
import com.gsm.gsmservice.service.abs.InsuranceService;

@Service
@Transactional
public class InsuranceServiceImpl implements InsuranceService{
	
	@Autowired
	private InsuranceDAO insuranceDAO;

	@Override
	public String addInsCompnay(Insurance insurance) {
		insuranceDAO.save(insurance);
		return null;
	}

	@Override
	public String updateInsCompnay(Insurance insurance) {
		insuranceDAO.update(insurance);
		return null;
	}

	@Override
	public String deleteInsCompnay(Long id) {
		insuranceDAO.delete(id);
		return null;
	}

	@Override
	public Insurance getOneInsCompnay(Long id) {
		return insuranceDAO.findById(id);
	}

	@Override
	public List<Insurance> getInsCompnays() {
		List<Insurance> insuranceList = insuranceDAO.findAllInsCompany();
		for(int i = 0 ; i < insuranceList.size() ; i++) {
			insuranceList.get(i).setSerialNo(i+1);
		}
		return insuranceList;
	}

	@Override
	public List<String> getInsCompnayByName(String insCompanyName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Insurance> getInsCompnaysByName(String insCompanyName) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
