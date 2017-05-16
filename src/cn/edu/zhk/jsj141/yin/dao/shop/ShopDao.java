package cn.edu.zhk.jsj141.yin.dao.shop;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.edu.zhk.jsj141.yin.util.BeanMapUtil;
import cn.edu.zhk.jsj141.yin.util.JDBCUtils;
import cn.edu.zhk.jsj144.liao.entity.shop.ShopInfo;

//店铺信息Dao层
public class ShopDao {
	private QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
	
	/**
	 * 获取店铺信息
	 * @param uid
	 * @return
	 * @throws SQLException 
	 */
	public ShopInfo getShopInfo(String uid) throws SQLException {
		String sql = "select * from shop where sellerid = ?";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(), uid);
		ShopInfo shopInfo = new ShopInfo();
		BeanMapUtil.mapToBean(mapList.get(0), shopInfo);
		return shopInfo;
	}
	
	/**
	 * 添加店铺信息
	 * @param shopInfo
	 * @throws SQLException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	@SuppressWarnings("unchecked")
	public void addShopInfo(ShopInfo shopInfo) throws SQLException, InstantiationException, IllegalAccessException {
		String sql = "insert into shop values(?,?,?,?,?,?,?,?,?,?,?,?)";
		List<Map<String, Object>> maps = (List<Map<String, Object>>) BeanMapUtil.beanToMap(shopInfo);
		List<ShopInfo> params = BeanMapUtil.mapsToObjects(maps, ShopInfo.class);
		qr.update(sql, params);
	}
	
	/**
	 * 修改店铺信息
	 * @param shopInfo
	 */
	public void editShopInfo(ShopInfo shopInfo) {
		
	}
}
