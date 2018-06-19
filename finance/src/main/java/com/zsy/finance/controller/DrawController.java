package com.zsy.finance.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsy.finance.bean.Msg;
import com.zsy.finance.bean.Res;
import com.zsy.finance.services.SpendService;

@Controller
public class DrawController {
	
	@Autowired
	SpendService spendService;
	
	@ResponseBody
	@RequestMapping("/species")
	public Msg getSpecies(String username){
		List<Res> list = spendService.getMoneyBySpecies(username);
		return Msg.success().add("list", list);
	}
	
	@ResponseBody
	@RequestMapping("/species/year")
	public Msg getSpeciesWithYear(String username,String year){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("year", year);
		List<Res> list = spendService.getSpeciesWithYear(map);
		return Msg.success().add("list", list);
	}
	
	@ResponseBody
	@RequestMapping("/species/month")
	public Msg getSpeciesWithMonth(String username,String month){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		String[] str = month.split("-");
		map.put("year", str[0]);
		map.put("month", str[1]);
		List<Res> list = spendService.getSpeciesWithMonth(map);
		return Msg.success().add("list", list);
	}
	
	@ResponseBody
	@RequestMapping("/year/money")
	public Msg getMoneyWithYear(String username){
		List<Res> list = spendService.getMoneyWithYear(username);
		//System.out.println(list);
		return Msg.success().add("list",list);
	}
	
	@ResponseBody
	@RequestMapping("/year")
	public Msg getNumOfYear(String username){
		List<String> years = spendService.getNumOfYear(username);
		//System.out.println(years);
		return Msg.success().add("years",years);
	}
	
	@ResponseBody
	@RequestMapping("/month")
	public Msg getMoneyWithMonth(String username,String year){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("year", year);
		List<Res> list = spendService.getMoneyWithMonth(map);
		//System.out.println(list);
		return Msg.success().add("list", list);
	}
	
}
