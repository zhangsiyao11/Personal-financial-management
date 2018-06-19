package com.zsy.finance.bean;

public class Res {
	
	private int num;
	private String event;
	
	public Res() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Res(int num, String event) {
		super();
		this.num = num;
		this.event = event;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	@Override
	public String toString() {
		return "Res [num=" + num + ", event=" + event + "]";
	}
	
	

}
