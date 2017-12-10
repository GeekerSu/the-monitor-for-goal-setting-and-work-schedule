package com;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.Dao;

public class ShareAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private String usr = (String) ActionContext.getContext().getSession().get("username");
	private String path = ServletActionContext.getServletContext().getRealPath("/work") + "/" + usr + "/share";
	private String filePath = "";
	private String fileName;
	private String sharePath = "";
	private String type;
	// private String message;
	// private String note;
	private Dao dao = new Dao();
	private String sql;

	public String getNote() throws SQLException, IOException {
		String note = "";
		String path = "";
		sql = "select * from `" + usr + "` where BookName='" + fileName + "'";
		ResultSet rs = dao.executeQuery(sql);
		while (rs.next()) {
			path = rs.getString("BookNote");
		}
		if (path != null) {
			File txt = new File(path);
			if (txt.exists()) {
				BufferedReader reader = new BufferedReader(new FileReader(txt));
				String line = null;
				while ((line = reader.readLine()) != null) {
					note += line + "\n";
				}
				reader.close();
			}
		}
		return note;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}

	public String getSharePath() {
		return sharePath;
	}

	public String getStandardFileName() {
		return fileName + "标准文档";
	}

	public String getUsr() {
		return usr;
	}

	public String getType() {
		return type;
	}

	public String execute() throws IOException, SQLException, DocumentException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String current = df.format(new Date());// new Date() 获取当前系统时间
		sql = "select * from `" + usr + "` where BookName='" + fileName + "'";
		ResultSet rs = dao.executeQuery(sql);
		while (rs.next()) {
			filePath = rs.getString("BookURL");
			type = rs.getString("BookType");
		}
		sql = "insert into `" + usr + "Log`(OID,Operation,Otype,Time,Target) values(0,'分享了URL：" + fileName + "','9','"
				+ current + "','" + fileName + "')";
		if (type.equals("0")) {
			createTmptxt(fileName);
			String tmpfile = txtToPDF(fileName);
			String[] files = { filePath, tmpfile };
			generatePDF(files);
			sql = "insert into `" + usr + "Log`(OID,Operation,Otype,Time,Target) values(0,'分享了文章：" + fileName
					+ "','9','" + current + "','" + fileName + "')";
		}
		dao.executeUpdate(sql);
		return SUCCESS;
	}

	public void createTmptxt(String fileName) throws IOException, SQLException {
		// System.out.println(getNote());
		File sharetmp = new File(path);
		if (!sharetmp.exists()) {
			sharetmp.mkdirs();
		}
		File tmptxt = new File(path + "/" + fileName.substring(0, fileName.length() - 4) + "tmp.txt");
		if (!tmptxt.exists()) {
			tmptxt.createNewFile();
		}
		PrintStream ps = new PrintStream(new FileOutputStream(tmptxt));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String current = df.format(new Date());// new Date() 获取当前系统时间
		String tmp = "";
		tmp = "==================================\n" + "用户:" + usr + "\n" + "分享时间：" + current + "\n";
		ps.print(tmp);
		tmp = "==================================\n" + "操作记录:\n";
		sql = "select * from `" + usr + "Log` where Target ='" + fileName + "'";
		ResultSet rs = dao.executeQuery(sql);
		while (rs.next()) {
			tmp += "\t" + rs.getString("Operation") + "    " + rs.getString("Time") + "\n";
		}
		ps.print(tmp);
		tmp = "==================================\n" + "笔记内容:\n" + getNote() + "\n";
		ps.print(tmp);
		ps.close();
		System.out.println("Success create tmptxt");

	}

	public String txtToPDF(String fileName) throws DocumentException, IOException {
		String file = path + "/" + fileName.substring(0, fileName.length() - 4) + "tmp.pdf";
		File sharepdf = new File(file);
		if (!sharepdf.exists()) {
			sharepdf.createNewFile();
		}
		File tmptxt = new File(path + "/" + fileName.substring(0, fileName.length() - 4) + "tmp.txt");
		Document document = new Document();// 1 new a document
		FileOutputStream os = new FileOutputStream(sharepdf);
		PdfWriter writer = PdfWriter.getInstance(document, os);
		document.open();
		BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		Font font = new Font(bfChinese, 18, Font.NORMAL);
		Paragraph t = new Paragraph();
		BufferedReader read = null;
		try {
			read = new BufferedReader(new FileReader(tmptxt));
			String line = null;
			while ((line = read.readLine()) != null) {
				t = new Paragraph(line, font);
				t.setAlignment(Element.ALIGN_LEFT);
				t.setLeading(20.0f);
				document.add(t);
			}
		} catch (Exception e) {
			System.out.println("File not found");
			e.printStackTrace();
		} finally {
			try {

				read.close();
				document.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Create infopdf success");
		return file;
	}

	public void generatePDF(String[] files) {
		String newfile = path + "/" + fileName.substring(0, fileName.length() - 4) + "share.pdf";
		sharePath = "./pdfjs/viewer.html?file=../" + "work/" + usr + "/share/"
				+ fileName.substring(0, fileName.length() - 4) + "share.pdf";
		Document document = null;
		try {
			document = new Document(new PdfReader(files[0]).getPageSize(1));
			PdfCopy copy = new PdfCopy(document, new FileOutputStream(newfile));
			document.open();
			for (int i = 0; i < files.length; i++) {
				PdfReader reader = new PdfReader(files[i]);
				int n = reader.getNumberOfPages();
				for (int j = 1; j <= n; j++) {
					document.newPage();
					PdfImportedPage page = copy.getImportedPage(reader, j);
					copy.addPage(page);
				}
				reader.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			document.close();
		}
		System.out.println("Create pdfShare success");
	}

}
