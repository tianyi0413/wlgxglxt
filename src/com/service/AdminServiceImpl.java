package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.AdminMapper;
import com.model.Admin;
import com.util.PageBean;
 
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public List<Admin> queryAdminList(Admin admin,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(admin, page);
		List<Admin> getAdmin = adminMapper.query(map);
		return getAdmin;
	}
	
	@Override
	public int getCount(Admin admin) {
		Map<String, Object> map = getQueryMap(admin, null);
		int count = adminMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(Admin admin,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(admin!=null){
			map.put("uname", admin.getUname());
			map.put("upwd", admin.getUpwd());	
		}
		PageBean.setPageMap(map, page);
		return map;
	}
	
	
	
	
	
	
	public int insertAdmin(Admin admin) throws Exception {
		return adminMapper.insertAdmin(admin);
	}

	public int deleteAdmin(int id) throws Exception {
		return adminMapper.deleteAdmin(id);
	}

	public int updateAdmin(Admin admin) throws Exception {
		return adminMapper.updateAdmin(admin);
	}
	
	public Admin queryAdminById(int id) throws Exception {
		return adminMapper.queryAdminById(id);
	}

	

	

 

 
}
