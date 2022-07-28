package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Goods;

public interface GoodsMapper {
	public List<Goods> findGoodsList();
	
	public List<Goods> query(Map<String,Object> inputParam);
	public List<Goods> reportSales(Map<String,Object> inputParam);
	int getCount(Map<String,Object> inputParam);
	
	public int insertGoods(Goods goods);
	
	public int deleteGoods(int id);
	
	public int updateGoods(Goods goods);
	
	public Goods queryGoodsById(int id);
	
 
	
	
}
