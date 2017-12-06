package dao;

import java.sql.*;

public class Dao {
	Connection con = null;
	Statement stat = null;
	ResultSet rs = null;

	public Dao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8&oldsyntax=true&zeroDateTimeBehavior=convertToNull", "root", "");
			System.out.println("Success Connecting to Database");
			stat = con.createStatement();
		} catch (Exception e) {
			System.out.println("fail Connecting to Database");
			// TODO: handle exception
			con = null;
		}
	}

	public ResultSet executeQuery(String sql) {
		try {
			rs = stat.executeQuery(sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			rs = null;
		}
		return rs;
	}

	public int executeUpdate(String sql) {
		try {
			stat.executeUpdate(sql);
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
}