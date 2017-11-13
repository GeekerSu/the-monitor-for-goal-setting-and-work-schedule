
package com;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class DeleteAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");
	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr + "/books";
	private String filePath = "";
	private String fileName;
	private String message;
	private Dao dao = new Dao();
	private String sql;

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}

	public String execute() throws SQLException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time) values(0,'и╬ЁЩакндуб:"+fileName+"','6','"
				+current+"')";
		dao.executeUpdate(sql);
		System.out.println("Insert into Userlog success");
		
		String bookType = "0";
		sql = "select * from `" + usr + "` where BookName = '" + fileName + "'";
		ResultSet rs = dao.executeQuery(sql);
		while (rs.next()) {
			bookType = rs.getString("BookType");
		}
		if (bookType.equals("0")) {
			filePath = path + "/" + fileName;
			File file = new File(filePath);
			if (!file.exists()) {
				System.out.println("Delete failed, file doesn't exist!");
				message = "Delete failed, file doesn't exist!";
				return "error";
			} else {
				if (file.isFile()) {
					file.delete();
					System.out.println("Delete File Success");
					sql = "delete from `" + usr + "` where BookName ='" + fileName + "'";
					System.out.println(sql);
					dao.executeUpdate(sql);
					sql = "delete from `"+usr+"Tree` where NodeName ='"+fileName+"'";
					dao.executeUpdate(sql);
					System.out.println("Delete file data success");
				}
				return "success";
			}
		} else {
			sql = "delete from `" + usr + "` where BookName ='" + fileName + "'";
			System.out.println(sql);
			dao.executeUpdate(sql);
			sql = "delete from `"+usr+"Tree` where NodeName ='"+fileName+"'";
			dao.executeUpdate(sql);
			System.out.println("Delete URL success");
			return "success";
		}
	}
}
