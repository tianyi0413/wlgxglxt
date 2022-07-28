package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Order;

public interface OrderMapper {
	public List<Order> findOrderList();
	
	public List<Order> query(Map<String,Object> inputParam);
	
	int getCount(Map<String,Object> inputParam);
	
	public int insertOrder(Order order);
	
	public int deleteOrder(int id);
	
	public int updateOrder(Order order);
	
	public Order queryOrderById(int id);
 
	public List<Order> report1(Map<String,Object> inputParam);
	public List<Order> report2(Map<String,Object> inputParam);
	
}
