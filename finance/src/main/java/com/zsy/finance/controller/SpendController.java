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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsy.finance.bean.Income;
import com.zsy.finance.bean.Msg;
import com.zsy.finance.bean.Res;
import com.zsy.finance.bean.Spend;
import com.zsy.finance.services.SpendService;

@Controller
public class SpendController {

	@Autowired
	SpendService spendService;

	@ResponseBody
	@RequestMapping("/spend/show")
	public Msg getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String username){
		PageHelper.startPage(pn, 5);
		List<Spend> list = spendService.getAllSpend(username);
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
	
	@ResponseBody
	@RequestMapping("/spend/save")
	public Msg saveSpend(Spend spend){
		spendService.saveSpend(spend);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/spend")
	public Msg getSpend(Integer spendid){
		Spend spend = spendService.getSpend(spendid);
		System.out.println(spend);
		return Msg.success().add("spend", spend);
	}
	
	@ResponseBody
	@RequestMapping("/spend/update")
	public Msg updateSpend(Spend spend){
		spendService.updateSpend(spend);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/spend/delete")
	public Msg deleteSpend(Integer spendid){
		spendService.deleteSpend(spendid);
		return Msg.success();
	}

}
