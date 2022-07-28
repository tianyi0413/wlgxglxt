package com.model;

/**
 * 客户信息数据库实体
 * @author Administrator
 *
 */
public class User implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;

	private Integer id;    

	private String huiyuanhao;
	

	private String name;
	
 
	private String tel;   
	
	private String address;
 
 
	public User() {
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

 
	public String getHuiyuanhao() {
		return huiyuanhao;
	}

	public void setHuiyuanhao(String huiyuanhao) {
		this.huiyuanhao = huiyuanhao;
	}

 
	
	
}
