package com;

import java.sql.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import dao.Dao;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	private Dao dao = new Dao();
	private String username;
	private String password;
	private String message="";
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage(){
		return message;
	}
	
	public String login() {
		String sql = "select * from user where username='" + getUsername()
				+ "' and password ='" + getPassword() + "'";
	//	System.out.println(username);
	//	System.out.println(password);
		ResultSet rS = dao.executeQuery(sql);
		try {
			if (rS.next()) {
				java.util.Map<String, Object> session =  ActionContext.getContext().getSession();
				session.put("username",username);
				return "loginin";
			}
			else{
				message="No user information, please register.";
				return "loginout";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message=e.toString();
			return "loginout";
		}
	}

	public String regist() {
		
		String sql = "insert into user(username,password,isCheck) values('" + getUsername() + "','" + getPassword()
				+ "','0')";
		System.out.print(sql);
		int i = dao.executeUpdate(sql);
		if (i > -1) {
			java.util.Map<String, Object> session =  ActionContext.getContext().getSession();
			session.put("username",username);
			return "success";
		}
		else{
			message="User already exists";
			return "error";
		}
	
	}
	
	public void validateRegist(){
		System.out.println("Validate方法被调用...");
		if (username==null||username.trim().equals(""))
		{
			this.addFieldError("username", "The username is required");
		}
		else if (!username.matches("[A-Za-z0-9]+"))
		{
			this.addFieldError("username","The username must consist of numbers or letters");
		}
	}
	
}