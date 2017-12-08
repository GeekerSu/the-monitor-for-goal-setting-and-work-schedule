package com;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Dao;

public class UploadURL extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private String bookURL;
	private String bookName;
	private String pnode;//父类
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
	
	public void setPnode(String pnode){
		this.pnode=pnode;
	}
	
	public String execute() throws SQLException{
		sql="insert into `"+usr
		+"` (BookName,ReadState,BookType,BookNote,BookURL) values('" 
		+ getBookName() + "',"
		+"'0',"
		+"'1',"
		+ "null,'"
		+getBookURL()
		+"')";
		int i=dao.executeUpdate(sql);
//		sql="insert into `"+usr+"Tree` (ID,PID,NodeName,NodeType) values(0,1,'"+getBookName()+"',0)";
		sql="select * from `"+usr+"Tree` where NodeName='"+pnode+"'";
		ResultSet rs=(new Dao()).executeQuery(sql);
		int pid=1;
		while(rs.next()){
			pid=rs.getInt("ID");
		}
		sql="insert into `"+usr+"Tree` (ID,PID,NodeName,NodeType) values(0,"+pid+",'"+getBookName()+"',0)";
		System.out.println(sql);
		int j=dao.executeUpdate(sql);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'上传了URL："+getBookName()+"','2','"
				+current+"','"+getBookName()+"')";
		int k=dao.executeUpdate(sql);
		if(i==0&&j==0&&k==0)
			return SUCCESS;
		else
			return ERROR;
	}
}
