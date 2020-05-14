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
@Table(name = "customer_tbl")
public class Customer implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cust_id")
	private Long id;
		
	@Column(name = "full_name")
	private String fullName;
	
	@Column(name = "mob_no")
	private Long mobNo;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "vehicle_no")
	private String vehicleNo;
	
	@Column(name = "vehicle_model")
	private String vehicleModel;
	
	@Column(name = "engine_no")
	private String engineNo;
	
	@Column(name = "chesis_no")
	private String chesisNo;
	
	@Column(name = "job_card_no")
	private String jobCardNo;
	
	//transient property for datatable serial number
	@Transient
	private int serialNo;
	
	@Transient
	List<VehicleService> listVehicleService = new ArrayList<VehicleService>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getMobNo() {
		return mobNo;
	}

	public void setMobNo(Long mobNo) {
		this.mobNo = mobNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getVehicleModel() {
		return vehicleModel;
	}

	public void setVehicleModel(String vehicleModel) {
		this.vehicleModel = vehicleModel;
	}

	public String getEngineNo() {
		return engineNo;
	}

	public void setEngineNo(String engineNo) {
		this.engineNo = engineNo;
	}

	public String getChesisNo() {
		return chesisNo;
	}

	public void setChesisNo(String chesisNo) {
		this.chesisNo = chesisNo;
	}

	public String getJobCardNo() {
		return jobCardNo;
	}

	public void setJobCardNo(String jobCardNo) {
		this.jobCardNo = jobCardNo;
	}
	
	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	
	public List<VehicleService> getListVehicleService() {
		return listVehicleService;
	}

	public void setListVehicleService(List<VehicleService> listVehicleService) {
		this.listVehicleService = listVehicleService;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", fullName=" + fullName + ", mobNo=" + mobNo + ", address=" + address
				+ ", email=" + email + ", vehicleNo=" + vehicleNo + ", vehicleModel=" + vehicleModel + ", engineNo="
				+ engineNo + ", chesisNo=" + chesisNo + ", jobCardNo=" + jobCardNo + "]";
	}

		
}
