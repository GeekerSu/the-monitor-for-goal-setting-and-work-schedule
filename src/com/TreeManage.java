package com;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	private List<String> nodeList=new ArrayList<String>();//不含leaf
	private List<String> allList=new ArrayList<String>();//不含root
	private String parent;
	private String newclass;
	private String parentb;
	private String bookName;
	private String nodeToDelete;
	private String message;
	
	public List<Node> getList(){
		return list;
	}
	
	public List<String> getNodeList(){
		return nodeList;
	}
	
	public List<String> getAllList(){
		return allList;
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
	
	public void setNodeToDelete(String nodeToDelete){
		this.nodeToDelete=nodeToDelete;
	}
	
	public String queryTreeList()  throws SQLException{
		sql="select * from `"+usr+"Tree`";
		ResultSet rs=dao.executeQuery(sql);
		boolean type=false;
		String name="";
		while(rs.next()){
			Node tmp=new Node();
			type=rs.getBoolean("NodeType");
			name=rs.getString("NodeName");
			tmp.setID(rs.getInt("ID"));
			tmp.setPID(rs.getInt("PID"));
			tmp.setNodeName(name);
			tmp.setNodeType(type);
			list.add(tmp);
			if(type){//not leaf
				nodeList.add(name);
			}
			if(rs.getInt("PID")!=-1){//not root
			allList.add(name);
			}
		}
		System.out.println("Query Treelist Success");
		return SUCCESS;
	}
	
	public String addClassNode() throws SQLException{
		sql="select * from `"+usr+"Tree` where NodeName='"+newclass+"'";
		ResultSet rstmp=(new Dao()).executeQuery(sql);
		if(rstmp.next()){
			message="已存在同名分类！";
			return ERROR;
		}
		sql="select * from `"+usr+"Tree` where NodeName='"+parent+"'";
		System.out.println(sql);
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
		int pid=rs.getInt("ID");
		sql="insert into `"+usr+"Tree`(ID,PID,NodeName,NodeType) values(0,"
				+pid
				+",'"
				+newclass
				+"',1)";
		dao.executeUpdate(sql);
		System.out.println("Create ClassNode "+newclass+" Success");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'添加了新的分类："+newclass+"','7','"
				+current+"','"+newclass+"')";
		dao.executeUpdate(sql);
		}
		else{
			message="父类不存在！";
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String addBookNode() throws SQLException{
		sql="select * from `"+usr+"Tree` where NodeName='"+parentb+"'";
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
		int pid=rs.getInt("ID");
//		"update `" + usr + "` set BookNote = '" + noteRealPath + "' where BookName='"+ fileName+"'";
		sql="update `"+usr+"Tree` set PID="+pid+" where NodeName='"+bookName+"'";
		System.out.println(sql);
		dao.executeUpdate(sql);
		System.out.println("Create ClassNode "+bookName+" Success");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'修改了文章的分类："+bookName+"','8','"
				+current+"','"+bookName+"')";
		dao.executeUpdate(sql);
		System.out.println("Insert into Userlog success");
		}
		else{
			message="父类不存在！";
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String deleteNode() throws SQLException{
		sql="select * from `"+usr+"Tree` where NodeName='"+nodeToDelete+"'";
		ResultSet rs=dao.executeQuery(sql);
		int pid=1;
		int id=1;
		if(rs.next()){
			pid=rs.getInt("PID");
			if(pid==-1){
				message="root不可被删除";
				return ERROR;
			}
			id=rs.getInt("ID");
			Boolean type=rs.getBoolean("NodeType");
			if(!type){
				message="所选分类不是父类";
				return ERROR;
			}
			sql="update `"+usr+"Tree` set PID="+pid+" where PID="+id;
			dao.executeUpdate(sql);
			sql="delete from `"+usr+"Tree` where ID="+id;
			dao.executeUpdate(sql);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String current=df.format(new Date());
			sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'删除了分类："+nodeToDelete+"','10','"
					+current+"','"+nodeToDelete+"')";
			System.out.println(sql);
			if(dao.executeUpdate(sql)>-1)
			{System.out.println("Success Deleted Node:"+nodeToDelete);}
		}
		else{
			message="所要删除的分类不存在！";
			return ERROR;
		}
		return SUCCESS;
		
	}
}
