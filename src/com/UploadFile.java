package com;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.omg.CORBA.Object;
import java.io.IOException;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
public class UploadFile extends ActionSupport {
	/**	
	 * 	
	 */
	private static final long serialVersionUID = 1L;
	private File myFile;//实际文件的上载
	private String myFileContentType;//文件的内容类型
	private String myFileFileName;//被上传的文件名称
	private String destPath;
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public String getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}


	//方法1：使用FileUtils的copyFile来实现文件上传
	// 通过FileUtil.copyFiles

	public String execute() {
		Map<String, java.lang.Object> session = ActionContext.getContext().getSession();
		String usr = (String) session.get("username");
		destPath=ServletActionContext.getServletContext().getRealPath("/work")+"/"+usr;
		File dir = new File(destPath);
		if (!dir.exists()) {
			dir.mkdirs();
			System.out.println("Create director: " + usr);
		}
		try {
			//System.out.println("Src File name: " + myFile);
			//System.out.println("Dst File name: " + myFileFileName);
			File destFile = new File(destPath, myFileFileName);
			ActionContext.getContext().put("message", "Uploading Success!");
			FileUtils.copyFile(myFile, destFile);
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}
	//方法2：使用文件流来实现文件上传
	//通过FileOutputStream
	public String executeStream() throws IOException {
		Map<String, java.lang.Object> session = ActionContext.getContext().getSession();
		String usr=(String) session.get("username");
		destPath = ServletActionContext.getServletContext().getRealPath("/work")+"/"+usr;
		FileOutputStream fos = new FileOutputStream(destPath + myFileFileName);
		FileInputStream fis = new FileInputStream(myFile);
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0)
		{
			fos.write(buffer, 0, len);
		}
		fos.close();
		fis.close();
		return SUCCESS;
	}
}