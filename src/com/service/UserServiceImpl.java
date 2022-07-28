package com.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserMapper;
import com.model.User;
import com.util.PageBean;
@Service
public class UserServiceImpl implements UserService
{
        
    @Autowired
	private UserMapper userMapper;


	public List<User> queryUserList(User user,PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(user, page);
		
		List<User> getUser = userMapper.query(map);
		return getUser;
	}
	
	@Override
	public int getCount(User user) {
		Map<String, Object> map = getQueryMap(user, null);
		int count = userMapper.getCount(map);
		return count;
	}
	
	private Map<String, Object> getQueryMap(User user,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(user!=null){
			map.put("id", user.getId());

		}
		PageBean.setPageMap(map, page);
		return map;
	}

	public int insertUser(User user) throws Exception {
		
		return userMapper.insertUser(user);
	}

	public int deleteUser(int id) throws Exception {
		return userMapper.deleteUser(id);
	}

	public int updateUser(User user) throws Exception {
		return userMapper.updateUser(user);
	}
	
	public User queryUserById(int id) throws Exception {
		return userMapper.queryUserById(id);
	}
	

	
	
	
	
 
}
