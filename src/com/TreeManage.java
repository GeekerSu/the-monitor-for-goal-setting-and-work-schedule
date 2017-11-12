package com;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class TreeManage extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Dao dao= new Dao();
	private String sql;
	private String usr=(String) ActionContext.getContext().getSession().get("username");
	private List<Node> list=new ArrayList<Node>();
	private String parentNode;
	private String className;
	private String message;
	
	public List<Node> getList(){
		return list;
	}
	
	public void setParentNode(String parentNode){
		this.parentNode=parentNode;
	}
	
	public String getParentNode(){
		return parentNode;
	}
	
	public void setClassName(String className){
		this.className=className;
	}
	
	public String getClassName(){
		return className;
	}
	
	public String getMessage(){
		return message;
	}
	
	public String queryTreeList()  throws SQLException{
		sql="select * from `"+usr+"Tree`";
		ResultSet rs=dao.executeQuery(sql);
		while(rs.next()){
			Node tmp=new Node();
			tmp.setID(rs.getInt("ID"));
			tmp.setPID(rs.getInt("PID"));
			tmp.setNodeName(rs.getString("NodeName"));
			list.add(tmp);
		}
		System.out.println("Query Treelist Success");
		return SUCCESS;
	}
	
	public String addClassNode() throws SQLException{
		sql="select * from `"+usr+"Tree` where NodeName='"+parentNode+"'";
		System.out.println(sql);
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
		int pid=rs.getInt("ID");
		sql="insert into `"+usr+"Tree`(ID,PID,NodeName) values(0,"
				+pid
				+",'"
				+className
				+"')";
		dao.executeUpdate(sql);
		System.out.println("Create ClassNode "+className+" Success");
		}
		else{
			message="∏∏¿‡≤ª¥Ê‘⁄£°";
			return ERROR;
		}
		return SUCCESS;
	}
}
