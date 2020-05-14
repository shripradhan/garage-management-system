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
@Table(name = "insurance_tbl")
public class Insurance implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "inc_id")
	private Long id;
	
	@Column(name = "ins_com_name")
	private String insCompanyName;
	
	@Column(name = "mno")
	private Long mno;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "gst_in")
	private String gstin;
	
	@Column(name = "pan_no")
	private String panNo;
	
	//transient property for datatable serial number
	@Transient
	private int serialNo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getInsCompanyName() {
		return insCompanyName;
	}

	public void setInsCompanyName(String insCompanyName) {
		this.insCompanyName = insCompanyName;
	}

	public Long getMno() {
		return mno;
	}

	public void setMno(Long mno) {
		this.mno = mno;
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

	public String getGstin() {
		return gstin;
	}

	public void setGstin(String gstin) {
		this.gstin = gstin;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	@Override
	public String toString() {
		return "Insurance [id=" + id + ", insCompanyName=" + insCompanyName + ", mno=" + mno + ", address=" + address
				+ ", email=" + email + ", gstin=" + gstin + ", panNo=" + panNo + ", serialNo=" + serialNo + "]";
	}
	
	

}
