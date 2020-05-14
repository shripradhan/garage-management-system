package com.gms.gmsdao.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "labour_charge_tbl")
public class LabourCharge implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "labour_charge_id")
	private Long id;
	
	@Column(name = "labour_id")
	private Long LabourId;
	
	@Column(name = "labour_charge_desc")
	private String LabourChargeDesc;
	
	@Column(name = "labour_charge")
	private Double labourCharge;
	
	@Column(name = "service_id")
	private Long serviceId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getLabourId() {
		return LabourId;
	}

	public void setLabourId(Long labourId) {
		LabourId = labourId;
	}

	public String getLabourChargeDesc() {
		return LabourChargeDesc;
	}

	public void setLabourChargeDesc(String labourChargeDesc) {
		LabourChargeDesc = labourChargeDesc;
	}

	public Double getLabourCharge() {
		return labourCharge;
	}

	public void setLabourCharge(Double labourCharge) {
		this.labourCharge = labourCharge;
	}
	

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	@Override
	public String toString() {
		return "LabourCharge [id=" + id + ", LabourId=" + LabourId + ", LabourChargeDesc=" + LabourChargeDesc
				+ ", labourCharge=" + labourCharge + ", serviceId=" + serviceId + "]";
	}

}
