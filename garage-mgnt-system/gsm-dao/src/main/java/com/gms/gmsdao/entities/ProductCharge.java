package com.gms.gmsdao.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product_charge_tbl")
public class ProductCharge implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "product_charge_id")
	private Long id;
	
	@Column(name = "product_id")
	private Long productId;
	
	@Column(name = "product_qty")
	private Integer productQty;
	
	@Column(name = "product_price")
	private Double productPrice;
	
	@Column(name = "service_id")
	private Long serviceId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getProductQty() {
		return productQty;
	}

	public void setProductQty(Integer productQty) {
		this.productQty = productQty;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	@Override
	public String toString() {
		return "ProductCharge [id=" + id + ", productId=" + productId + ", productQty=" + productQty + ", productPrice="
				+ productPrice + ", serviceId=" + serviceId + "]";
	}

}
