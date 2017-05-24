package cn.edu.zhk.jsj141.yin.dao.admin;

import java.sql.SQLException;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;

import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.admin.Admin;

public class AdminDao {

	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	public Map<String,Object> getAdmin(String adminname) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM `admin` WHERE adminname=?";
		return qr.query(sql, new MapHandler(), adminname);
	}

	public void changePassword(Admin admin) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update admin set adminpwd = ? where adminname = ?";
		qr.update(sql, admin.getAdminpwd(), admin.getAdminname());
	}
	
}
