package com.zsy.finance.bean;

public class User {
    private String username;

    private String password;

    private String realname;

    private String age;

    private String email;

    private String phone;

    private Integer money;

    public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, String realname, String age,
			String email, String phone, Integer money) {
		super();
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.age = age;
		this.email = email;
		this.phone = phone;
		this.money = money;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age == null ? null : age.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password
				+ ", realname=" + realname + ", age=" + age + ", email="
				+ email + ", phone=" + phone + ", money=" + money + "]";
	}
}