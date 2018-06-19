package com.zsy.finance.bean;

import java.util.Date;

public class Income {
    private Integer incomeid;

    private String username;

    private Date date;

    private Integer money;

    private String note;
    
    public Income() {
		super();
		// TODO Auto-generated constructor stub
	}  

	public Income(String username, Date date, Integer money) {
		super();
		this.username = username;
		this.date = date;
		this.money = money;
	}


    public Income(Integer incomeid, String username, Date date, Integer money,
			String note) {
		super();
		this.incomeid = incomeid;
		this.username = username;
		this.date = date;
		this.money = money;
		this.note = note;
	}

	public Integer getIncomeid() {
        return incomeid;
    }

    public void setIncomeid(Integer incomeid) {
        this.incomeid = incomeid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

	@Override
	public String toString() {
		return "Income [incomeid=" + incomeid + ", username=" + username
				+ ", date=" + date + ", money=" + money + ", note=" + note
				+ "]";
	}
    
    
}