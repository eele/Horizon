package cn.edu.zhk.jsj141.yin.dao.order;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import cn.edu.zhk.jsj141.feng.entity.order.Order;
import cn.edu.zhk.jsj141.feng.entity.pager.PageBean;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;

public class OrderDao {
private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	/**
	 * 查询订单状态
	 * @param oid
	 * @return
	 * @throws SQLException 
	 */
	public int findStatus(String oid) throws SQLException {
		return 0;
	}
	
	/**
	 * 修改订单状态
	 * @param oid
	 * @param status
	 * @throws SQLException
	 */
	public void updateStatus(String oid, int status) throws SQLException {

	}
	
	/**
	 * 加载订单
	 * @param oid
	 * @return
	 * @throws SQLException
	 */
	public Order load(String oid) throws SQLException {
		return null;
	}
	
	/**
	 * 生成订单
	 * @param order
	 * @throws SQLException 
	 */
	public void add(Order order) throws SQLException {

	}
	
	/**
	 * 按用户查询订单
	 * @param uid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByUser(String uid, int pc) throws SQLException {
		return null;
	}
	
	/**
	 * 查询所有
	 */
	public PageBean<Order> findAll(int pc) throws SQLException {
		return null;
	}
	
	/**
	 * 按状态查询
	 * @param status
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Order> findByStatus(int status, int pc) throws SQLException {
		return null;
	}
}
