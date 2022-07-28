package com.service;
import java.util.List;

import com.model.Jinhuo;
import com.util.PageBean;

public interface JinhuoService
{
    public List<Jinhuo> queryJinhuoList(Jinhuo jinhuo,PageBean page) throws Exception;
 
	public int insertJinhuo(Jinhuo jinhuo) throws Exception ;
	
	public int deleteJinhuo(int id) throws Exception ;
	
	public int updateJinhuo(Jinhuo jinhuo) throws Exception ;
	
	public Jinhuo queryJinhuoById(int id) throws Exception ;
	
	int getCount(Jinhuo jinhuo);
	
	int jinhuoJS(int type);
}
