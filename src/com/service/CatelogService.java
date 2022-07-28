package com.service;
import java.util.List;

import com.model.Catelog;
import com.util.PageBean;

public interface CatelogService
{
    public List<Catelog> queryCatelogList(Catelog catelog,PageBean page) throws Exception;
 
	public int insertCatelog(Catelog catelog) throws Exception ;
	
	public int deleteCatelog(int id) throws Exception ;
	
	public int updateCatelog(Catelog catelog) throws Exception ;
	
	public Catelog queryCatelogById(int id) throws Exception ;
	
	int getCount(Catelog catelog);
	

}
