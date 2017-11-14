package com;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Date;
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
			//java.util.Map<String, Object> session = ActionContext.getContext().getSession();
			//session.put("username", username);
			String tmpsql="CREATE TABLE `"+username +"` ("
					+ "`BookName` varchar(40) NOT NULL,"
					+"`ReadState` varchar(1) NOT NULL DEFAULT '0',"
					+"`BookType` tinyint(1) DEFAULT '0',"
					+"`BookNote` varchar(255) DEFAULT NULL,"
					+"`BookURL` varchar(255) DEFAULT NULL,"
					+"  PRIMARY KEY (`BookName`)"
					+") ENGINE=InnoDB DEFAULT CHARSET=utf8";
			int j= dao.executeUpdate(tmpsql);
			System.out.println("Create table "+username+ "success");
			
			tmpsql="CREATE TABLE `"+username +"Tree` ("
					+ "`ID` int NOT NULL AUTO_INCREMENT,"
					+"`PID` int NOT NULL DEFAULT 1,"
					+"`NodeName` varchar(40) NOT NULL UNIQUE,"
					+"  PRIMARY KEY (`ID`)"
					+") ENGINE=InnoDB DEFAULT CHARSET=utf8";
			int k=dao.executeUpdate(tmpsql);
			tmpsql="insert into `"+username+"Tree` (ID,PID,NodeName) values(1,-1,'root')";
			int m=dao.executeUpdate(tmpsql);
			System.out.println("Create table "+username+"Tree success");
			
			tmpsql="CREATE TABLE `"+username +"Log` ("
					+ "`OID` int NOT NULL AUTO_INCREMENT,"
					+"`Operation` varchar(127) NOT NULL,"
					+"`Otype` varchar(1) NOT NULL,"
					+"`Time` varchar(31) NOT NULL,"
					+"`Target` varchar(40) DEFAULT NULL,"
					+" PRIMARY KEY (`OID`)"
					+") ENGINE=InnoDB DEFAULT CHARSET=utf8";
/*
 * Otypeӳ�䣺
 * 0��ע��
 * 1���ϴ��ļ�
 * 2���ϴ�URL
 * 3���Ķ�ĳƪ����
 * 4���޸��Ķ��ʼ�
 * 5������ĳƪ����
 * 6��ɾ��ĳƪ����
 * 7������µķ���
 * 8���޸ķ���
 */
			int n=dao.executeUpdate(tmpsql);
			System.out.println("Create table "+username+"Log success");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String current=df.format(new Date());//new Date() ��ȡ��ǰϵͳʱ��
			System.out.println(current);
			tmpsql="insert into `"+username+"Log`(OID,Operation,Otype,Time) values(0,'ע�����˻���"+username+"','0','"
					+current+"')";
			//System.out.println(tmpsql);
			int p=dao.executeUpdate(tmpsql);
			
			if(j>-1&&k>-1&&m>-1&&n>-1&&p>-1)
			{ 
				System.out.println("Register user success");
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