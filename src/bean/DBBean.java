package bean;

import java.sql.*;

public class DBBean {
	private String driverStr = "com.mysql.jdbc.Driver";
	private String connStr;
	private Connection conn;
	private Statement stmt;

	public DBBean() {

		try {
			Class.forName(driverStr).newInstance();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public ResultSet executeQuery(String sql) {

		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(connStr);
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery(sql); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public int executeUpdate(String sql) {
		int result = 0;
		try {
			conn = DriverManager.getConnection(connStr);
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql); 

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void close() { 
		try {
			stmt.close();
			conn.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public String getDriverStr() {
		return driverStr;
	}

	public void setDriverStr(String driverStr) {
		this.driverStr = driverStr;
	}

	public String getConnStr() {
		return connStr;
	}

	public void setConnStr(String connStr) {
		this.connStr = connStr;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

}
