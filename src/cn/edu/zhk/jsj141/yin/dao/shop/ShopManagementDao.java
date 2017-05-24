package cn.edu.zhk.jsj141.yin.dao.shop;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopVerify;

public class ShopManagementDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	public int getTotalCount(String keyword) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT count(*) FROM `shopVerify` WHERE loginname like ? or name like ? ";
		Object[] params = {"%"+keyword+"%", "%"+keyword+"%"};
		Map<String,Object> map = qr.query(sql, new MapHandler(), params);
		return Integer.parseInt(String.valueOf(map.get("count(*)")));
	}

	public List<ShopVerify> getCurrentPageBean(PageBean<ShopVerify> pBean, String keyword) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM `shopVerify` WHERE loginname like ? or name like ? LIMIT ?,?";
		Object[] params = {"%"+keyword+"%", "%"+keyword+"%", (pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize()};

		return qr.query(sql, new BeanListHandler<ShopVerify>(ShopVerify.class), params);
	}

	public void changeVerifyStatus(String loginname, String status) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update `shopVerify` set status=? where loginname=?";
		qr.update(sql, status, loginname);
	}

	public void delVerifyInfo(String loginname) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from `shopVerify` where loginname=?";
		qr.update(sql, loginname);
	}

}
