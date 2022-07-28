package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.CatelogMapper;
import com.model.Catelog;
import com.util.PageBean;
@Service
public class CatelogServiceImpl implements CatelogService
{
        
    @Autowired
	private CatelogMapper catelogMapper;


	public List<Catelog> queryCatelogList(Catelog catelog,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(catelog, page);
		
		List<Catelog> getCatelog = catelogMapper.query(map);
		return getCatelog;
	}
	
	@Override
	public int getCount(Catelog catelog) {
		Map<String, Object> map = getQueryMap(catelog, null);
		int count = catelogMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Catelog catelog,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(catelog!=null){
			map.put("id", catelog.getId());
			
		}
		PageBean.setPageMap(map, page);
		return map;
	}

	public int insertCatelog(Catelog catelog) throws Exception {
		
		return catelogMapper.insertCatelog(catelog);
	}

	public int deleteCatelog(int id) throws Exception {
		return catelogMapper.deleteCatelog(id);
	}

	public int updateCatelog(Catelog catelog) throws Exception {
		return catelogMapper.updateCatelog(catelog);
	}
	
	public Catelog queryCatelogById(int id) throws Exception {
		return catelogMapper.queryCatelogById(id);
	}
	

	
	
	
	
 
}
