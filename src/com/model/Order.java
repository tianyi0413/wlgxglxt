package com.model;

/**
 * 出库订单数据库实体
 * @author Administrator
 *
 */
public class Order {
	
	private Integer id;
	
	private Integer uid;
	
	private String uname;
	
	private String bianhao;
	
	private Integer goodsid;
	private String goodsbianhao;
	private String goodsname;
	
	private int num;
	
	private int danjia;
	
	private String cdate;
	
	private String startdate;
	
	private String enddate;
	//0客户退货1销售 
	private Integer type;

	private String xiaoshoutype;
	
	private int zongjia;
	
	private String tuihuodan;
 
 

	 
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

	public String getXiaoshoutype() {
		return xiaoshoutype;
	}

	public void setXiaoshoutype(String xiaoshoutype) {
		this.xiaoshoutype = xiaoshoutype;
	}

	public int getZongjia() {
		zongjia = danjia*num;
		return zongjia;
	}

	public void setZongjia(int zongjia) {
		this.zongjia = zongjia;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getDanjia() {
		return danjia;
	}

	public void setDanjia(int danjia) {
		this.danjia = danjia;
	}

	public String getGoodsbianhao() {
		return goodsbianhao;
	}

	public void setGoodsbianhao(String goodsbianhao) {
		this.goodsbianhao = goodsbianhao;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getTuihuodan() {
		return tuihuodan;
	}

	public void setTuihuodan(String tuihuodan) {
		this.tuihuodan = tuihuodan;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
