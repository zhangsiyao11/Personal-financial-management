package com.zsy.finance.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsy.finance.bean.User;
import com.zsy.finance.bean.UserExample;
import com.zsy.finance.bean.UserExample.Criteria;
import com.zsy.finance.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	public User getUser(String username) {
		// TODO Auto-generated method stub
		
		return userMapper.selectByPrimaryKey(username);
	}
	
	public void saveEmp(User user){
		userMapper.insertSelective(user);
	}

	public boolean checkUser(String username) {
		// TODO Auto-generated method stub
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(userExample);
		return count == 0; 
	}

	public void saveUser(User user) {
		// TODO Auto-generated method stub
		userMapper.insertSelective(user);
		
	}

	public User getAll() {
		// TODO Auto-generated method stub
		User user = userMapper.selectByPrimaryKey("admin@163.com");
		return user;
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKeySelective(user);
		
		
	}

	public void deleteUser(String username) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(username);
	}

	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return userMapper.getUsers();
	}



}
