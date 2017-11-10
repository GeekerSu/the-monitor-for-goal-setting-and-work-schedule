package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import dao.Dao;

public class DownAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");
	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr;
	private String filePath = "";
	private String fileName;
	private List<String> readState;
	private Dao dao = new Dao();
	private String sql;
	private String state;
	private String message;

	private static final String UNREAD = "Unread";
	private static final String ROUGHLY = "Roughly Read";
	private static final String DETAILED = "Detailed Read";

	public DownAction() {
		readState = new ArrayList<String>();
		readState.add(UNREAD);
		readState.add(ROUGHLY);
		readState.add(DETAILED);
	}

	public String getMessage() {
		return message;
	}

	public List<String> getReadState() {
		return readState;
	}

	public String getDefaultReadStateValue() throws SQLException {
		sql = "select * from " + usr + " where BookName='" + fileName + "'";
		System.out.println(sql);
		ResultSet rs = dao.executeQuery(sql);
		if (rs.next()) {
			String state = rs.getString("ReadState");
			// System.out.println(state);
			switch (state) {
			case "0":
				return UNREAD;
			case "1":
				return ROUGHLY;
			case "2":
				return DETAILED;
			default:
				return null;
			}
		} else
			return null;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String submit() throws SQLException {
		//sql = "update book set authorID=?,Publisher=?,PublishDate=?,Price=? where ISBN=?";
		switch(state){
		case UNREAD: state="0";
		break;
		case ROUGHLY: state="1";
		break;
		case DETAILED: state="2";
		break;
		}
		sql = "update " + usr + " set ReadState = '" + state + "' where BookName='"+ fileName+"'";
		System.out.println(sql);
		int i = dao.executeUpdate(sql);
		if (i == 0)
			return "submitsuccess";
		else {
			message = "Submit state error";
			return "error";
		}

	}

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

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String down() throws Exception {
		return "download";
	}

	public String getFilePath() throws UnsupportedEncodingException {
		// filePath = URLEncoder.encode(filePath,"UTF-8");
		return filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public String view() throws Exception {
		System.out.println(filePath);
		filePath = "work/" + usr + "/" + fileName;
		System.out.println(filePath);
		return "view";
	}

	public InputStream getAttrInputStream() throws FileNotFoundException {
		System.out.println("Start downloading...");
		System.out.println(fileName);
		return new FileInputStream(path + "/" + fileName);
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