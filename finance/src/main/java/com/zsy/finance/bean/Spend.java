package com.zsy.finance.bean;

import java.util.Date;

public class Spend {
    private Integer spendid;

    private String username;

    private Date date;

    private String species;

    private Integer money;

    private String note;
    

    public Spend() {
		super();
		// TODO Auto-generated constructor stub
	}
    
	public Spend(String username, Date date, String species, Integer money,
			String note) {
		super();
		this.username = username;
		this.date = date;
		this.species = species;
		this.money = money;
		this.note = note;
	}

	public Spend(Integer spendid, String username, Date date, String species,
			Integer money, String note) {
		super();
		this.spendid = spendid;
		this.username = username;
		this.date = date;
		this.species = species;
		this.money = money;
		this.note = note;
	}
   
	public Integer getSpendid() {
        return spendid;
    }

    public void setSpendid(Integer spendid) {
        this.spendid = spendid;
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

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species == null ? null : species.trim();
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
		return "Spend [spendid=" + spendid + ", username=" + username
				+ ", date=" + date + ", species=" + species + ", money="
				+ money + ", note=" + note + "]";
	}
    
}