package cn.edu.zhk.jsj141.yin.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConnectionManager {

	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://127.0.0.1:3306/goods";
	private static String userName = "root";
	private static String password = "";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection conn = null;

		Class.forName(ConnectionManager.driverName);
		conn = DriverManager.getConnection(ConnectionManager.url,
				ConnectionManager.userName, ConnectionManager.password);
		return conn;
	}

	public static List<Map<String, Object>> resultSetToList(ResultSet rs)
			throws SQLException {
		if (rs == null)
			return Collections.emptyList();
		ResultSetMetaData md = rs.getMetaData();
		int columnCount = md.getColumnCount();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		HashMap<String, Object> rowData = new HashMap<String, Object>();
		while (rs.next()) {
			rowData = new HashMap<String, Object>(columnCount);
			for (int i = 1; i <= columnCount; i++) {
				rowData.put(md.getColumnName(i), rs.getObject(i));
			}
			list.add(rowData);
		}
		return list;
	}
}
