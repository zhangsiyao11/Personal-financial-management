package com.zsy.finance.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsy.finance.bean.Res;
import com.zsy.finance.bean.Spend;
import com.zsy.finance.dao.SpendMapper;

@Service
public class SpendService {
	
	@Autowired
	SpendMapper spendMapper;

	public List<Spend> getAllSpend(String username) {
		// TODO Auto-generated method stub
		return spendMapper.selectByUsername(username);
	}

	public void saveSpend(Spend spend) {
		// TODO Auto-generated method stub
		spendMapper.insertSelective(spend);
		
	}

	public Spend getSpend(Integer spendid) {
		// TODO Auto-generated method stub
		return spendMapper.selectByPrimaryKey(spendid);
	}

	public void updateSpend(Spend spend) {
		// TODO Auto-generated method stub
		spendMapper.updateByPrimaryKeySelective(spend);
	}

	public void deleteSpend(Integer spendid) {
		// TODO Auto-generated method stub
		spendMapper.deleteByPrimaryKey(spendid);
	}

	public List<Res> countBySpecies(String username) {
		// TODO Auto-generated method stub
		return spendMapper.countBySpecies(username);
	}

	public List<Res> getMoneyBySpecies(String username) {
		// TODO Auto-generated method stub
		return spendMapper.sumMoneyBySpecies(username);
	}

	public List<Res> getSpeciesWithYear(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return spendMapper.sumMoneyBySpeciesWithYear(map);
	}

	public List<Res> getMoneyWithYear(String username) {
		// TODO Auto-generated method stub
		return spendMapper.sumMoneyByYear(username);
	}

	public List<Res> getMoneyWithMonth(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return spendMapper.sumMoneyByMonth(map);
	}

	public List<String> getNumOfYear(String username) {
		// TODO Auto-generated method stub
		return spendMapper.numOfYear(username);
	}

	public List<Res> getSpeciesWithMonth(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return spendMapper.sumMoneyBySpeciesWithMonth(map);
	}

}
