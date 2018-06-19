package com.zsy.finance.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsy.finance.bean.Income;
import com.zsy.finance.bean.Msg;
import com.zsy.finance.bean.User;
import com.zsy.finance.services.IncomeService;


@Controller
public class IncomeController {
	

	@Autowired
	IncomeService incomeService;
	
	@ResponseBody
	@RequestMapping("/income/show")
	public Msg getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String username){
		PageHelper.startPage(pn, 5);
		List<Income> list = incomeService.getAll(username);
		PageInfo page = new PageInfo(list, 3);		
		return Msg.success().add("pageInfo", page);
	}
	

	
	@InitBinder
    protected void initBinder(HttpServletRequest request,
        ServletRequestDataBinder binder) throws Exception {
		 // SimpleDateFormat dateFormat = new
        // SimpleDateFormat(getText("date.format", request.getLocale()));
        DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }
	//@PathVariable("username")String username,
	@ResponseBody
	@RequestMapping(value="/income/save"  ,method=RequestMethod.POST)
	public Msg saveIncome(Income income){
		//System.out.println(income);
		incomeService.saveIncome(income);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/income")
	public Msg getIncome(Integer incomeid){
		//System.out.println(incomeid);
		Income i = incomeService.getIncome(incomeid);
		return Msg.success().add("income", i);
	}
	
	@ResponseBody
	@RequestMapping("/income/update")
	public Msg updateIncome(Income income){
		incomeService.updateIncome(income);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/income/delete")
	public Msg deleteIncome(Integer incomeid){
		incomeService.deleteIncome(incomeid);
		return Msg.success();
	}

}
