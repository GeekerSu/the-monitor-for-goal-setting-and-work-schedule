package com;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class CommonAction extends ActionSupport {
	private String sharePath;
	private String fileName;
	private String usr;
	private String standardFileName;
	private String type;
	
	public String getSharePath(){
		return sharePath;
	}
	
	public void setFileName(String fileName){
		this.fileName=fileName;
	}
	
	public String getFileName(){
		return fileName;
	}
	
	public void setUsr(String usr){
		this.usr=usr;
	}
	
	public String getStandardFileName(){
		return standardFileName;
	}
	
	public void setType(String type){
		this.type=type;
	}
	
	public String execute() throws SQLException{
		if(type.equals("0")){
		sharePath="./pdfjs/viewer.html?file=../"+"work/"+usr+"/share/"+fileName.substring(0,fileName.length()-4)+"share.pdf";
		standardFileName=fileName.substring(0,fileName.length()-4)+"±ê×¼ÎÄµµ.pdf";
		}
		else{
			String sql="select BookURL from `"+usr+"` where BookName='"+fileName+"'";
			ResultSet rs=(new Dao()).executeQuery(sql);
			if(rs.next()){
				sharePath=rs.getString("BookURL");
			}
			standardFileName=fileName;
		}
		return SUCCESS;
	}
	
	
}
