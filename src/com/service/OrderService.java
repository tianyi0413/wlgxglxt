package com.service;
import java.util.List;

import com.model.Order;
import com.util.PageBean;

public interface OrderService
{
    public List<Order> queryOrderList(Order order,PageBean page) throws Exception;
 
	public int insertOrder(Order order) throws Exception ;
	
	public int deleteOrder(int id) throws Exception ;
	
	public int updateOrder(Order order) throws Exception ;
	
	public Order queryOrderById(int id) throws Exception ;
	
	int getCount(Order order);
	
	  public List<Order> report1() throws Exception;
	  public List<Order> report2() throws Exception;
}
