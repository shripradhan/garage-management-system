package com.gsm.gsmservice.service.abs;

import java.util.List;

import com.gms.gmsdao.entities.Insurance;

public interface InsuranceService {
	
	public String addInsCompnay(Insurance insurance);

	public String updateInsCompnay(Insurance  insurance);

	public String deleteInsCompnay(Long id);

	public Insurance getOneInsCompnay(Long id);

	public List<Insurance> getInsCompnays();

	public List<String> getInsCompnayByName(String insCompanyName);
	
	public List<Insurance> getInsCompnaysByName(String insCompanyName);

}
