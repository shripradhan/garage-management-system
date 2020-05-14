package com.gms.gmsdao.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "employee_tbl")
public class Employee implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "emp_id")
	private Long id;
	
	@Column(name = "emp_name")
	private String empName;
	
	@Column(name = "emp_email")
	private String empEmail;
	
	@Column(name = "emp_address")
	private String empAddress;
	
	@Column(name = "emp_mob_no")
	private Long empMobNo;
	
	@Column(name = "emp_designation")
	private String empDesignation;
	
	@Transient
	private Integer serialNo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpAddress() {
		return empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	public Long getEmpMobNo() {
		return empMobNo;
	}

	public void setEmpMobNo(Long empMobNo) {
		this.empMobNo = empMobNo;
	}
	
	public String getEmpDesignation() {
		return empDesignation;
	}

	public void setEmpDesignation(String empDesignation) {
		this.empDesignation = empDesignation;
	}
	
	public Integer getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", empName=" + empName + ", empEmail=" + empEmail + ", empAddress=" + empAddress
				+ ", empMobNo=" + empMobNo + "]";
	}
	
	

}
