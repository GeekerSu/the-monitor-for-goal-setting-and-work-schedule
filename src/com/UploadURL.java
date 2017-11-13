package com;



import java.text.SimpleDateFormat;
import java.util.Date;

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
		sql="insert into `"+usr+"Tree` (ID,PID,NodeName) values(0,1,'"+getBookName()+"')";
		int j=dao.executeUpdate(sql);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time) values(0,'ÉÏ´«ÁËURL:"+getBookName()+"','2','"
				+current+"')";
		int k=dao.executeUpdate(sql);
		if(i==0&&j==0&&k==0)
			return SUCCESS;
		else
			return ERROR;
	}
}
