package com.zsy.finance.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	
	private int code;
	private String msg;
	private Map<String, Object> map = new HashMap<String, Object>();
	
	public static Msg success(){
		Msg result = new Msg();
		result.code = 1;
		result.msg = "操作成功";
		return result; 
	}
	
	public static Msg fail(){
		Msg result = new Msg();
		result.code = 0;
		result.msg = "操作失败";
		return result; 
	}

	public Msg add(String key,Object value){
		this.map.put(key, value);
		return this;
		
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

}
