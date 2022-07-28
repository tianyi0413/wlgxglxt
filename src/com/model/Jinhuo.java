package com.model;

/**
 * 进货入库数据库实体
 * @author Administrator
 *
 */
public class Jinhuo {
	
	private Integer id;
	
	private Integer goodsid;
	private String bianhao;
	private String goodsname;
	
	private Integer companyid;
	
	private String companyname;
	
	private int num;
	
	private String cdate;
	//0物料退货1进货 
	private Integer type;
	
	private int danjia;

	private int zongjia;
	
	private String startdate;
	
	private String enddate;

	
	

	public Integer getId() {
		return id;
	}

	public Integer getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public Integer getCompanyid() {
		return companyid;
	}

	public void setCompanyid(Integer companyid) {
		this.companyid = companyid;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public int getDanjia() {
		return danjia;
	}

	public void setDanjia(int danjia) {
		this.danjia = danjia;
	}

	public int getZongjia() {
		zongjia = danjia*num;
		return zongjia;
	}

	public void setZongjia(int zongjia) {
		this.zongjia = zongjia;
	}

	

	
	
	
	
	
	
	
	
	
	
	
	
}
