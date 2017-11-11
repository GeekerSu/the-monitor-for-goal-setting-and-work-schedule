package com;

import java.sql.*;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport {
	private Dao dao = new Dao();
	private String username;
	private String password;
	private String message = "";

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

	public String getMessage() {
		return message;
	}

	public String login() {



		String sql = "select * from user where username='" + getUsername() + "'";
		ResultSet rS = dao.executeQuery(sql);
		try {
			if (rS.next()) {
				java.util.Map<String, Object> session = ActionContext.getContext().getSession();
				session.put("username", username);
				String realpwd = rS.getString("Password");
				if (realpwd.equals(password))
					return "loginin";

				else {
					message = "Password not right!";

					this.addFieldError("password", "Password not right!");
					return "input";
				}
			} else {
				message = "No user information, please register.";
				return "loginout";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			message = e.toString();
			return "loginout";
		}
	}

	public String regist() {

		String sql = "insert into user(username,password,isCheck) values('" + getUsername() + "','" + getPassword()
				+ "','0')";

		System.out.println(sql);

		int i = dao.executeUpdate(sql);
		if (i > -1) {
			java.util.Map<String, Object> session = ActionContext.getContext().getSession();
			session.put("username", username);
			String tmpsql="CREATE TABLE `"+username +"` ("
					+ "`BookName` varchar(40) NOT NULL,"
					+"`ReadState` varchar(1) NOT NULL DEFAULT '0',"
					+"`BookType` tinyint(1) DEFAULT '0',"

					+"`BookNote` varchar(256) DEFAULT NULL,"
					+"`BookURL` varchar(256) DEFAULT NULL,"
					+"  PRIMARY KEY (`BookName`)"
					+") ENGINE=InnoDB DEFAULT CHARSET=utf8";
			int j= dao.executeUpdate(tmpsql);
			if(j>-1)
			{ 
				System.out.println("Create user table success");
				return "success";
			}
			else{
				message = "Create user table failed";
				return "error";
			}

		} else {
			message = "User already exists";
			return "error";
		}

	}

	public String logout() {

		Map<String, Object> session = ActionContext.getContext().getSession();
		session.remove("username");
		return "success";
	}

	public void validateRegist() {
		System.out.println("Validate start...");
		if (username == null || username.trim().equals("")) {
			this.addFieldError("username", "The username is required");
		} else if (!username.matches("[A-Za-z0-9]+")) {
			this.addFieldError("username", "The username must consist of numbers or letters");
		}
		if (password == null || password.trim().equals("")) {
			this.addFieldError("password", "The password is required");
		}
	}

	public void validateLogin() {

		System.out.println("Validate start...");
		if (username == null || username.trim().equals("")) {
			this.addFieldError("username", "The username is required");
		} else if (!username.matches("[A-Za-z0-9]+")) {
			this.addFieldError("username", "The username must consist of numbers or letters");
		}
		if (password == null || password.trim().equals("")) {
			this.addFieldError("password", "The password is required");
		}
	}

}