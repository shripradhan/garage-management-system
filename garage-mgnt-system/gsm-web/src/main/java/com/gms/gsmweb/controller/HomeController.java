  package com.gms.gsmweb.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsm.gsmservice.service.abs.CustomerService;


@Controller
@RequestMapping(value = "/home")
public class HomeController {
	
	@SuppressWarnings("unused")
	@Autowired
	private CustomerService service;
	

	public HomeController() {
		System.out.println("HomeController.HomeController()");
	}

	@RequestMapping(value = "/")
	public String homeLaunch(Model model) {
		model.addAttribute("welcomeMsg", "Sainath Automobile Garage");
		
		return "home";
	}
	
	@RequestMapping(value = "/404")
	public String Lounch404(Model model) {
		model.addAttribute("welcomeMsg", "Sainath Automobile Garage");
		
		return "notFound";
	}
	
	@RequestMapping(value = "/demo")
	public String demoLaunch(Model model) {
		model.addAttribute("welcomeMsg", "Sainath Automobile Garage");
		
		return "editDemo";
	}

	
	
	@RequestMapping(value = "/new_servicing")
	public String newVehicleServicing(@RequestParam(required = false) Long id,Map<String,Object>  map) {
	//	if(id != null)
		//	map.put("customerModel", service.getOneCustomer(id));
		
		return "newServicing";
	}

	
}
