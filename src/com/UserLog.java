package com;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;
public class UserLog extends ActionSupport{
	
	
	private static final long serialVersionUID = 1L;
	private Dao dao=new Dao();
	private String sql;
	private List<Log> logList=new ArrayList<Log>();
	private String usr=(String) ActionContext.getContext().getSession().get("username");
	
	public List<Log> getLogList(){
		return logList;
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
			logList.add(tmp);
		}
		return SUCCESS;
	}
}
