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

/** 
* @author 

* @version 创建时间：2017年3月6日 下午1:54:00 
* 文件下载的2种方式：
*     方式1：通过response对象向浏览器写入字节流数据，设置下载的响应头
*     方式2：struts的方式

>>>>>>>
*/
public class DownAction extends ActionSupport{
    private static final long serialVersionUID = 1L;

  //1:得到upload目录路径
	private String usr=(String) ActionContext.getContext().getSession().get("username");
    private String path="C:\\git-repositories\\ReadingNotes\\WebContent\\work\\"+usr;    
    //第一步：显示所有要下载的文件的列表

    private String filePath="";
    public String list() throws Exception { 

        File file=new File(path);
        if (!file.exists()){
        	file.mkdirs();
        }
      //3:得到所有要下载的文件的文件名
        String[] fileNames=file.list();
        //4:保存
        ActionContext ac=ActionContext.getContext();
        //5:得到代表request的Map(第二种方式)
        @SuppressWarnings("unchecked")
		Map<String,Object> request=(Map<String,Object>)ac.get("request"); 
        request.put("fileNames", fileNames);
        return "list";
    }
    private String fileName;
    public void setFileName(String fileName) {

        //处理传入的参数种问题（get提交）
        try {
            fileName=new String(fileName.getBytes("ISO8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException();
        }
        //把处理好的文件名，赋值
        this.fileName = fileName;
    }
    public String down() throws Exception {
        return "download";
    }
    
    public String getFilePath(){
    	return this.filePath;
    }

    public String view() throws Exception {
    	System.out.println(filePath);
    	filePath="work/"+usr+"/"+fileName;
    	System.out.println(filePath);
    	return "view";
    }



    public InputStream getAttrInputStream() throws FileNotFoundException{
    	System.out.println("Start downloading...");
    	System.out.println(fileName);
//        return ServletActionContext.getServletContext()
//        		.getResourceAsStream("C:\\Users\\10297\\workspacee\\ReadingNotes\\work\\"+fileName);
    	return new FileInputStream(path+"\\"+fileName);
    }

    


    public String getDownFileName(){
        try{
            //import java.net.URLEncoder;
            fileName = URLEncoder.encode(fileName,"UTF-8");
        }catch(Exception e){
            throw new RuntimeException();
        } 
        return fileName;     
    }
}