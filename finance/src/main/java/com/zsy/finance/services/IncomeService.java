package com.zsy.finance.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsy.finance.bean.Income;
import com.zsy.finance.dao.IncomeMapper;

@Service
public class IncomeService {

	@Autowired
	IncomeMapper incomeMapper;

	public List<Income> getAll(String username) {
		// TODO Auto-generated method stub
		return incomeMapper.selectByUsername(username);
		
	}

	public void saveIncome(Income income) {
		// TODO Auto-generated method stub
		incomeMapper.insertSelective(income);
		
	}

	public Income getIncome(int incomeid) {
		// TODO Auto-generated method stub
		return incomeMapper.selectByPrimaryKey(incomeid);
	}

	public void updateIncome(Income income) {
		// TODO Auto-generated method stub
		incomeMapper.updateByPrimaryKeySelective(income);
		
	}

	public void deleteIncome(Integer incomeid) {
		// TODO Auto-generated method stub
		incomeMapper.deleteByPrimaryKey(incomeid);
		
	}
	
	
}
