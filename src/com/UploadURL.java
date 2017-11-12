package com;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

public class UploadURL extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private String bookURL;
	private String bookName;
	private String usr=(String) ActionContext.getContext().getSession().get("username");
	private Dao dao=new Dao();
	private String sql;
	
	public void setBookURL(String bookURL){
		this.bookURL=bookURL;
	}
	
	public String getBookURL(){
		return bookURL;
	}
	
	public void setBookName(String bookName){
		this.bookName=bookName;
	}
	
	public String getBookName(){
		return bookName;
	}
	
	public String execute(){
		sql="insert into `"+usr
		+"` (BookName,ReadState,BookType,BookNote,BookURL) values('" 
		+ getBookName() + "',"
		+"'0',"
		+"'1',"
		+ "null,'"
		+getBookURL()
		+"')";
		int i=dao.executeUpdate(sql);
		if(i==0)
			return SUCCESS;
		else
			return ERROR;
	}
}
