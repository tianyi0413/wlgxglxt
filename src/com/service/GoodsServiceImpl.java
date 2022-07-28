package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.GoodsMapper;
import com.model.Goods;
import com.util.PageBean;
@Service
public class GoodsServiceImpl implements GoodsService
{
        
    @Autowired
	private GoodsMapper goodsMapper;


	public List<Goods> queryGoodsList(Goods goods,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(goods, page);
		
		List<Goods> getGoods = goodsMapper.query(map);
		return getGoods;
	}
	
	public List<Goods> reportSales(Goods goods,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(goods, page);
		
		List<Goods> getGoods = goodsMapper.reportSales(map);
		return getGoods;
	}
	
	@Override
	public int getCount(Goods goods) {
		Map<String, Object> map = getQueryMap(goods, null);
		int count = goodsMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Goods goods,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(goods!=null){
			map.put("id", goods.getId());
			map.put("temp", goods.getTemp());
			map.put("name", goods.getName());
			map.put("type", goods.getType());
			map.put("startdate", goods.getStartdate());
			map.put("enddate", goods.getEnddate());
			
		}
		PageBean.setPageMap(map, page);
		return map;
	}

	public int insertGoods(Goods goods) throws Exception {
		
		return goodsMapper.insertGoods(goods);
	}

	public int deleteGoods(int id) throws Exception {
		return goodsMapper.deleteGoods(id);
	}

	public int updateGoods(Goods goods) throws Exception {
		return goodsMapper.updateGoods(goods);
	}
	
	public Goods queryGoodsById(int id) throws Exception {
		return goodsMapper.queryGoodsById(id);
	}
	

	
	
	
	
 
}
