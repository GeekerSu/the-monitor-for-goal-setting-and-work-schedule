package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DownAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");
	private String path = ServletActionContext.getServletContext().getRealPath("/work")+"/" + usr;
	private String filePath ="";

	public String list() throws Exception {

		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		String[] fileNames = file.list();
		ActionContext ac = ActionContext.getContext();
		@SuppressWarnings("unchecked")
		Map<String, Object> request = (Map<String, Object>) ac.get("request");
		request.put("fileNames", fileNames);
		return "list";
	}

	private String fileName;

	public void setFileName(String fileName) {

//		try {
//			fileName = new String(fileName.getBytes("UTF-8"));
//		} catch (UnsupportedEncodingException e) {
//			throw new RuntimeException();
//		}
		//System.out.println(fileName);
		this.fileName = fileName;
	}
	
	public String down() throws Exception {
		return "download";
	}

	public String getFilePath() throws UnsupportedEncodingException {
		// filePath = URLEncoder.encode(filePath,"UTF-8");
		return filePath;
	}
	
	public String getFileName(){
		return fileName;
	}

	public String view() throws Exception {
		System.out.println(filePath);
		//String tmp="work/" + usr + "/" + fileName;
		//filePath=new String(tmp.getBytes("ISO8859-1"),"utf-8");
		filePath = "work/" + usr + "/" + fileName;
		//filePath = new String(tmp.getBytes("utf-8"),"ISO8859-1");
		//filePath=URLEncoder.encode(filePath,"UTF-8");
		
		System.out.println(filePath);
		return "view";
	}

	public InputStream getAttrInputStream() throws FileNotFoundException {
		System.out.println("Start downloading...");
		System.out.println(fileName);
		return new FileInputStream(path + "\\" + fileName);
	}

	public String getDownFileName() {
		try {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return fileName;
	}
}