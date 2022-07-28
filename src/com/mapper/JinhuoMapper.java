package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Jinhuo;

public interface JinhuoMapper {
	public List<Jinhuo> findJinhuoList();
	
	public List<Jinhuo> query(Map<String,Object> inputParam);
	
	int getCount(Map<String,Object> inputParam);
	
	public int insertJinhuo(Jinhuo jinhuo);
	
	public int deleteJinhuo(int id);
	
	public int updateJinhuo(Jinhuo jinhuo);
	
	public Jinhuo queryJinhuoById(int id);
	
 
	int jinhuoJS(int type);
	
}
