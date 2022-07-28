package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.JinhuoMapper;
import com.model.Jinhuo;
import com.util.PageBean;
@Service
public class JinhuoServiceImpl implements JinhuoService
{
        
    @Autowired
	private JinhuoMapper jinhuoMapper;


	public List<Jinhuo> queryJinhuoList(Jinhuo jinhuo,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(jinhuo, page);
		
		List<Jinhuo> getJinhuo = jinhuoMapper.query(map);
		return getJinhuo;
	}
	
	@Override
	public int getCount(Jinhuo jinhuo) {
		Map<String, Object> map = getQueryMap(jinhuo, null);
		int count = jinhuoMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Jinhuo jinhuo,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(jinhuo!=null){
			map.put("id", jinhuo.getId());
			map.put("type", jinhuo.getType());
			map.put("startDate", jinhuo.getStartdate());
			map.put("endDate", jinhuo.getEnddate());
		}
		PageBean.setPageMap(map, page);
		return map;
	}

	public int insertJinhuo(Jinhuo jinhuo) throws Exception {
		
		return jinhuoMapper.insertJinhuo(jinhuo);
	}

	public int deleteJinhuo(int id) throws Exception {
		return jinhuoMapper.deleteJinhuo(id);
	}

	public int updateJinhuo(Jinhuo jinhuo) throws Exception {
		return jinhuoMapper.updateJinhuo(jinhuo);
	}
	
	public Jinhuo queryJinhuoById(int id) throws Exception {
		return jinhuoMapper.queryJinhuoById(id);
	}

	@Override
	public int jinhuoJS(int type) {
		return jinhuoMapper.jinhuoJS(type);
	}
	

	
	
	
	
 
}
