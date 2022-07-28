package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Catelog;

public interface CatelogMapper {
	public List<Catelog> findCatelogList();
	
	public List<Catelog> query(Map<String,Object> inputParam);
	
	int getCount(Map<String,Object> inputParam);
	
	public int insertCatelog(Catelog catelog);
	
	public int deleteCatelog(int id);
	
	public int updateCatelog(Catelog catelog);
	
	public Catelog queryCatelogById(int id);
	
 
	
	
}
