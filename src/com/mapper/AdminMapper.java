package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Admin;

public interface AdminMapper {
	public List<Admin> findAdminList();
	
	public List<Admin> query(Map<String,Object> inputParam);
	
	int getCount(Map<String,Object> inputParam);
	
	public int insertAdmin(Admin admin);
	
	public int deleteAdmin(int id);
	
	public int updateAdmin(Admin admin);
	
	public Admin queryAdminById(int id);
	
 
	
	
}
