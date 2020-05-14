package com.gsm.gsmweb.utility;

public class GsmResponse<T> {
	
	private String code;
	
	private String message;
	
	private T entity;
	
	public GsmResponse() {
	}

	public GsmResponse(String code, String message) {
		this.code = code;
		this.message = message;
	}
	
	public GsmResponse(String code, String message, T entity) {
		super();
		this.code = code;
		this.message = message;
		this.entity = entity;
	}
	

	public GsmResponse(String message, T entity) {
		super();
		this.message = message;
		this.entity = entity;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getEntity() {
		return entity;
	}

	public void setEntity(T entity) {
		this.entity = entity;
	}
	
	

}
