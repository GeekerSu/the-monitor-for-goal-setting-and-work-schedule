package com;

import java.io.File;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class DeleteAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");
	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr;
	private String filePath = "";
	private String fileName;
	private String message;
	private Dao dao=new Dao();
	private String sql;
	
	public void setFileName(String fileName){
		this.fileName=fileName;
	}
	
	public String getFileName(){
		return fileName;
	}
	
//	public static boolean delete(String fileName) {
//        File file = new File(fileName);
//        if (!file.exists()) {
//            System.out.println("删除文件失败:" + fileName + "不存在！");
//            return false;
//        } else {
//            if (file.isFile())
//                return deleteFile(fileName);
//            else
//                return deleteDirectory(fileName);
//        }
//  }
    
	public String execute(){
		filePath=path+"/"+fileName;
		File file=new File(filePath);
		boolean i = false;
		if(!file.exists()){
			System.out.println("Delete failed, file doesn't exist!");
			message="Delete failed, file doesn't exist!";
			return "error";
		}
		else{
			if(file.isFile())
			{
				i=file.delete();
				System.out.println("Delete File Success");
				sql = "delete from `"+ usr +"` where BookName ='"+fileName+"'";
				System.out.println(sql);
				dao.executeUpdate(sql);
				System.out.println("Delete file data success");
			}
			return "success";
		}
	}
	
	
}
