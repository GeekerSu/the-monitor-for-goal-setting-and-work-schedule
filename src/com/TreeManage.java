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
	private String parent;
	private String newclass;
	private String parentb;
	private String bookName;
	private String message;
	
	public List<Node> getList(){
		return list;
	}
	
	public void setParent(String parent){
		this.parent=parent;
	}
	
	public void setNewclass(String newclass){
		this.newclass=newclass;
	}
	
	public String getMessage(){
		return message;
	}
	
	public void setParentb(String parentb){
		this.parentb=parentb;
	}
	
	public void setBookName(String bookName){
		this.bookName=bookName;
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
		sql="select * from `"+usr+"Tree` where NodeName='"+parent+"'";
		System.out.println(sql);
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
		int pid=rs.getInt("ID");
		sql="insert into `"+usr+"Tree`(ID,PID,NodeName) values(0,"
				+pid
				+",'"
				+newclass
				+"')";
		dao.executeUpdate(sql);
		System.out.println("Create ClassNode "+newclass+" Success");
		}
		else{
			message="父类不存在！";
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String addBookNode() throws SQLException{
		
		sql="select * from `"+usr+"Tree` where NodeName='"+parentb+"'";
		System.out.println(sql);
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
		int pid=rs.getInt("ID");
//		"update `" + usr + "` set BookNote = '" + noteRealPath + "' where BookName='"+ fileName+"'";
		sql="update `"+usr+"Tree` set PID="+pid+" where NodeName='"+bookName+"'";
		System.out.println(sql);
		dao.executeUpdate(sql);
		System.out.println("Create ClassNode "+newclass+" Success");
		}
		else{
			message="父类不存在！";
			return ERROR;
		}
		return SUCCESS;
	}
}
