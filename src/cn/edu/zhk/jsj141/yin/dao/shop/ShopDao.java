package cn.edu.zhk.jsj141.yin.dao.shop;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.lang.ArrayUtils;

import cn.edu.zhk.jsj141.yin.util.BeanMapUtil;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopInfo;

//店铺信息Dao层
public class ShopDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 获取店铺信息
	 * 
	 * @param uid
	 * @return
	 * @throws SQLException
	 */
	public ShopInfo getShopInfo(String uid) throws SQLException {
		String sql = "select * from shop where sellerid = ?";
		List<Map<String, Object>> mapList = qr.query(sql, new MapListHandler(), uid);
		ShopInfo shopInfo = null;
		if (!mapList.isEmpty()) {
			shopInfo = new ShopInfo();
			BeanMapUtil.mapToBean(mapList.get(0), shopInfo);
		}
		return shopInfo;
	}

	/**
	 * 添加店铺信息
	 * 
	 * @param shopInfo
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	public void addShopInfo(ShopInfo shopInfo) throws SQLException {
		Map<String, Object> map = (Map<String, Object>) BeanMapUtil.beanToMap(shopInfo);
		
		String attr = (String) map.keySet().toArray()[0];
		for (int i = 1; i < 12; i++) {  // 拼接属性字段
			attr = attr + "," + (String) map.keySet().toArray()[i];
		}
		
		String sql = "insert into shop(" + attr + ") values(?,?,?,?,?,?,?,?,?,?,?,?)";
		qr.update(sql, map.values().toArray());
	}

	/**
	 * 修改店铺信息
	 * 
	 * @param shopInfo
	 * @throws SQLException 
	 */
	public void editShopInfo(ShopInfo shopInfo) throws SQLException {
		Map<String, Object> map = (Map<String, Object>) BeanMapUtil.beanToMap(shopInfo);
		
		String attr = "";
		for (int i = 0; i < 12; i++) {  // 拼接属性字段
			attr = attr + (String) map.keySet().toArray()[i] + "=?, ";
		}
		attr = attr.substring(0, attr.length()-2); //去除最后的逗号
		
		String sql = "update shop set " + attr + "where shopid = '" + shopInfo.getShopid() + "'";
		qr.update(sql, map.values().toArray());
	}
}
