package com.gms.gsmweb.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gms.gmsdao.entities.Insurance;
import com.gsm.gsmservice.service.abs.InsuranceService;
import com.gsm.gsmweb.utility.GsmResponse;

@Controller
@RequestMapping(value = "/insurance")
public class InsuranceController {
	
	@Autowired
	private InsuranceService service;
	
	//new employee
	@RequestMapping(value = "/new")
	public String newInsCompany(Map<String,Object>  map) {
		map.put("insuranceModel", new Insurance());
		return "newInsCompany";
	}
	
	@ResponseBody
	@RequestMapping(value  = "/update")
	public Insurance updateLounch(@RequestParam(required = false) Long id) {
		return service.getOneInsCompnay(id);
	}
	
	
	@ResponseBody
	@RequestMapping(value  = "/list")
	public List<Insurance> listInsCompany() {
		return service.getInsCompnays();
	}
	
	//save employee
	@RequestMapping(value = "/save", method = RequestMethod.POST,consumes="application/json")
	public @ResponseBody ResponseEntity<GsmResponse<Insurance>> saveOrUpdateInsCompany(@Valid @RequestBody Insurance insurance) {
		GsmResponse<Insurance> response = null;
		try {
			if(insurance.getId() != null) {
				service.updateInsCompnay(insurance);
				response = new GsmResponse<Insurance>("UPDATE","Insurance Company modified successfully", insurance);
			}else {
				service.addInsCompnay(insurance);
				response = new GsmResponse<Insurance>("SAVE","Insurance Company save successfully", insurance);
			}
			
			return new ResponseEntity<GsmResponse<Insurance>>(response,HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			response = new GsmResponse<Insurance>("ERROR","Something wrong please try again..!", insurance);
			return new ResponseEntity<GsmResponse<Insurance>>(response,HttpStatus.EXPECTATION_FAILED);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/delete")
	public GsmResponse<Insurance> deleteInsCompany(@PathVariable(value = "id") Long id) {
		try {
			service.deleteInsCompnay(id);
			return new GsmResponse<Insurance>("OK","Deleted Successfully");
		}catch(Exception e) {
			e.printStackTrace();
			GsmResponse<Insurance>response = new GsmResponse<Insurance>("ERROR","Something wrong please try again..!");
			return response;
		}
		
		
	}
	

}
