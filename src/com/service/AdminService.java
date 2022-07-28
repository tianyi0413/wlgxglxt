package com.service;

import java.util.List;

import com.model.Admin;
import com.util.PageBean;

 
public interface AdminService{
	public List<Admin> queryAdminList(Admin admin,PageBean page) throws Exception;
 
	public int insertAdmin(Admin admin) throws Exception ;
	
	public int deleteAdmin(int id) throws Exception ;
	
	public int updateAdmin(Admin admin) throws Exception ;
	
	public Admin queryAdminById(int id) throws Exception ;
	
	int getCount(Admin admin);
 
}
