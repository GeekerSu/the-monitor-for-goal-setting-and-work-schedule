package com;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Map;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipOutputStream;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import dao.Dao;

public class DownAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");

	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr+"/books";
	private String notePath=ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr+"/notes";
	private String URL;
	private String filePath = "";
	private String zipName;
	private String fileName;
	private String noteName;
	private String note;
	private String noteRealPath;
	private String classNodeName;
	private String zipFilePath;

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

	public void setClassNodeName(String classNodeName){
		this.classNodeName=classNodeName;
	}
	
	public String getDownZipName(){
		try {
			zipName = URLEncoder.encode(zipName, "UTF-8");
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return zipName;
	}
	
	public String getURL(){
		return URL;
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'修改了阅读笔记和阅读状态："+fileName+"','4','"
				+current+"','"+fileName+"')";
		dao.executeUpdate(sql);
		System.out.println("Insert into Userlog success");
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
		
		sql="select * from `"+usr+"` where BookName ='"+fileName+"'";
		ResultSet rs = (new Dao()).executeQuery(sql);
		int booktype=0;
		while(rs.next()){
			booktype=rs.getInt("BookType");
		}
		if(booktype==0){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'下载了文章："+fileName+"','5','"
				+current+"','"+fileName+"')";
		dao.executeUpdate(sql);
		System.out.println("Insert into Userlog success");
		return "download";}
		else{
			message="URL不支持下载";
			return ERROR;
		}
	}

	public String getFilePath() {
		return filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public String view() throws Exception {
		
		//System.out.println(filePath);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current=df.format(new Date());
		sql="insert into `"+usr+"Log`(OID,Operation,Otype,Time,Target) values(0,'阅读了文章："+fileName+"','3','"
				+current+"','"+fileName+"')";
		dao.executeUpdate(sql);
		System.out.println("Insert into Userlog success");
		sql="select * from `"+usr+"` where BookName='"+fileName+"'";
		ResultSet rs=dao.executeQuery(sql);
		while(rs.next()){
			String bookType=rs.getString("BookType");
			if(bookType.equals("1")){
				URL=rs.getString("BookURL");
			}
			else{
				filePath = "work/" + usr + "/" +"books/"+ fileName;
				URL="./pdfjs/viewer.html?file=../"+filePath;
			}
		}
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
	
	public InputStream getMultiInputStream() throws FileNotFoundException{
		System.out.println("Start downloading...");
		System.out.println(zipFilePath);
		return new FileInputStream(zipFilePath);
	}
	
	public String downMuiltiFile() throws SQLException, IOException{
		zipName=classNodeName+".zip";
		String zipPath=ServletActionContext.getServletContext().getRealPath("/work")+"/"+usr+"/zip";
		int ID=1;
		
		sql="select * from `"+usr+"Tree` where NodeName='"+classNodeName+"'";
		System.out.println(sql);
		ResultSet rs=dao.executeQuery(sql);
		if(rs.next()){
			ID=rs.getInt("ID");
		}
		else{
			message="所选分类不存在！";
			return ERROR;
		}
		
		List<String> fileNamesList=getfileNames(ID);
		List<File> filesList=new ArrayList<File>();
		
		for(String e:fileNamesList){
			sql="select * from `"+usr+"` where BookName='"+e+"'";
			System.out.println(sql);
			ResultSet rstmp=(new Dao()).executeQuery(sql);
			if(rstmp.next()){
			if(!rstmp.getBoolean("BookType")){
			File filetmp=new File(rstmp.getString("BookURL"));
			filesList.add(filetmp);
			}
			}
		}
		
		zipFilePath=zipPath+"/"+zipName;
		File zipdir=new File(zipPath);
		
		if(!zipdir.exists()){
			zipdir.mkdirs();
		}
		
		File zipFile=new File(zipPath,zipName);
		if(!zipFile.exists()){
			zipFile.createNewFile();
		}
		int size=filesList.size();
		File[] sourceFiles=(File[]) filesList.toArray(new File[size]);
		
		FileOutputStream fos=new FileOutputStream(zipFile);
		FileInputStream fis=null;
		BufferedInputStream bis=null;
		ZipOutputStream zos=new ZipOutputStream(new BufferedOutputStream(fos));
		byte[] bufs=new byte[1024*10];
		
		for(int i =0;i<sourceFiles.length;i++){
			//创建ZIP实体并添加进压缩包
			ZipEntry zipEntry = new ZipEntry(sourceFiles[i].getName());
			zos.putNextEntry(zipEntry);
			//读取待压缩的文件并写入压缩包
			fis=new FileInputStream(sourceFiles[i]);
			bis=new BufferedInputStream(fis,1024*10);
			int read=0;
			while((read=bis.read(bufs,0,1024*10))!=-1){
				zos.write(bufs, 0, read);
			}
		}
		if(fis!=null) fis.close();
		if(bis!=null) bis.close();
		if(zos!=null) zos.close();
		System.out.println("Zip File Success!");
		return "downMulti";
	}
	
	public List<String> getfileNames(int ID) throws SQLException{
		List<String > tmp=new ArrayList<String>();
		sql="select * from `"+usr+"Tree` where PID="+ID;
		System.out.println(sql);
		ResultSet rsname=(new Dao()).executeQuery(sql);
		while(rsname.next()){
			int tmpid=rsname.getInt("ID");
			if(!rsname.getBoolean("NodeType")){
				tmp.add(rsname.getString("NodeName"));
			}
			else{
				tmp.addAll(getfileNames(tmpid));
			}	
		}
		return tmp;
	}
}