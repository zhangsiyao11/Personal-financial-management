package com.zsy.finance.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsy.finance.bean.Msg;
import com.zsy.finance.bean.User;
import com.zsy.finance.services.UserService;


@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(String username){

		//数据库用户名重复校验
		boolean b = userService.checkUser(username);
		if(b){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/users", method=RequestMethod.GET)
	public Msg getAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
		PageHelper.startPage(pn, 5);
		List<User> list = userService.getUsers();
		PageInfo page = new PageInfo(list, 3);		
		return Msg.success().add("pageInfo", page);
	}
	
	@ResponseBody
	@RequestMapping(value="/user" , method=RequestMethod.POST)
	public Msg saveUser(User user){
		//System.out.println(user);
		userService.saveUser(user);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/login" )
	public Msg loginCheck(User user){
		//System.out.println(user);
		String username = user.getUsername();
		//System.out.println(username);
		String password = user.getPassword();
		User cur = userService.getUser(username);
		//System.out.println(cur);
		if(cur == null){
			return Msg.fail().add("av.msg", "用户名不存在");
		}else{
			if( password.equals(cur.getPassword())){
				return Msg.success();
			}else{
				return Msg.fail().add("av.msg", "密码错误");
			}
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/user" , method=RequestMethod.GET)
	public Msg getUser(String username){
		User user = userService.getUser(username);
		return Msg.success().add("user", user);
		
	}
	
	//@PathVariable("name")String username,
	@ResponseBody
	@RequestMapping("/update" )
	public Msg updateUser( User user){
	
		//user.setUsername(username);
		userService.updateUser(user);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("/user/delete")
	public Msg deleteUser(String username){
		//System.out.println(username);
		userService.deleteUser(username);
		return Msg.success();
	}

}
