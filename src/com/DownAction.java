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

* @version 鍒涘缓鏃堕棿锛�2017骞�3鏈�6鏃� 涓嬪崍1:54:00 

* 鏂囦欢涓嬭浇鐨�2绉嶆柟寮忥細

*     鏂瑰紡1锛氶�氳繃response瀵硅薄鍚戞祻瑙堝櫒鍐欏叆瀛楄妭娴佹暟鎹紝璁剧疆涓嬭浇鐨勫搷搴斿ご

*     鏂瑰紡2锛歴truts鐨勬柟寮�

*/
public class DownAction extends ActionSupport{

	
    private static final long serialVersionUID = 1L;
    
  //1:寰楀埌upload鐩綍璺緞
	private String usr=(String) ActionContext.getContext().getSession().get("username");
    private String path="C:\\Users\\10297\\workspacee\\ReadingNotes\\WebContent\\work\\"+usr;
    private String filePath="";
    //绗竴姝ワ細鏄剧ず鎵�鏈夎涓嬭浇鐨勬枃浠剁殑鍒楄〃
    public String list() throws Exception { 
        //2:鐩綍瀵硅薄
        File file=new File(path);
        if (!file.exists()){
        	file.mkdirs();
        }
      //3:寰楀埌鎵�鏈夎涓嬭浇鐨勬枃浠剁殑鏂囦欢鍚�

        String[] fileNames=file.list();

        //4:淇濆瓨

        ActionContext ac=ActionContext.getContext();

        //5:寰楀埌浠ｈ〃request鐨凪ap(绗簩绉嶆柟寮�)

        @SuppressWarnings("unchecked")

		Map<String,Object> request=(Map<String,Object>)ac.get("request");

        

        request.put("fileNames", fileNames);

        return "list";

    }

    

    //*************2锛氭枃浠朵笅杞�************************/

    //2.1锛氳幏鍙栬涓嬭浇鐨勬枃浠剁殑鏂囦欢鍚�,璁剧疆瀛楃闆嗭紝鍓嶅彴椤甸潰鎻愪氦鐨勬槸浠et鏂瑰紡鎻愪氦鐨�

    private String fileName;

    

    public void setFileName(String fileName) {

        //澶勭悊浼犲叆鐨勫弬鏁扮闂锛坓et鎻愪氦锛�

        try {

            fileName=new String(fileName.getBytes("ISO8859-1"),"UTF-8");

        } catch (UnsupportedEncodingException e) {

            throw new RuntimeException();

        }

        //鎶婂鐞嗗ソ鐨勬枃浠跺悕锛岃祴鍊�

        this.fileName = fileName;

    }
  
    //2.2锛氫笅杞芥彁浜ょ殑涓氬姟鏂规硶锛堝湪struts.xml涓厤缃繑鍥瀞tream锛�

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

    //2.3锛氳繑鍥炴祦鐨勬柟娉�

    public InputStream getAttrInputStream() throws FileNotFoundException{

    	System.out.println("Start downloading...");

    	System.out.println(fileName);

//        return ServletActionContext.getServletContext()

//        		.getResourceAsStream("C:\\Users\\10297\\workspacee\\ReadingNotes\\work\\"+fileName);

    	return new FileInputStream(path+"\\"+fileName);

    }

    

    //2.4:涓嬭浇鏄剧ず鐨勪腑鏂囧悕锛岋紙娴忚鍣ㄦ樉绀虹殑鏂囦欢鍚嶏級

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