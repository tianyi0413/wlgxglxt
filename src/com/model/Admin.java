package com.model;
/**
 * 员工管理员数据库实体类
 * @author Administrator
 *
 */
public class Admin implements java.io.Serializable {
 
	private static final long serialVersionUID = 705217449408883525L;

	private Integer id;

	private String uname;

	private String upwd;
	
	private String name;
	private String tel;
	private String utype;

	 
	// Constructors

	/** default constructor */
	public Admin() {
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
 

}