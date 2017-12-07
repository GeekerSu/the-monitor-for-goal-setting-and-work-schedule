package com;

import com.opensymphony.xwork2.ActionSupport;

public class CommonAction extends ActionSupport {
	private String sharePath;
	private String fileName;
	private String usr;
	private String standardFileName;
	
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
	
	public String execute(){
		sharePath="./pdfjs/viewer.html?file=../"+"work/"+usr+"/share/"+fileName.substring(0,fileName.length()-4)+"share.pdf";
		standardFileName=fileName.substring(0,fileName.length()-4)+"±ê×¼ÎÄµµ.pdf";
		return SUCCESS;
	}
	
	
}
