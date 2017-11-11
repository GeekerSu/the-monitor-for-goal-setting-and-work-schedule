package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
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

	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr+"/books";
	private String notePath=ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr+"/notes";
	private String filePath = "";
	private String fileName;
	private String noteName;
	private String note;
	private String noteRealPath;

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
	public void setNote(String note){
		this.note=note;
	}
	
	public String getNoteRealPath(){
		return noteRealPath;
	}
	
	public String getNote() throws SQLException, IOException{
		//notePath=notePath.replace("\\", "/");
		noteRealPath=notePath.replace("\\","/")+"/"+noteName;
		String tmp=null;
		sql = "select * from `"+usr+"` where BookName='"+ fileName +"'";
		ResultSet rs = dao.executeQuery(sql);
		if(rs.next()){
			tmp=rs.getString("BookNote");
			System.out.println(tmp);
		}
		if(tmp!=null)
		{
			File file=new File(noteRealPath);
			FileInputStream fis=new FileInputStream(file);
			System.out.println("Total file size to read (in bytes) : "
					+ fis.available());
			byte[] b = new byte[fis.available()];
			fis.read(b);
			fis.close();
			note=new String(b);
			System.out.println(note);
		}
		else{
			note=null;
		}
		return note;
	}
	
	public String getDefaultReadStateValue() throws SQLException {
		sql = "select * from `" + usr + "` where BookName='" + fileName + "'";
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

	public String submit() throws SQLException, IOException {
		//sql = "update book set authorID=?,Publisher=?,PublishDate=?,Price=? where ISBN=?";
		File notedir= new File(notePath);
		if(!notedir.exists()){
			notedir.mkdirs();
		}
		noteRealPath=notePath.replace("\\", "/")+"/"+noteName;
		System.out.println(noteRealPath);
		File notefile=new File(noteRealPath);
		if(!notefile.exists()){
			notefile.createNewFile();
		}
		PrintStream ps = new PrintStream(new FileOutputStream(notefile));
		ps.print(note);
		ps.close();
		System.out.println("Add note Success");
		switch(state){
		case UNREAD: state="0";
		break;
		case ROUGHLY: state="1";
		break;
		case DETAILED: state="2";
		break;
		}
		sql = "update `" + usr + "` set ReadState = '" + state + "' where BookName='"+ fileName+"'";
		System.out.println(sql);
		int i = dao.executeUpdate(sql);
		sql = "update `" + usr + "` set BookNote = '" + noteRealPath + "' where BookName='"+ fileName+"'";
		System.out.println(sql);
		int j= dao.executeUpdate(sql);
		if (i == 0&&j == 0)
			return "submitsuccess";
		else {
			message = "Submit state error";
			return "error";
		}

	}

	public String list() throws Exception {
		
		List<String> fileNames=new ArrayList<String>();
		List<String> fileNamesUnread=new ArrayList<String>();
		List<String> fileNamesRoughly=new ArrayList<String>();
		List<String> fileNamesDetailed=new ArrayList<String>();
		ActionContext ac = ActionContext.getContext();
		@SuppressWarnings("unchecked")
		Map<String, Object> request = (Map<String, Object>) ac.get("request");
		Dao dao1=new Dao();
		Dao dao2=new Dao();
		Dao dao3=new Dao();
		sql="select * from `"+usr+"`";
		ResultSet rs=dao.executeQuery(sql);
		while(rs.next()){
			fileNames.add(rs.getString("BookName"));
		}
		sql="select * from `"+usr+"` where ReadState='0'";
		//System.out.println(sql);
		ResultSet rsUnread=dao1.executeQuery(sql);
		while(rsUnread.next()){
			fileNamesUnread.add(rsUnread.getString("BookName"));
		}
		sql="select * from `"+usr+"` where ReadState='1'";
		//System.out.println(sql);
		ResultSet rsRoughly=dao2.executeQuery(sql);
		while(rsRoughly.next()){
			fileNamesRoughly.add(rsRoughly.getString("BookName"));
		}
		sql="select * from `"+usr+"` where ReadState='2'";
		//System.out.println(sql);
		ResultSet rsDetailed=dao3.executeQuery(sql);
		while(rsDetailed.next()){
			fileNamesDetailed.add(rsDetailed.getString("BookName"));
		}
		request.put("fileNames", fileNames);
		request.put("fileNamesUnread", fileNamesUnread);
		request.put("fileNamesRoughly", fileNamesRoughly);
		request.put("fileNamesDetailed", fileNamesDetailed);
		return "list";
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
		this.noteName = fileName.substring(0,fileName.length()-4)+"note.txt";
	}

	public String down() throws Exception {
		return "download";
	}

	public String getFilePath() {
		return filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public String view() throws Exception {
		filePath = "work/" + usr + "/" +"books/"+ fileName;
		//System.out.println(filePath);
//		sql="select * from `"+usr+"` where BookName='"+fileName+"'";
//		ResultSet rs=dao.executeQuery(sql);
//		while(rs.next()){
//			filePath=rs.getString("BookURL");
//		}
//		System.out.println(filePath);
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