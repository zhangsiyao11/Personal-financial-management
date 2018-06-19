package com.zsy.finance.test;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zsy.finance.bean.Income;
import com.zsy.finance.bean.IncomeExample;
import com.zsy.finance.bean.Res;
import com.zsy.finance.bean.Spend;
import com.zsy.finance.bean.User;
import com.zsy.finance.dao.IncomeMapper;
import com.zsy.finance.dao.SpendMapper;
import com.zsy.finance.dao.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	IncomeMapper income ;
	
	@Autowired
	SpendMapper spend;
	
	@Autowired
	UserMapper user;
	
	@Test
	public void test(){
		
		List<String> list = spend.numOfYear("lishang@pfg.com");
		System.out.println(list);
		System.out.println("1111111");
		
//		HashMap<String, String> map = new HashMap<String,String>();
//		map.put("username", "lishang@pfg.com");
//		map.put("year", "2018");
//		map.put("month","04");
//		List<Res> list = spend.sumMoneyBySpeciesWithMonth(map);
//		for(Res r:list){
//			System.out.println(r);
//		}
		
//		List<Res> list = spend.sumMoneyByYear("lishang@pfg.com");
//		for(Res r:list){
//			System.out.println(r);
//		}
		
//		List<Res> list = spend.sumMoneyBySpecies("lishang@pfg.com");
//		for(Res r:list){
//			System.out.println(r);
//		}
		
		
//		List<String> list = spend.numOfSpecies("lishang@pfg.com");
//		for(String s : list){
//			System.out.println(s);
//		}
		
		
//		List<Res> res = spend.countBySpecies("lishang@pfg.com");
//		for(Res r :res){
//			System.out.println(r);
//		}
		
		//System.out.println(income);
		
		//income.insertSelective(new Income("张三", new Date(), 2000));
		//income.deleteByPrimaryKey(1);
		
		//income.updateByPrimaryKeySelective(new Income(6,null,null,6000,"工资"));
	
//		List<Income> lists = income.selectByUsername("李磊");
//		
//		for(Income in : lists){
//			System.out.println(in);
//		}

		//System.out.println(spend+"-----");
		
		//spend.insertSelective(new Spend("张三", new Date(), "购物", 500, null));
		//spend.deleteByPrimaryKey(2);
		
		//System.out.println(user);
		
		//user.insertSelective(new User("离殇","123456", null, null, null, null, null));
		//user.insertSelective(new User("路飞","111111", "李磊", "34", "4657627@126.com", "18292183104", 30000));
		//user.deleteByPrimaryKey("张三");
		//user.updateByPrimaryKeySelective(new User("路飞","111111", "lufei", "34", "4657627@126.com", "18292183104", 30000));
		
		//System.out.println(user.deleteByPrimaryKey("lirang@pfg.com"));
//		System.out.println(u);
		
	}

}
