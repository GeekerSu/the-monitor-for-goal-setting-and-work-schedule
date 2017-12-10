package com;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;
public class UserLog extends ActionSupport{
	
	
	private static final long serialVersionUID = 1L;
	private Dao dao=new Dao();
	private String sql;
	private List<Log> logList=new ArrayList<Log>();
	private List<Log> readList=new ArrayList<Log>();
	private String usr=(String) ActionContext.getContext().getSession().get("username");
	
	public List<Log> getLogList(){
		return logList;
	}
	
	public List<Log> getReadList(){
		return readList;
	}
	
	public String execute() throws SQLException{
		sql="select * from `"+usr+"Log`";
		ResultSet rs=dao.executeQuery(sql);
		while(rs.next()){
			Log tmp=new Log();
			tmp.setOID(rs.getInt("OID"));
			tmp.setOperation(rs.getString("Operation"));
			tmp.setOtype(rs.getString("Otype"));
			tmp.setTime(rs.getString("Time"));
			tmp.setTarget(rs.getString("Target"));
			logList.add(tmp);
		}
		return SUCCESS;
	}
	
	public String readingTimeLine() throws SQLException{
		sql="select * from `"+usr+"Log` where Otype='0'";
		ResultSet rstmp=(new Dao()).executeQuery(sql);
		if(rstmp.next()){
			Log start=new Log();
			start.setOID(rstmp.getInt("OID"));
			start.setOperation("用户"+usr+"开始了阅读之旅");
			start.setOtype(rstmp.getString("Otype"));
			start.setTime(rstmp.getString("Time"));
			start.setTarget(rstmp.getString("Target"));
			readList.add(start);
		}
		
		sql="select * from `"+usr+"Log` where Otype='3' or Otype='4'";
		ResultSet rs=dao.executeQuery(sql);
		while(rs.next()){
			Log tmp=new Log();
			tmp.setOID(rs.getInt("OID"));
			tmp.setOperation(rs.getString("Operation"));
			tmp.setOtype(rs.getString("Otype"));
			tmp.setTime(rs.getString("Time"));
			tmp.setTarget(rs.getString("Target"));
			readList.add(tmp);
		}
		Collections.reverse(readList);
		return SUCCESS;
	}
}
