package com.gms.gmsdao.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "vehicle_service_tbl")
public class VehicleService implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "service_id")
	private Long id;
	
	@Column(name = "service_type")
	private String serviceType;
	
	@Column(name = "service_date")
	private String serviceDate;
	
	@Column(name = "mechanic_id")
	private int mechanicId;
	
	@Column(name = "cust_id")
	private Long customerId;
	
	@Column(name = "ser_work")
	private String work;
	
	@Column(name = "service_charge")
	private Double serviceCharge;
	
	@Column(name = "km_driven")
	private int kmDriven;
	
	@Transient
	private List<ProductCharge> listProductCharges = new ArrayList<ProductCharge>();
	
	@Transient
	private List<LabourCharge> listLabourCharges = new ArrayList<LabourCharge>();
	
	@Transient
	private Customer customer;
	
	@Transient
	private Insurance insurance;
	
	@Transient
	private Employee employee;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	
	public String getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public Double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(Double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}
	
	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public List<ProductCharge> getListProductCharges() {
		return listProductCharges;
	}

	public void setListProductCharges(List<ProductCharge> listProductCharges) {
		this.listProductCharges = listProductCharges;
	}

	public List<LabourCharge> getListLabourCharges() {
		return listLabourCharges;
	}

	public void setListLabourCharges(List<LabourCharge> listLabourCharges) {
		this.listLabourCharges = listLabourCharges;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getKmDriven() {
		return kmDriven;
	}

	public void setKmDriven(int kmDriven) {
		this.kmDriven = kmDriven;
	}

	public int getMechanicId() {
		return mechanicId;
	}

	public void setMechanicId(int mechanicId) {
		this.mechanicId = mechanicId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Insurance getInsurance() {
		return insurance;
	}

	public void setInsurance(Insurance insurance) {
		this.insurance = insurance;
	}
	
	
	

	
	

	
	
}
