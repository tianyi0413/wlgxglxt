package com.model;

/**
 * 供应商数据库实体
 * @author Administrator
 *
 */
public class Company implements java.io.Serializable{
	
 
	private Integer id;
	
	private String name;
	
	private String lianxiren;  

	private String tel;      
	
	private String address;
	
	
	public Company() {
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getLianxiren() {
		return lianxiren;
	}


	public void setLianxiren(String lianxiren) {
		this.lianxiren = lianxiren;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	
	
	
}
