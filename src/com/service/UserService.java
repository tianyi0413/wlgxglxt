package com.service;
import java.util.List;

import com.model.User;
import com.util.PageBean;

public interface UserService
{
    public List<User> queryUserList(User user,PageBean page) throws Exception;
 
	public int insertUser(User user) throws Exception ;
	
	public int deleteUser(int id) throws Exception ;
	
	public int updateUser(User user) throws Exception ;
	
	public User queryUserById(int id) throws Exception ;
	
	int getCount(User user);
	

}
