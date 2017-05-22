package cn.edu.zhk.jsj141.yin.dao.customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import cn.edu.zhk.jsj141.feng.entity.user.User;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.pager.PageBean;

public class CustomerManagementDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	public int getTotalCount(String param) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT count(*) FROM `user` WHERE loginname like ? or email like ? or phone like ? ";
		Object[] params = {"%"+param+"%", "%"+param+"%", "%"+param+"%"};
		Map<String,Object> map = qr.query(sql, new MapHandler(), params);
		return Integer.parseInt(String.valueOf(map.get("count(*)")));
	}

	public List<User> getCurrentPageBean(PageBean<User> pBean,
			String param) throws SQLException {
		// TODO Auto-generated method stub
		String sql="SELECT * FROM `user` WHERE loginname like ? or email like ? or phone like ? LIMIT ?,?";
		Object[] params = {"%"+param+"%", "%"+param+"%", "%"+param+"%", (pBean.getCurrentPage()-1)*pBean.getPageSize(), pBean.getPageSize()};

		return qr.query(sql, new BeanListHandler<User>(User.class), params);
	}

	public void resetUserPwd(String uid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update `user` set loginpass='' where uid=?";
		qr.update(sql, uid);
	}

	public void delUser(String uid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from `user` where uid=?";
		qr.update(sql, uid);
	}

	public boolean hasShop(String uid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from `shop` where sellerid=?";
		Map<String, Object> shopInfo = qr.query(sql, new MapHandler(), uid);
		if(shopInfo == null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean hasOrder(String uid) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from `order` where uid=?";
		Map<String, Object> order = qr.query(sql, new MapHandler(), uid);
		if(order == null) {
			return false;
		} else {
			return true;
		}
	}

}
