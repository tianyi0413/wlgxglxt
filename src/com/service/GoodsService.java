package com.service;
import java.util.List;

import com.model.Goods;
import com.util.PageBean;

public interface GoodsService
{
    public List<Goods> queryGoodsList(Goods goods,PageBean page) throws Exception;
    
    public List<Goods> reportSales(Goods goods,PageBean page) throws Exception;
    
	public int insertGoods(Goods goods) throws Exception ;
	
	public int deleteGoods(int id) throws Exception ;
	
	public int updateGoods(Goods goods) throws Exception ;
	
	public Goods queryGoodsById(int id) throws Exception ;
	
	int getCount(Goods goods);
	

}
